if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

x += move_speed;

var col0_x = get_world_position_from_grid(0, 0).x;
var col_last_x = get_world_position_from_grid(global.grid_cols - 1, 0).x;

if (x < col0_x - 100 || x > col_last_x + 100 || y > 1200 || y < -100)
{
    if (ds_exists(hitted_enemy, ds_type_list))
        ds_list_destroy(hitted_enemy);
    instance_destroy();
    exit;
}

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
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0
                && row == _e.grid_row
                && precise_bbox_collision(id, _e))
            {
                var _prev_hp = _e.hp;

                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                ds_list_add(hitted_enemy, _e.id);

                if (ash_kill && _prev_hp > 0 && _e.hp <= 0)
                {
                    instance_create_depth(_e.x, _e.y - 20, depth, obj_mouse_ash_death);
                }
            }
        }
    }
}
	}
}
