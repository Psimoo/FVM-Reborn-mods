if (enemy_registered && variable_global_exists("enemy_by_type")) {
    if (variable_struct_exists(global.enemy_by_type, enemy_registered_type)) {
        var _list = global.enemy_by_type[$ enemy_registered_type];
        var _idx = array_get_index(_list, id);
        if (_idx != -1) array_delete(_list, _idx, 1);
    }
    enemy_registered = false;
}

var grid_pos = get_grid_position_from_world(x, y);

if (current_grid_type != "")
    global.grid_terrains[grid_pos.row][grid_pos.col].type = current_grid_type;

if (instance_exists(banding_cave_obj))
    instance_destroy(banding_cave_obj);
