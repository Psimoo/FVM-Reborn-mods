// ============================================================
// obj_pool: 延迟创建对象池系统
// 遵循“第一次使用时创建，后续复用，对局结束清空”的生命周期。
// 不开局预加载（不调用 obj_pool_prealloc），只为本局真正用到的
// 对象类型分配实例，降低开局内存与耗时，同时保留对象池对高频
// 创建/销毁的优化。
// ============================================================

// Pool storage: ds_map keyed by object_index string
// -> struct { instances, active_instances, active_count, peak_count, created_count }
global._obj_pools = noone;
global._obj_pool_initialized = false;
global.pool_shutting_down = false;

// 池记录按对象类型懒创建。第一次使用某类型时才初始化 ds_map 与对应池。
function pool_get_or_create(_obj) {
    if (!global._obj_pool_initialized) {
        global._obj_pools = ds_map_create();
        global._obj_pool_initialized = true;
    }
    var _key = string(_obj);
    if (ds_map_exists(global._obj_pools, _key)) {
        return ds_map_find_value(global._obj_pools, _key);
    }
    var _pool = {
        object_index: _obj,
        instances: ds_list_create(),
        active_instances: ds_list_create(),
        active_count: 0,
        peak_count: 0,
        created_count: 0
    };
    ds_map_add(global._obj_pools, _key, _pool);
    return _pool;
}

// 从池中取出一个闲置实例（从尾部扫描，跳过已失效引用）。
function pool_take_idle(_pool) {
    var _list = _pool.instances;
    while (ds_list_size(_list) > 0) {
        var _inst = ds_list_find_value(_list, ds_list_size(_list) - 1);
        ds_list_delete(_list, ds_list_size(_list) - 1);
        if (instance_exists(_inst)) return _inst;
    }
    return noone;
}

// 池为空时允许按需扩容（延迟创建）。取出闲置实例或新建实例，并统一
// 完成进入场内所需的最小初始化。
function pool_acquire(_obj, _x, _y, _depth) {
    var _pool = pool_get_or_create(_obj);
    var _inst = pool_take_idle(_pool);

    if (_inst == noone) {
        _inst = instance_create_depth_origfunc(_x, _y, _depth, _obj);
        _inst.pool_created_this_round = true;
        _inst.pool_generation = 0;
        _pool.created_count += 1;
    }

    _inst.x = _x;
    _inst.y = _y;
    _inst.depth = _depth;
    _inst.active = true;
    _inst.pooled = false;
    _inst.visible = true;
    _inst.image_index = 0;
    _inst.image_alpha = 1;
    _inst.image_angle = 0;
    _inst.pool_generation += 1;

    ds_list_add(_pool.active_instances, _inst);
    _pool.active_count += 1;
    _pool.peak_count = max(_pool.peak_count, _pool.active_count);

    return _inst;
}

// 把实例从活跃列表移入闲置列表，并减少活跃计数。
function pool_commit_release(_inst) {
    var _pool = pool_get_or_create(_inst.object_index);
    var _idx = ds_list_find_index(_pool.active_instances, _inst);
    if (_idx >= 0) ds_list_delete(_pool.active_instances, _idx);
    ds_list_add(_pool.instances, _inst);
    _pool.active_count = max(0, _pool.active_count - 1);
}

// 通用回收：停用、隐藏、移出画面、清空运动状态。
function pool_release(_inst) {
    if (!instance_exists(_inst)) return;
    if (_inst.pooled) return;

    with (_inst) {
        active = false;
        pooled = true;
        visible = false;
        x = -10000;
        y = -10000;
        speed = 0;
        hspeed = 0;
        vspeed = 0;
        image_index = 0;
        image_alpha = 1;
        image_angle = 0;
    }
    pool_commit_release(_inst);
}

// 第一次发射某类子弹：取池 / 建池 / 按需扩容 / 标记为场内活动对象。
function pool_acquire_bullet(_obj, _x, _y, _depth) {
    return pool_acquire(_obj, _x, _y, _depth);
}

// 子弹回收：命中、越界、撞击障碍物或生命周期结束时统一调用。
// 不得只恢复位置和可见性；旧的穿透记录、计时器、角度和动画状态都要清空。
function pool_release_bullet(_inst, _reason) {
    if (!instance_exists(_inst)) return;
    if (_inst.pooled) return;

    with (_inst) {
        active = false;
        pooled = true;
        visible = false;
        x = -10000;
        y = -10000;
        speed = 0;
        hspeed = 0;
        vspeed = 0;
        image_index = 0;
        image_alpha = 1;
        image_angle = 0;
        life_timer = 0;
        damage = 0;
        target = noone;
        hitted_enemy = [];
    }
    pool_commit_release(_inst);
}

// 第一次生成某类敌人：取池 / 建池 / 按需扩容。
function pool_acquire_enemy(_obj, _x, _y, _depth) {
    var _e = pool_acquire(_obj, _x, _y, _depth);
    _e.pooled_managed = true;
    return _e;
}

// 敌人复用重置：Create 只在首次创建执行一次，复用所有状态必须在这里显式重置。
function pool_reset_enemy(_inst, _enemy_data) {
    with (_inst) {
        active = true;
        pooled = false;
        visible = true;

        state = ENEMY_STATE.NORMAL;
        hp = maxhp;
        target_plant = noone;

        ice_timer = 0;
        frozen_timer = 0;
        stun_timer = 0;
        scare_timer = 0;
        flash_value = 0;
        is_frozen = false;
        is_slowdown = false;
        is_stun = false;
        is_scare = false;
        current_frozen = false;

        shield_hp = shield_max_hp;
        helmet_hp = helmet_max_hp;
        image_alpha = 1;
        image_index = 0;
        timer = 0;
        attack_timer = 0;

        enemy_registered = false;
        enemy_registered_type = "";
        death_reward_processed = false;
        pool_cleanup = false;
        ash_death = false;
        is_blown_away = false;

        // 出生坐标（供“传送回出生点”逻辑使用）
        birth_x = x;
        birth_y = y;
    }
}

// 注册到 global.enemy_by_type（幂等，避免重复加入同一实例）。
function pool_register_enemy(_inst) {
    if (!instance_exists(_inst)) return;
    with (_inst) {
        if (enemy_registered) return;
        if (!variable_global_exists("enemy_by_type")) global.enemy_by_type = {};
        var _reg_key = target_type;
        if (!variable_struct_exists(global.enemy_by_type, _reg_key)) {
            global.enemy_by_type[$ _reg_key] = [];
        }
        var _list = global.enemy_by_type[$ _reg_key];
        if (array_get_index(_list, id) == -1) {
            array_push(_list, id);
        }
        enemy_registered = true;
        enemy_registered_type = _reg_key;
    }
}

// 从 global.enemy_by_type 注销（回收到池内前必须调用）。
function pool_unregister_enemy(_inst) {
    if (!instance_exists(_inst)) return;
    with (_inst) {
        if (!enemy_registered) return;
        if (variable_global_exists("enemy_by_type")
            && variable_struct_exists(global.enemy_by_type, enemy_registered_type)) {
            var _list = global.enemy_by_type[$ enemy_registered_type];
            var _idx = array_get_index(_list, id);
            if (_idx != -1) array_delete(_list, _idx, 1);
        }
        enemy_registered = false;
    }
}

// 敌人死亡回收：注销类型索引后回池（死亡奖励由调用方在回收前结算一次）。
function pool_release_enemy(_inst, _reason) {
    if (!instance_exists(_inst)) return;
    if (_inst.pooled) return;

    pool_unregister_enemy(_inst);
    with (_inst) {
        active = false;
        pooled = true;
        visible = false;
        x = -10000;
        y = -10000;
    }
    pool_commit_release(_inst);
}

// 死亡掉落结算（与 obj_enemy_parent 的随机金币掉落保持一致，仅结算一次）。
function enemy_drop_reward(_inst) {
    if (!instance_exists(_inst)) return;
    with (_inst) {
        if (global.laboretory_room) return;
        var _blown_away = false;
        if (variable_instance_exists(id, "is_blown_away")) _blown_away = is_blown_away;
        if (_blown_away) return;

        var is_drop = random_range(0, 100);
        if (is_drop < 10) {
            instance_create_depth(x, y - 50, depth - 200, obj_coin);
        }
    }
}

// 对局结束统一清空本局所有对象池（可重复调用，安全）。
function pool_clear_round() {
    global.pool_shutting_down = true;

    if (variable_global_exists("_obj_pools")
        && ds_exists(global._obj_pools, ds_type_map)) {

        var _keys = ds_map_keys_to_array(global._obj_pools);
        for (var _i = 0; _i < array_length(_keys); _i++) {
            var _pool = ds_map_find_value(global._obj_pools, _keys[_i]);

            // 清理池内闲置实例
            if (variable_struct_exists(_pool, "instances")
                && ds_exists(_pool.instances, ds_type_list)) {
                for (var _j = ds_list_size(_pool.instances) - 1; _j >= 0; _j--) {
                    var _inst = _pool.instances[| _j];
                    if (instance_exists(_inst)) {
                        _inst.pool_cleanup = true;
                        instance_destroy(_inst);
                    }
                }
                ds_list_destroy(_pool.instances);
            }

            // 清理仍在场内的活动池化实例（它们不在闲置列表中）
            if (variable_struct_exists(_pool, "active_instances")
                && ds_exists(_pool.active_instances, ds_type_list)) {
                for (var _k = ds_list_size(_pool.active_instances) - 1; _k >= 0; _k--) {
                    var _a = _pool.active_instances[| _k];
                    if (instance_exists(_a)) {
                        _a.pool_cleanup = true;
                        instance_destroy(_a);
                    }
                }
                ds_list_destroy(_pool.active_instances);
            }
        }

        ds_map_destroy(global._obj_pools);
    }

    global._obj_pools = noone;
    global._obj_pool_initialized = false;
    global.pool_shutting_down = false;
}

// ============================================================
// 兼容旧接口（保留，避免既有/外部引用失效）
// ============================================================
function obj_pool_init() {
    if (!global._obj_pool_initialized) {
        global._obj_pools = ds_map_create();
        global._obj_pool_initialized = true;
    }
}

// 有界预热：为高频对象各预建少量闲置实例，把“首次创建 + Create 事件”的开销
// 从首次发射/首次生成时提前到战斗加载阶段（保持延迟池“首用即建”语义，不整池预加载）。
function obj_pool_prealloc(_obj, _count) {
    var _pool = pool_get_or_create(_obj);
    for (var _i = 0; _i < _count; _i++) {
        var _inst = instance_create_depth_origfunc(-10000, -10000, 99999, _obj);
        _inst.active = false;
        _inst.pooled = true;
        _inst.visible = false;
        _inst.pool_generation = 0;
        ds_list_add(_pool.instances, _inst);
    }
}

function obj_pool_get(_obj, _x, _y, _depth) {
    var _inst = pool_acquire(_obj, _x, _y, _depth);
    with (_inst) {
        event_user(14);
    }
    return _inst;
}

function obj_pool_release(_inst) {
    pool_release(_inst);
}

function obj_is_pooled(_inst) {
    if (!instance_exists(_inst)) return false;
    return variable_instance_exists(_inst, "pooled") && _inst.pooled;
}

function obj_pool_clear() {
    pool_clear_round();
}