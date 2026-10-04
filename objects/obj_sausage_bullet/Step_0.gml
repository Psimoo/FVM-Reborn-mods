if global.is_paused{
	image_speed = 0
	exit

}
image_speed = 1
x += move_speed
if y > target_y{
	y -= 5
}
if x > 2200 or y > 1200 or x < 0 or y < 0{
	instance_destroy()
	exit
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
			if (!instance_exists(id)) break;
			if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
			{
				with (_e)
				{
					audio_play_sound(hit_sound, 0, 0)
					damage_amount = other.damage
					damage_type = other.damage_type
					event_user(0)
				}
				if (!instance_exists(id)) break;
				var inst = instance_create_depth(x, y, depth, obj_xiaolongbao_bullet_effect)
				inst.sprite_index = spr_sausage_bullet_effect
				instance_destroy()
				exit;
			}
		}
	}
}
	}
}
