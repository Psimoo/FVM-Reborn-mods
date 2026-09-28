if (global.is_paused) exit;

var _frame_count = sprite_get_number(sprite_index);
if (image_index >= _frame_count - 1) {
    var _result_x = spawn_x;
    var _result_y = spawn_y;
    if (spawn_platform != noone && instance_exists(spawn_platform)) {
        var _shift_x = 0;
        var _shift_y = 0;
        if (variable_instance_exists(spawn_platform, "move_axis")) {
            if (spawn_platform.move_axis == "x" && variable_instance_exists(spawn_platform, "visual_x_shift")) {
                _shift_x = spawn_platform.visual_x_shift;
            } else if (variable_instance_exists(spawn_platform, "visual_y_shift")) {
                _shift_y = spawn_platform.visual_y_shift;
            }
        }
        var _logical_world = get_world_position_from_grid(spawn_col, spawn_row);
        _result_x = _logical_world.x + _shift_x;
        _result_y = _logical_world.y + _shift_y;
    }
    var _result = random_gift_spawn_card(_result_x, _result_y, spawn_col, spawn_row, spawn_level);
    if (_result != noone && instance_exists(spawn_platform)
        && variable_instance_exists(spawn_platform, "state")
        && spawn_platform.state == "moving") {
        _result.platform_grid_lock = true;
    }
    instance_destroy();
}
