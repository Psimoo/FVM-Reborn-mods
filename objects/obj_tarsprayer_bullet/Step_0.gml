if global.is_paused{
	exit
}
x += move_speed
timer++
if timer <= 4* 3 - 1{
	image_index = floor(timer/3) mod 4
}
else{
	if burnt{
		image_index = floor(timer/5) mod 5
	}
	else{
		image_index = floor(timer/5) mod 5 + 4
	}
}
col = get_grid_position_from_world(x,y).col
if ((col >= start_col + 5)&& shape == 0 )||(col >= start_col + 7){
	disabled = true
}
if disabled{
	image_alpha -= 0.1
	if image_alpha <= 0{
		instance_destroy()
		exit
	}
}

if x > 2200 or y > 1200 or x < 0 or y < 0{
	instance_destroy()
	exit
}

// 类型过滤碰撞检测
if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
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
		var _list = global.enemy_by_type[$ _key];
		for (var _i = 0; _i < array_length(_list); _i++)
		{
			var _e = _list[_i];
			if (!instance_exists(_e)) continue;
			if (!ds_exists(hitted_enemy, ds_type_list)) exit;
			if (ds_list_find_index(hitted_enemy, _e.id) == -1 && !disabled
				&& _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
			{
				with (_e)
				{
					audio_play_sound(hit_sound, 0, 0)
					damage_amount = other.damage
					damage_type = other.damage_type
					event_user(0)
				}
				if (ds_exists(hitted_enemy, ds_type_list))
				{
					ds_list_add(hitted_enemy, _e.id)
				}
			}
		}
	}
}
	}
}
