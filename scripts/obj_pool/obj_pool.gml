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
