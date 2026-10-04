if global.is_paused {
    exit;
}
if burnt == 1{
	sprite_index = spr_fire_bullet
}
timer++;
image_index = (floor(timer / 3)) mod 4;

x += move_speed;

hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = bullet_sap_type_list(id, _key);
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e)) continue;
            if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                var _damage = damage
                with (_e)
                {
                    scare_timer = 30
                    left_move_flashs = 30
                    if grid_row == 0 {
                        if global.row_feature[1] == global.row_feature[0]{
                            y_move = global.grid_cell_size_y/left_move_flashs
                            grid_row += 1
                        }
                    }
                    else if grid_row == global.grid_rows - 1{
                        if global.row_feature[global.grid_rows - 2] == global.row_feature[global.grid_rows - 1]{
                            y_move = -global.grid_cell_size_y/left_move_flashs
                            grid_row -= 1
                        }
                    }
                    else{
                        var im = irandom_range(1,100)
                        var up_water = global.row_feature[grid_row - 1] != global.row_feature[grid_row]
                        var down_water = global.row_feature[grid_row + 1] != global.row_feature[grid_row]
                        if down_water {im = 25}
                        if up_water {im = 75}
                        if not (up_water && down_water){
                            if im > 50{
                                y_move = global.grid_cell_size_y/left_move_flashs
                                grid_row += 1
                            }
                            else{
                                y_move = -global.grid_cell_size_y/left_move_flashs
                                grid_row -= 1
                            }
                        }
                    }
                }
                instance_destroy()
                exit
            }
        }
    }
}
	}
}

if x > 2200 or y > 1200 or x < 0 or y < 0 {
    instance_destroy();
}