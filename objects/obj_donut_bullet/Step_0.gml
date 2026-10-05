if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;
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
                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                hitted_enemy = _e.id;
                var ef = instance_create_depth(x, y, depth, obj_xiaolongbao_bullet_effect);
                var spr = spr_donut_bullet_effect;

                switch (shape)
                {
                    case 0:
                        spr = spr_donut_bullet_effect;
                        break;

                    case 1:
                        spr = spr_donut_bullet_effect_1;
                        break;

                    case 2:
                        spr = spr_donut_bullet_effect_2;
                        break;
                }

                ef.sprite_index = spr;
                instance_destroy();
                exit;
            }
        }
    }
}
	}
}

if (x > 2200 || y > 1200 || x < 0 || y < 0)
    instance_destroy();
