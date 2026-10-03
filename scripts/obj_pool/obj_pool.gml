// ============================================================
// obj_pool —— 通用对象池（子弹 / 特效 / 敌人）
//
// 原理：
//   对象"死亡"时不再真正销毁，而是用 instance_change 把实例切换成
//   无事件的空对象 obj_pool_holder（切换时会执行原对象的 Destroy 事件，
//   所以死亡结算、掉落、boss_count、敌人类型注销等逻辑完全不变），
//   实例随后进入空闲池；
//   下次创建同类型对象时，把空闲实例 instance_change 回原对象
//   （切换时会执行原对象的 Create 事件，完成状态重置），再放回场景。
//
// 池化范围：
//   子弹 / 爆炸 / 灰烬等特效（按名字自动判定）
//   敌人：只池化白名单里的几类鼠及其衍生种类
//         平民鼠 / 球迷鼠 / 铁锅鼠（基础·黄瓜/苹果/煎蛋·机器·感染 变体）
//         巨人鼠（含感染）、熊猫鼠（含小熊猫/海底/感染 变体）
//
// 开关：
//   global.obj_pool_enabled       = false  关闭对象池（退回原版：直接创建/销毁）
//   global.obj_pool_enemies       = false  关闭敌人池化（子弹/特效不受影响）
//   global.obj_pool_deck_prewarm  = 25     进关时按卡组预热：每种子弹/特效几个空壳
//   global.obj_pool_prewarm_count = 0      非卡组对象首次出现时预存几个（默认 0，只靠回收自然填充）
// 统计：
//   global._obj_pool_stats = { get, create, release, drop, prewarm }
//
// 注意：本文件内禁止直接写 instance_destroy / instance_create_depth，
//       这两个符号已被 #macro 重定向到池逻辑，必须使用 *_origfunc 版本。
// ============================================================

function obj_pool_init() {
    if (variable_global_exists("_obj_pool_ready") && global._obj_pool_ready) return;
    global._obj_pool_ready  = true;
    // 允许在初始化前就通过 global.obj_pool_enabled = false 关闭对象池
    if (!variable_global_exists("obj_pool_enabled")) global.obj_pool_enabled = true;

    global._obj_pool_lists = ds_map_create(); // object_index(字符串) -> ds_list（空闲实例）
    global._obj_pool_cache = ds_map_create(); // object_index(字符串) -> 是否可池化
    global._obj_pool_busy  = ds_map_create(); // 正在回收的实例 id(字符串) -> true
    global._obj_pool_warmed = ds_map_create(); // 已预存过的类型(字符串) -> true
    global._obj_pool_limit = 256;             // 每种对象空闲上限，超出直接销毁
    global._obj_pool_stats = { get: 0, create: 0, release: 0, drop: 0, prewarm: 0 };

    // 非卡组对象（敌人子弹等）首次出现时的预存量；默认 0，只靠死亡回收自然填充
    if (!variable_global_exists("obj_pool_prewarm_count")) global.obj_pool_prewarm_count = 0;
    // 进关时按卡组预热：每种子弹/特效预存几个空壳（由 obj_pool_prewarm_deck 使用）
    if (!variable_global_exists("obj_pool_deck_prewarm")) global.obj_pool_deck_prewarm = 25;

    // 敌人池化：只池化白名单里的这几类鼠及其衍生种类
    //   平民鼠 / 球迷鼠 / 铁锅鼠（基础·黄瓜/苹果/煎蛋·机器·感染 变体）
    //   巨人鼠（含感染）、熊猫鼠（含小熊猫/海底/感染 变体）
    if (!variable_global_exists("obj_pool_enemies")) global.obj_pool_enemies = true;
    if (!variable_global_exists("_obj_pool_enemy_bases")) {
        var _names = [
            "obj_normal_mouse", "obj_cucumber_normal_mouse", "obj_machine_normal_mouse", "obj_infected_normal_mouse",
            "obj_football_fan_mouse", "obj_apple_football_fan_mouse", "obj_machine_football_fan_mouse", "obj_infected_football_fan_mouse",
            "obj_iron_pan_mouse", "obj_egg_iron_pan_mouse", "obj_machine_iron_pan_mouse", "obj_infected_iron_pan_mouse",
            "obj_giant_mouse", "obj_infected_giant_mouse",
            "obj_panda_mouse", "obj_little_panda_mouse", "obj_infected_panda_mouse", "obj_infected_little_panda_mouse",
            "obj_undersea_panda_mouse", "obj_little_undersea_panda_mouse"
        ];
        var _bases = [];
        for (var i = 0; i < array_length(_names); i++) {
            var _o = asset_get_index(_names[i]);
            if (_o >= 0) array_push(_bases, _o);
        }
        global._obj_pool_enemy_bases = _bases;
    }
}

// 是否属于要池化的那几类鼠（含其衍生种类）
function obj_pool_is_enemy_whitelisted(_obj) {
    if (!variable_global_exists("_obj_pool_enemy_bases")) return false;
    var _b = global._obj_pool_enemy_bases;
    for (var i = 0; i < array_length(_b); i++) {
        if (_obj == _b[i] || object_is_ancestor(_obj, _b[i])) return true;
    }
    return false;
}

// 修改过 obj_pool_enemies / 判定规则后调用一次，让缓存重新计算
function obj_pool_reset_cache() {
    if (!variable_global_exists("_obj_pool_cache")) return;
    ds_map_destroy(global._obj_pool_cache);
    global._obj_pool_cache = ds_map_create();
}

// 判断某对象类型是否参与池化（结果缓存，每个类型只算一次）
// 只收"打完就消失、不会被别人用 id 长期引用"的对象：子弹、爆炸、灰烬等。
function obj_pool_is_poolable(_obj) {
    if (!variable_global_exists("_obj_pool_ready") || !global._obj_pool_ready) obj_pool_init();
    if (!global.obj_pool_enabled) return false;

    var _key = string(_obj);
    if (ds_map_exists(global._obj_pool_cache, _key)) {
        return ds_map_find_value(global._obj_pool_cache, _key);
    }

    var _name = object_get_name(_obj);
    var _ok = false;
    if (string_pos("bullet", _name) > 0)            _ok = true;
    else if (string_pos("explode", _name) > 0)      _ok = true;
    else if (string_pos("ash_death", _name) > 0)    _ok = true;
    else if (string_pos("death_effect", _name) > 0) _ok = true;
    else if (global.obj_pool_enemies && obj_pool_is_enemy_whitelisted(_obj)) _ok = true;

    ds_map_add(global._obj_pool_cache, _key, _ok);
    return _ok;
}

function obj_pool_get_list(_obj) {
    var _key = string(_obj);
    if (!ds_map_exists(global._obj_pool_lists, _key)) {
        ds_map_add(global._obj_pool_lists, _key, ds_list_create());
    }
    return ds_map_find_value(global._obj_pool_lists, _key);
}

// 预存空壳。直接创建 obj_pool_holder（无事件），取出时再 instance_change 成真对象。
// 注意：不能直接预创建真子弹——子弹 Create 里的 ds_list 等资源无法回收，
//       若跑 Destroy 又会误触发死亡结算（溅射/爆炸）。所以预存一律用空壳。
function obj_pool_prealloc(_obj, _count) {
    if (!variable_global_exists("_obj_pool_ready") || !global._obj_pool_ready) obj_pool_init();
    var _list = obj_pool_get_list(_obj);
    var _st = global._obj_pool_stats;
    var _wk = string(_obj);
    if (!ds_map_exists(global._obj_pool_warmed, _wk)) ds_map_add(global._obj_pool_warmed, _wk, true); // 手动预存过就不再自动预存
    for (var i = 0; i < _count; i++) {
        var _inst = instance_create_depth_origfunc(-100000, -100000, 100000, obj_pool_holder);
        _inst.visible = false;
        ds_list_add(_list, _inst);
    }
    _st.prewarm += _count;
}

// 取一个实例（池空则新建）。由 instance_create_depth_define 调用。
function obj_pool_acquire(_obj, _x, _y, _depth) {
    var _list = obj_pool_get_list(_obj);
    var _inst = noone;
    var _st = global._obj_pool_stats;

    // 该类型第一次出现：按 obj_pool_prewarm_count 预存，之后走懒加载
    var _key = string(_obj);
    if (!ds_map_exists(global._obj_pool_warmed, _key)) {
        ds_map_add(global._obj_pool_warmed, _key, true);
        if (global.obj_pool_prewarm_count > 0) obj_pool_prealloc(_obj, global.obj_pool_prewarm_count);
    }

    while (ds_list_size(_list) > 0) {
        _inst = ds_list_find_value(_list, ds_list_size(_list) - 1);
        ds_list_delete(_list, ds_list_size(_list) - 1);
        if (instance_exists(_inst)) break;
        _inst = noone;
    }

    if (_inst == noone) {
        _st.create++;
        return instance_create_depth_origfunc(_x, _y, _depth, _obj);
    }

    _st.get++;
    with (_inst) {
        // 先摆到目标位置：对象的 Create 里会读取出生坐标（如 birth_x / birth_y）
        x = _x;
        y = _y;
        depth = _depth;
        visible = true;

        // 抹掉上一世的变换/运动状态，尽量等价于一个全新实例（随后 Create 会再覆盖）
        image_index = 0;
        image_angle = 0;
        image_alpha = 1;
        image_blend = c_white;
        image_xscale = 1;
        image_yscale = 1;
        image_speed = 1;
        hspeed = 0;
        vspeed = 0;
        speed = 0;
        direction = 0;
        gravity = 0;
        friction = 0;

        instance_change(_obj, true); // holder.Destroy(空) -> 原对象 Create(重置)
    }
    return _inst;
}

// 回收一个实例。由 obj_pool_instance_destroy 调用。
function obj_pool_release(_inst) {
    if (!instance_exists(_inst)) return;

    var _obj = _inst.object_index;
    if (!obj_pool_is_poolable(_obj)) {
        instance_destroy_origfunc(_inst);
        return;
    }

    // Destroy 事件后变量可能被重置，先把敌人注册类型取出来
    var _enemy_type = "";
    if (variable_instance_exists(_inst, "enemy_registered_type")) {
        _enemy_type = _inst.enemy_registered_type;
    }

    // 只在"Destroy 没有注销它"时才需要兜底扫描。
    // 否则大量敌人同帧死亡时，每只都做一次 O(n) 的 array_get_index，累加就是 O(n²)。
    var _need_unregister = false;

    var _ik = string(_inst);
    if (!ds_map_exists(global._obj_pool_busy, _ik)) ds_map_add(global._obj_pool_busy, _ik, true);
    with (_inst) {
        instance_change(obj_pool_holder, true); // 执行自身 Destroy（死亡结算）
        // 池中的敌人 instance_exists 仍为 true，把血量清 0，让追踪弹/植物判定为"已死"
        if (variable_instance_exists(id, "hp")) hp = 0;
        if (variable_instance_exists(id, "enemy_registered") && enemy_registered) {
            enemy_registered = false;
            _need_unregister = true;
        }
        visible = false;
        x = -100000;
        y = -100000;
        depth = 100000;
    }
    ds_map_delete(global._obj_pool_busy, string(_inst));

    // 兜底：个别对象的 Destroy 没写 event_inherited()，此时才会走到这里
    if (_need_unregister && _enemy_type != "" && variable_global_exists("enemy_by_type")
        && variable_struct_exists(global.enemy_by_type, _enemy_type)) {
        var _ary = global.enemy_by_type[$ _enemy_type];
        if (is_array(_ary)) {
            var _idx = array_get_index(_ary, _inst);
            if (_idx != -1) array_delete(_ary, _idx, 1);
        }
    }

    var _list = obj_pool_get_list(_obj);
    var _st = global._obj_pool_stats;
    if (ds_list_size(_list) >= global._obj_pool_limit) {
        _st.drop++;
        instance_destroy_origfunc(_inst);
        return;
    }
    ds_list_add(_list, _inst);
    _st.release++;
}

// 原生销毁；销毁前打上 busy 标记。
// 关键：Destroy 事件里再调用 instance_destroy()（工程里有 20+ 个对象这么写）在原版是无害的，
// 但此时实例已处于销毁中，访问 .object_index 会报 "Unable to find instance"。
// 先打标记，让嵌套调用直接返回。
function obj_pool_destroy_native(_inst) {
    var _k = string(_inst);
    if (!ds_map_exists(global._obj_pool_busy, _k)) ds_map_add(global._obj_pool_busy, _k, true);
    instance_destroy_origfunc(_inst);
    ds_map_delete(global._obj_pool_busy, _k);
}

// instance_destroy 的替代入口（由 #macro 重定向而来）
function obj_pool_instance_destroy() {
    if (!variable_global_exists("_obj_pool_ready") || !global.obj_pool_enabled) {
        if (argument_count > 0) instance_destroy_origfunc(argument[0]);
        else instance_destroy_origfunc();
        return;
    }

    // 绝大多数调用是 instance_destroy()（销毁自己），走无数组分配的快路径
    if (argument_count == 0) {
        var _self = id;
        // 顺序很重要：instance_exists 对已销毁的 id 是安全的，先做它能省掉下面的字符串/查表；
        // 原版允许"已销毁的实例再 instance_destroy()"（工程里 with 循环重复销毁很常见）。
        if (!instance_exists(_self)) return;
        var _sk = string(_self);
        if (ds_map_exists(global._obj_pool_busy, _sk)) return; // 正在回收，忽略重复销毁
        if (obj_pool_is_poolable(_self.object_index)) obj_pool_release(_self);
        else obj_pool_destroy_native(_self);
        return;
    }

    // instance_destroy(obj_or_id)：先收集，避免边遍历边改对象列表
    var _a = argument[0];
    if (ds_map_exists(global._obj_pool_busy, string(_a))) return;
    if (!instance_exists(_a)) return;
    var _targets = [];
    with (_a) { array_push(_targets, id); }

    for (var i = 0; i < array_length(_targets); i++) {
        var _t = _targets[i];
        var _tk = string(_t);
        if (ds_map_exists(global._obj_pool_busy, _tk)) continue;
        if (!instance_exists(_t)) continue;
        if (obj_pool_is_poolable(_t.object_index)) obj_pool_release(_t);
        else obj_pool_destroy_native(_t);
    }
}

// 清空空闲池（切房间时可调用，不影响场上实例）
function obj_pool_clear() {
    if (!variable_global_exists("_obj_pool_ready")) return;

    var _keys = ds_map_keys_to_array(global._obj_pool_lists);
    for (var i = 0; i < array_length(_keys); i++) {
        var _l = ds_map_find_value(global._obj_pool_lists, _keys[i]);
        for (var j = 0; j < ds_list_size(_l); j++) {
            var _inst = ds_list_find_value(_l, j);
            if (instance_exists(_inst)) instance_destroy_origfunc(_inst);
        }
        ds_list_destroy(_l);
    }
    ds_map_destroy(global._obj_pool_lists);
    global._obj_pool_lists = ds_map_create();
}
