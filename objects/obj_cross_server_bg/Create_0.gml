// 使用大尺寸确保碰撞遮罩覆盖全屏，阻挡点击穿透
image_xscale = 10;
image_yscale = 10;
image_speed = 0;
is_submenu_opened = false;
level_unlocked = 0;
level_passed = 0;
selected_page = 0;

// 页签对应的远征章节。当前项目已有数据绑定到第一个章节，其他章节
// 预留独立 map id，后续加入关卡数据后即可直接启用。
cross_server_page_map_ids = [
    "cross_server",
    "cross_server_nightmare_sky",
    "cross_server_hot_hell",
    "cross_server_water_fire",
    "cross_server_voodoo_lab",
    "cross_server_frozen_ruins",
    "cross_server_desert_realm",
    "cross_server_dimension_battle"
];

function refresh_level_buttons() {
    with (obj_cross_server_level_create) instance_destroy();
    level_unlocked = 0;
    level_passed = 0;

    var _map_id = cross_server_page_map_ids[selected_page];
    if (!ds_map_exists(global.maps_map, _map_id)) return;

    var _level_list = ds_map_find_value(global.maps_map, _map_id).levels_data;
    var _level_count = array_length(_level_list);

    function is_level_unlocked(_level_data) {
        var _requirements = variable_struct_exists(_level_data, "pre_level_require")
            ? _level_data.pre_level_require : [];
        if (!is_array(_requirements) || array_length(_requirements) == 0) return true;

        for (var _req = 0; _req < array_length(_requirements); _req++) {
            if (array_get_index(global.save_data.completed_levels, _requirements[_req]) == -1) {
                return false;
            }
        }
        return true;
    }

    for (var _index = 0; _index < _level_count; _index++) {
        var _level_data = _level_list[_index];
        var _col = _index mod 4;
        var _row = _index div 4;
        var _button = instance_create_depth(416 + 405 * _col, 485 + 400 * _row, depth - 1, obj_cross_server_level_create);
        _button.level_index = _index;
        _button.cross_server_map_id = _map_id;
        _button.is_disabled = !is_level_unlocked(_level_data);
        if (_button.is_disabled == false) level_unlocked++;
        if (array_get_index(global.save_data.completed_levels, _level_data.id) != -1) level_passed++;
    }
}

instance_create_depth(x + 797, y - 490, depth - 1, obj_cross_server_closer);
refresh_level_buttons();
