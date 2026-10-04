if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

if (burnt == 1)
    sprite_index = spr_fire_bullet;

x += abs(move_speed * 0.766);
y += (move_speed * 0.6428);

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
            if (_e.hp > 0
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    if (other.burnt == 1)
                        audio_play_sound(snd_fire_hit, 0, 0);
                    else
                        audio_play_sound(hit_sound, 0, 0);

                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                if (burnt == 0)
                {
                }
                else
                {
                    var inst = instance_create_depth(x + 25, y, depth, obj_fire_bullet_effect);
                    inst.sprite_index = spr_fire_bullet_effect;
                }

                instance_destroy();
                exit;
            }
        }
    }
}
	}
}


if (x > 2200 || y > 1200 || x < 0 || y < -200)
    instance_destroy();
