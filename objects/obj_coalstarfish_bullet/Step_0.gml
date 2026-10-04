if global.is_paused{
	image_speed = 0
	exit
	
}
image_speed = 1
if burnt == 1{
	sprite_index = spr_fire_bullet
}
x += move_speed
y += y_move_speed

hit_tick++;
if (hit_tick >= hit_interval)
{
	hit_tick = 0;

	// 类型过滤碰撞检测
	if (variable_global_exists("enemy_by_type") && precise_bbox_prepare(id)
		&& bullet_enemy_reachable(id))
	{
		var _al = global._pbc_l;
		var _ar = global._pbc_r;
		var _at = global._pbc_t;
		var _aq = global._pbc_b;

		var _hit_e = noone;
		var _type_count = array_length(hittable_types);

		for (var _t = 0; _t < _type_count && _hit_e == noone; _t++)
		{
			var _key = hittable_types[_t];
			if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
			var _list = bullet_sap_type_list(id, _key);
			var _n = array_length(_list);
			for (var _i = 0; _i < _n; _i++)
			{
				var _e = _list[_i];
				if (!instance_exists(_e)) continue;
				if (_e.hp <= 0) continue;
				if (!(b_type == 0 || (b_type == 1 && row == _e.grid_row))) continue;
				if (_e.bbox_right < _al || _e.bbox_left > _ar || _e.bbox_bottom < _at || _e.bbox_top > _aq) continue;
				_hit_e = _e;
				break;
			}
		}

		if (_hit_e != noone)
		{
			with (_hit_e)
			{
				if other.burnt == 1{
					audio_play_sound(snd_fire_hit,0,0)
				}
				else{
					audio_play_sound(hit_sound,0,0)
				}
				damage_amount = other.damage
				damage_type = other.damage_type
				event_user(0)
			}
			if burnt != 0{
				var inst = instance_create_depth(x+25,y,depth,obj_fire_bullet_effect)
				inst.sprite_index = spr_fire_bullet_effect
			}
			instance_destroy()
			exit
		}
	}
}

if x > 2200 or y > 1200 or x < 0 or y < -200{
	instance_destroy()
}
