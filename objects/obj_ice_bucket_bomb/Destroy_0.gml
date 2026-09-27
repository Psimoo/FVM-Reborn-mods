// Inherit the parent event
if state == CARD_STATE.IDLE{
	// alarm[0]事件 - 实际攻击执行
	// 摧毁范围内敌人
	var _x = x;
	var _y = y;
	var _range = 250

	with (obj_enemy_parent) {
		if mouse_id == "ice_residue"{
			if shape == "fire" && state == BOSS_STATE.SKILL2{
				timer = 0
				state = BOSS_STATE.STUN
			}
		}
		if mouse_id == "ice_residue_ball"{
			if shape == "fire"{
				hp -= maxhp
			}
		}
		hp -= other.atk
		if frozen_timer < other.cycle{
			frozen_timer = other.cycle
		}
		if other.shape >= 1{
			if ice_timer < 1500{
				ice_timer = 1500
			}
			if other.shape == 1{
				ice_sprite = spr_mouse_frozen_1
			}
			else{
				ice_sprite = spr_mouse_frozen_2
			}
		}
		else{
			if ice_timer < 1200{
				ice_timer = 1200
			}
			ice_sprite = spr_mouse_frozen
		}
		if other.shape == 2{
			if (point_distance(x, y, _x, _y) < _range && grid_row >= other.grid_row-1&&grid_row <= other.grid_row+1) {
		        if (immune_to_ash && hp > other.atk) {
		            // 对免疫灰烬的敌人只造成伤害
		            hp -= other.atk;
					event_user(0)
		            // 受伤效果
		            //effect_create_above(effect_smoke, x, y, 1, c_gray);
		        } else {
		            // 直接摧毁非免疫敌人
					if not ((is_boss || string_pos("infected_", mouse_id) == 1) && special_ash){
						var inst = instance_create_depth(x,y-20,depth,obj_mouse_ash_death)
						inst.sprite_index = spr_mouse_ice_death
					}
		            instance_destroy();
		            // 摧毁效果
		            //effect_create_above(ef_explosion, x, y, 1, c_yellow);
		        }
				ice_timer += 1500
				//frozen_timer += other.cycle
		    }
			
		}
	}

	// 播放倭瓜攻击效果
	//effect_create_above(ef_explosion, x, y, 2, c_white);

	// 播放攻击声音
	 audio_play_sound(snd_mouse_frozen, 0, false);
	 if global.screen_flash{
		screen_flash(merge_color(c_blue,c_white,0.5),20)
	}
	 
	var effect_inst = instance_create_depth(x,y,depth,obj_coke_bomb_explode)
	if shape == 0 {
		effect_inst.sprite_index = spr_ice_bucket_bomb_explode
	}
	else if shape == 1{
		effect_inst.sprite_index = spr_ice_bucket_bomb_explode_1
	}
	else if shape == 2{
		effect_inst.sprite_index = spr_ice_bucket_bomb_explode_2
	}
}
event_inherited()