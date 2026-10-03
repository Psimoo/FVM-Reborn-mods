if global.is_paused{
	exit
}
if shape >= 1{
		splash_ratio = 0.5
}
x += move_speed
y -= cvspeed
cvspeed -= cgravity
image_angle -= 2
if x > 2200 or y > 1200 or x < -200 or y < -200{
	instance_destroy()
	exit
}
// 目标敌人在飞行过程中死亡，检查是否落地
if target_enemy != noone && (!instance_exists(target_enemy) or target_enemy.hp <= 0){
    if y >= thrower_y {
        // 击中地面，造成溅射伤害
		var inst = instance_create_depth(x,y,depth,obj_coffeecup_bullet_effect)
		inst.sprite_index = spr_chocolatepult_bullet_effect
		inst.image_xscale = 1.2
		inst.image_yscale = 1.2
        instance_destroy()
        exit
    }
}
if !atk_modified{
	with obj_card_parent{
		if plant_id == "fruit_tart"{
			if grid_row == other.row && ((shape <= 1 && x >= other.x) || shape >= 2){
				other.damage *= atk
				other.atk_modified = true
			}
		}
	}
}

// 类型过滤碰撞检测
if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
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
			if (!instance_exists(id)) break;
			if (!hit_enemy && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
			{
				with (_e)
				{
					audio_play_sound(hit_sound, 0, 0)
					damage_amount = other.damage
					damage_type = other.damage_type
					event_user(0)
				}
				hit_enemy = true
				hitted_enemy = _e.id
				// 命中敌人后直接产生效果并销毁，不再弹射
				if sprite_index == spr_chocolatepult_bullet_large{
                    if shape >= 1{
                        if _e.stun_timer <240{
                            _e.stun_timer = 240
                        }
                    }
                    else{
                        if _e.stun_timer <420{
                            _e.stun_timer = 420
                        }
                    }
                    _e.stun_sprite = spr_mouse_stick
                }
                else{
                    var inst = instance_create_depth(x,y,depth,obj_coffeecup_bullet_effect)
                    inst.sprite_index = spr_chocolatepult_bullet_effect
                    inst.image_xscale = 1.2
                    inst.image_yscale = 1.2
                }
				instance_destroy()
				exit
			}
		}
	}
}
}
