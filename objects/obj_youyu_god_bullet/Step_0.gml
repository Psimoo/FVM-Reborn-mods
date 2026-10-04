if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

timer++;

if (timer > max_life || x > 2200 || y > 1200 || x < -200 || y < -200)
{
    instance_destroy();
    exit;
}

image_angle = point_direction(0, 0, move_x, move_y);

x += move_x;
y += move_y;

if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e)) continue;
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0
                && precise_bbox_collision(id, _e))
            {
                has_hit = true;

                var _dmg = damage;

                with (_e)
                {
                    if (other.burnt >= 1)
                        audio_play_sound(snd_fire_hit, 0, 0);
                    else
                        audio_play_sound(hit_sound, 0, 0);

                    damage_amount = _dmg;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                ds_list_add(hitted_enemy, _e.id);
                instance_destroy();
                exit;
            }
        }
    }
}
