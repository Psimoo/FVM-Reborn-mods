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

// 碰撞判定降频：海星子弹每 hit_interval 帧才扫描一次敌人（本对象 = 3 帧，其它子弹用 2 帧）。
// 子弹一帧只移动 8px，敌人 bbox 有 100px 以上，3 帧判一次也不会穿过敌人。
// 出界销毁仍然每帧检查。
hit_tick++;
if (hit_tick >= hit_interval)
{
	hit_tick = 0;

	// 类型过滤碰撞检测
	// 本帧先把自身旋转包围盒算一次（precise_bbox_prepare），循环里直接内联比较
	// _e.bbox_*，不再对场上每一只敌人都调用一次 precise_bbox_collision。
	// 判断顺序与原版一致：instance_exists -> hp -> b_type/row -> bbox 重叠。
	if (variable_global_exists("enemy_by_type") && precise_bbox_prepare(id))
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
			var _list = global.enemy_by_type[$ _key];
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
