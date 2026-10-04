function obj_pool_init() {
    if (variable_global_exists("_obj_pool_ready") && global._obj_pool_ready) return;
    global._obj_pool_ready  = true;

    if (!variable_global_exists("obj_pool_enabled")) global.obj_pool_enabled = true;

    global._obj_pool_lists = ds_map_create();
    global._obj_pool_cache = ds_map_create();
    global._obj_pool_busy  = ds_map_create();
    global._obj_pool_warmed = ds_map_create();
    global._obj_pool_limit = 256;
    global._obj_pool_stats = { get: 0, create: 0, release: 0, drop: 0, prewarm: 0 };

    if (!variable_global_exists("obj_pool_prewarm_count")) global.obj_pool_prewarm_count = 0;

    if (!variable_global_exists("obj_pool_deck_prewarm")) global.obj_pool_deck_prewarm = 25;

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

function obj_pool_is_enemy_whitelisted(_obj) {
    if (!variable_global_exists("_obj_pool_enemy_bases")) return false;
    var _b = global._obj_pool_enemy_bases;
    for (var i = 0; i < array_length(_b); i++) {
        if (_obj == _b[i] || object_is_ancestor(_obj, _b[i])) return true;
    }
    return false;
}

function obj_pool_reset_cache() {
    if (!variable_global_exists("_obj_pool_cache")) return;
    ds_map_destroy(global._obj_pool_cache);
    global._obj_pool_cache = ds_map_create();
}

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

function obj_pool_prealloc(_obj, _count) {
    if (!variable_global_exists("_obj_pool_ready") || !global._obj_pool_ready) obj_pool_init();
    var _list = obj_pool_get_list(_obj);
    var _st = global._obj_pool_stats;
    var _wk = string(_obj);
    if (!ds_map_exists(global._obj_pool_warmed, _wk)) ds_map_add(global._obj_pool_warmed, _wk, true);
    for (var i = 0; i < _count; i++) {
        var _inst = instance_create_depth_origfunc(-100000, -100000, 100000, obj_pool_holder);
        _inst.visible = false;
        ds_list_add(_list, _inst);
    }
    _st.prewarm += _count;
}

function obj_pool_acquire(_obj, _x, _y, _depth) {
    var _list = obj_pool_get_list(_obj);
    var _inst = noone;
    var _st = global._obj_pool_stats;

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
    return noone;
}

// 池为空时允许按需扩容（延迟创建）。取出闲置实例或新建实例，并统一
// 完成进入场内所需的最小初始化。
function pool_acquire(_obj, _x, _y, _depth) {
    var _pool = pool_get_or_create(_obj);
    var _inst = pool_take_idle(_pool);

    if (_inst == noone) {
        _st.create++;
        return instance_create_depth_origfunc(_x, _y, _depth, _obj);
    }

    _st.get++;
    with (_inst) {

        x = _x;
        y = _y;
        depth = _depth;
        visible = true;

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

        instance_change(_obj, true);
    }
    return _inst;
}

function obj_pool_release(_inst) {
    if (!instance_exists(_inst)) return;

    var _obj = _inst.object_index;
    if (!obj_pool_is_poolable(_obj)) {
        instance_destroy_origfunc(_inst);
        return;
    }

    var _enemy_type = "";
    if (variable_instance_exists(_inst, "enemy_registered_type")) {
        _enemy_type = _inst.enemy_registered_type;
    }

    var _need_unregister = false;

    var _ik = string(_inst);
    if (!ds_map_exists(global._obj_pool_busy, _ik)) ds_map_add(global._obj_pool_busy, _ik, true);
    with (_inst) {
        instance_change(obj_pool_holder, true);

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

function obj_pool_destroy_native(_inst) {
    var _k = string(_inst);
    if (!ds_map_exists(global._obj_pool_busy, _k)) ds_map_add(global._obj_pool_busy, _k, true);
    instance_destroy_origfunc(_inst);
    ds_map_delete(global._obj_pool_busy, _k);
}

function obj_pool_instance_destroy() {
    if (!variable_global_exists("_obj_pool_ready") || !global.obj_pool_enabled) {
        if (argument_count > 0) instance_destroy_origfunc(argument[0]);
        else instance_destroy_origfunc();
        return;
    }

    if (argument_count == 0) {
        var _self = id;

        if (!instance_exists(_self)) return;
        var _sk = string(_self);
        if (ds_map_exists(global._obj_pool_busy, _sk)) return;
        if (obj_pool_is_poolable(_self.object_index)) obj_pool_release(_self);
        else obj_pool_destroy_native(_self);
        return;
    }

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
// ============================================================
// obj_pool: Generic object pool system for high-frequency instances
// Reduces instance_create/instance_destroy overhead by reusing instances
// ============================================================

// Pool storage: ds_map keyed by object_index string -> ds_list of pooled instances
global._obj_pools = noone;
global._obj_pool_initialized = false;

function obj_pool_init() {
    if (global._obj_pool_initialized) exit;
    global._obj_pools = ds_map_create();
    global._obj_pool_initialized = true;
}

// Pre-allocate instances for a specific object type
// _obj: object index to pool
// _count: number of instances to pre-create
function obj_pool_prealloc(_obj, _count) {
    if (!global._obj_pool_initialized) obj_pool_init();
    var _key = string(_obj);
    var _list;
    if (!ds_map_exists(global._obj_pools, _key)) {
        _list = ds_list_create();
        ds_map_add(global._obj_pools, _key, _list);
    } else {
        _list = ds_map_find_value(global._obj_pools, _key);
    }
    for (var _i = 0; _i < _count; _i++) {
        var _inst = instance_create_depth_origfunc(-10000, -10000, 99999, _obj);
        _inst.pooled = true;
        _inst.visible = false;
        ds_list_add(_list, _inst);
    }
}

// Acquire an instance from the pool (or create new if pool is empty)
// _obj: object index
// _x, _y, _depth: position and depth
// Returns the instance
function obj_pool_get(_obj, _x, _y, _depth) {
    if (!global._obj_pool_initialized) obj_pool_init();
    var _key = string(_obj);
    var _inst = noone;

    if (ds_map_exists(global._obj_pools, _key)) {
        var _list = ds_map_find_value(global._obj_pools, _key);
        // Scan from end, skip dead references
        while (ds_list_size(_list) > 0) {
            _inst = ds_list_find_value(_list, ds_list_size(_list) - 1);
            ds_list_delete(_list, ds_list_size(_list) - 1);
            if (instance_exists(_inst)) break;
            _inst = noone;
        }
    }

    if (_inst == noone) {
        _inst = instance_create_depth_origfunc(_x, _y, _depth, _obj);
    } else {
        _inst.x = _x;
        _inst.y = _y;
        _inst.depth = _depth;
        _inst.visible = true;
        _inst.pooled = false;
        // Trigger reset event (user event 14) if the object implements it
        with (_inst) {
            event_user(14);
        }
    }

    return _inst;
}

// Return an instance to the pool instead of destroying it
// _inst: instance to recycle
function obj_pool_release(_inst) {
    if (!instance_exists(_inst)) exit;
    if (!global._obj_pool_initialized) obj_pool_init();

    var _key = string(_inst.object_index);
    _inst.pooled = true;
    _inst.visible = false;
    _inst.x = -10000;
    _inst.y = -10000;

    if (!ds_map_exists(global._obj_pools, _key)) {
        ds_map_add(global._obj_pools, _key, ds_list_create());
    }
    var _list = ds_map_find_value(global._obj_pools, _key);
    ds_list_add(_list, _inst);
}

// Check if an instance is currently pooled (inactive)
function obj_is_pooled(_inst) {
    if (!instance_exists(_inst)) return false;
    return variable_instance_exists(_inst, "pooled") && _inst.pooled;
}

// Destroy all pooled instances and clear pools (call on room/cleanup)
function obj_pool_clear() {
    if (!global._obj_pool_initialized) exit;
    var _keys = ds_map_keys_to_array(global._obj_pools);
    for (var _i = 0; _i < array_length(_keys); _i++) {
        var _list = ds_map_find_value(global._obj_pools, _keys[_i]);
        if (ds_exists(_list, ds_type_list)) {
            for (var _j = 0; _j < ds_list_size(_list); _j++) {
                var _inst = ds_list_find_value(_list, _j);
                if (instance_exists(_inst)) {
                    instance_destroy(_inst);
                }
            }
            ds_list_destroy(_list);
        }
    }
    ds_map_destroy(global._obj_pools);
    global._obj_pools = noone;
    global._obj_pool_initialized = false;
}
