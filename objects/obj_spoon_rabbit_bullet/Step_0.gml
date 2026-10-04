if (global.is_paused)
    exit;

x += move_speed;
y -= cvspeed;
cvspeed -= cgravity;
image_angle -= 5;

if (x > 2200 || y > 1200 || x < -200 || y < -200)
{
    instance_destroy();
    exit;
}

if (y >= (thrower_y - 50))
{
    var inst = instance_create_depth(x, y, depth, obj_spoon_rabbit_bullet_effect);
    instance_destroy();
    exit;
}

// 类型过滤碰撞检测
if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (!hit_enemy && variable_global_exists("enemy_by_type"))
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
			if (!hit_enemy && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
			{
				with (_e)
				{
					audio_play_sound(snd_spoon_rabbit, 0, 0);
					damage_amount = other.damage;
					damage_type = other.damage_type;
					event_user(0);
				}

				instance_create_depth(_e.x, _e.y - 75, depth, obj_spoon_rabbit_bullet_effect);
				hit_enemy = true;
				hitted_enemy = _e.id;
				instance_destroy();
				exit;
			}
		}
	}
}
	}
}

