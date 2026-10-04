if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

if (burnt == 1)
    sprite_index = spr_love_god_bullet_p;

x += move_speed;

if (target_row != -1)
{
    var target_y = global.grid_offset_y + (global.grid_cell_size_y * target_row);
    var transition_speed = 0.15;
    y = lerp(y, target_y, transition_speed);
    
    if (abs(y - target_y) < 30)
        row = target_row;
}

if (x > 2200 || y > 1200 || x < 0 || y < 0)
{
    instance_destroy();
    exit;
}

// 类型过滤碰撞检测
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
            if (ds_exists(hitted_enemy, ds_type_list) && ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                if (ds_exists(hitted_enemy, ds_type_list))
                    ds_list_add(hitted_enemy, _e.id);
            }
        }
    }
}
	}
}

