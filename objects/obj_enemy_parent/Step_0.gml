// 修改后的僵尸Step事件
if (variable_instance_exists(id, "pooled") && pooled){
	exit
}
if global.is_paused{
	exit
}

// 延迟注册到全局类型注册表：确保子对象的 target_type 已最终设置
if (!enemy_registered || enemy_registered_type != target_type) {
	if (enemy_registered) {
		var _old_list = global.enemy_by_type[$ enemy_registered_type];
		var _old_idx = array_get_index(_old_list, id);
		if (_old_idx != -1) array_delete(_old_list, _old_idx, 1);
	}
	if (!variable_global_exists("enemy_by_type")) {
		global.enemy_by_type = {};
	}
	var _reg_key = target_type;
	if (!variable_struct_exists(global.enemy_by_type, _reg_key)) {
		global.enemy_by_type[$ _reg_key] = [];
	}
	array_push(global.enemy_by_type[$ _reg_key], id);
	enemy_registered = true;
	enemy_registered_type = target_type;
}

// 保持网格位置更新
var zombie_grid = get_grid_position_from_world(x, y);
grid_col = zombie_grid.col;
grid_row = zombie_grid.row;

if ice_timer > 0{
	ice_timer--
	is_slowdown = true
}
else{
	is_slowdown = false
}
if frozen_timer > 0{
	current_frozen = true
	frozen_timer--
	is_frozen = true
}
else{
	is_frozen = false
}
if scare_timer > 0{
	scare_timer--
	is_scare = true
}
else{
	is_scare = false
}
if stun_timer > 0{
	stun_timer--
	is_stun = true
}
else{
	is_stun = false
	stun_sprite = spr_mouse_stun
}
if flash_value > 0 {
	flash_value -= 10
}
if hp <= 0{
	frozen_timer = 0
	scare_timer = 0
	left_move_flashs = 0
	stun_timer = 0
}
var current_atk_cycle = 0
var current_move_speed = 0
if is_slowdown{
	flash_speed = 12
	current_move_speed = move_speed / 2
	current_atk_cycle = atk_cycle*2
}
else{
	flash_speed = 6
	current_move_speed = move_speed
	current_atk_cycle = atk_cycle
}
if left_move_flashs > 0{
	y += y_move
	left_move_flashs--
	if (y <= get_world_position_from_grid(0,0).y + 38 && y_move < 0) || (y >= get_world_position_from_grid(0,global.grid_rows-1).y + 38 && y_move > 0){
		left_move_flashs = 0
		y_move = 0
	}
}
if is_frozen || is_scare || is_stun{
	exit
}

timer++;

// 状态处理前，先检查目标植物是否存在
if (target_plant != noone && (!instance_exists(target_plant) || target_plant.hp <= 0)) {
    target_plant = noone;  // 目标已被消灭或实例已销毁
}

// 状态机
switch(state) {
    case ENEMY_STATE.IDLE: {
        // 空闲状态不执行操作
        break;
    }
    
    case ENEMY_STATE.NORMAL: {
        // 移动和动画逻辑
        x -= current_move_speed * move_speed_modify;
        if shield_max_hp > 0 && shield_hp > 0{
			if shield_hp > hurt_rate * shield_max_hp{
				if helmet_hp > 0 && hp > maxhp - helmet_hp{
					if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod move_anim;
			        } else {
			            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim*2;
			        }
				}
				else{
			        if (hp/(maxhp - helmet_hp) > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod move_anim;
			        } else {
			            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim*2;
			        }
				}
			}
			else{
				if helmet_hp > 0 && hp > maxhp - helmet_hp{
					if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod move_anim + move_anim;
			        } else {
			            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim*3;
			        }
				}
				else{
			        if (hp/(maxhp - helmet_hp) > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod move_anim + move_anim;
			        } else {
			            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim*3;
			        }
				}
			}
		}
		else{
			if helmet_hp > 0 && hp > maxhp - helmet_hp{
				if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
		            image_index = floor(timer / flash_speed) mod move_anim;
		        } else {
		            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim;
		        }
			}
			else{
		        if (hp/(maxhp - helmet_hp) > hurt_rate) {
		            image_index = floor(timer / flash_speed) mod move_anim;
		        } else {
		            image_index = (floor(timer / flash_speed) mod move_anim) + move_anim;
		        }
			}
		}
        
        // 检测前方植物
        var plant_in_range = noone;
		
		var plant_order_list = [noone,noone,noone,noone]
        
		
        // 使用碰撞检测查找攻击范围内的植物
        with (obj_card_parent) {
			var dx = x - other.x;
			var dy = y - other.y;
			var is_in_front = false
			if other.attack_range > 0{
				is_in_front = (dx < 0 && dx > -other.attack_range);
			}
			else{
				is_in_front = (dx > 0 && dx < -other.attack_range);
			}
				
            // 检查是否在攻击范围内
            if (is_in_front && zombie_grid.row == grid_row && (feature_type!="dwarf" || (feature_type=="dwarf" && other.giant_type))) {
                // 按铲除顺序优先选择
                for (var i = 0; i < ds_list_size(global.eat_order); i++) {
                    var tar_type = ds_list_find_value(global.eat_order, i);
                    
                    if (plant_type == tar_type) {
                        plant_order_list[i] = id;
                        break;
                    }
                }
				
                
                if (plant_in_range != noone) break;
            }
        }
		
		for(var i = 0 ; i < 4 ; i++){
			if plant_order_list[i] != noone{
				plant_in_range = plant_order_list[i]
				break
			}
		}
        
        // 如果找到目标植物，进入攻击状态
        if (plant_in_range != noone) {
            state = ENEMY_STATE.ATTACK;
            target_plant = plant_in_range;
            attack_timer = 0;  // 重置攻击计时器
            timer = 0;         // 重置动画计时器
        }
        break;
    }
    
	case ENEMY_STATE.ACTING:{
		break;
	}
	
    case ENEMY_STATE.ATTACK: {
		if shield_max_hp > 0 && shield_hp > 0{
			if shield_hp > hurt_rate * shield_max_hp{
				if helmet_hp > 0 && hp > maxhp - helmet_hp{
					if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod attack_anim + move_anim * 4;
			        } else {
			            image_index = (floor(timer / flash_speed) mod attack_anim) + attack_anim*2 + move_anim * 4;
			        }
				}
				else{
			        if (hp/(maxhp - helmet_hp) > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod attack_anim + move_anim * 4;
			        } else {
			            image_index = (floor(timer / flash_speed) mod attack_anim) + attack_anim*2 + move_anim * 4;
			        }
				}
			}
			else{
				if helmet_hp > 0 && hp > maxhp - helmet_hp{
					if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod attack_anim + attack_anim + move_anim * 4;
			        } else {
			            image_index = (floor(timer / flash_speed) mod attack_anim) + attack_anim*3 + move_anim * 4;
			        }
				}
				else{
			        if (hp/(maxhp - helmet_hp) > hurt_rate) {
			            image_index = floor(timer / flash_speed) mod attack_anim + attack_anim + move_anim * 4;
			        } else {
			            image_index = (floor(timer / flash_speed) mod attack_anim) + attack_anim*3 + move_anim * 4;
			        }
				}
			}
		}
		else{
			if helmet_hp > 0 && hp > maxhp - helmet_hp{
				if ((hp + helmet_hp - maxhp)/maxhp > hurt_rate) {
		            image_index = (floor(timer / flash_speed) mod attack_anim + move_anim * 2);
		        } else {
		            image_index = (floor(timer / flash_speed) mod attack_anim + move_anim * 2 + attack_anim);
		        }
			}
			else{
		        if (hp/(maxhp - helmet_hp) > hurt_rate) {
		            image_index = (floor(timer / flash_speed) mod attack_anim + move_anim * 2);
		        } else {
		            image_index = (floor(timer / flash_speed) mod attack_anim + move_anim * 2 + attack_anim);
		        }
			}
		}
        // 攻击动画
        // 检测前方植物
        var plant_in_range = noone;
        
		var plant_order_list = [noone,noone,noone,noone]
		
        // 使用碰撞检测查找攻击范围内的植物
        with (obj_card_parent) {
			var dx = x - other.x;
			var dy = y - other.y;
			var is_in_front = false
			if other.attack_range > 0{
				is_in_front = (dx < 0 && dx > -other.attack_range);
			}
			else{
				is_in_front = (dx > 0 && dx < -other.attack_range);
			}
				
            // 检查是否在攻击范围内
            if (is_in_front && zombie_grid.row == grid_row && (feature_type!="dwarf" || (feature_type=="dwarf" && other.giant_type))) {
                // 按铲除顺序优先选择
                for (var i = 0; i < ds_list_size(global.eat_order); i++) {
                    var tar_type = ds_list_find_value(global.eat_order, i);
                    
                    if (plant_type == tar_type) {
                        plant_order_list[i] = id;
                        break;
                    }
                }
                
                if (plant_in_range != noone) break;
            }
        }
		for(var i = 0 ; i < 4 ; i++){
			if plant_order_list[i] != noone{
				plant_in_range = plant_order_list[i]
				break
			}
		}
		if (plant_in_range != noone) {
            target_plant = plant_in_range;
        }
		else{
			state = ENEMY_STATE.NORMAL;
            target_plant = plant_in_range;
            attack_timer = 0;  // 重置攻击计时器
            timer = 0;         // 重置动画计时器
		}
        
        // 攻击处理
        attack_timer++;
        if (attack_timer >= current_atk_cycle) {
            // 对目标植物造成伤害
            with (target_plant) {
				if !invincible{
					hp -= other.atk;
				}
                event_user(2)
                // 播放受击效果
                if (instance_exists(other)) {
                    //instance_create_depth(x, y, depth - 1, obj_plant_hit);
                }
            }
			
            //播放音效
			var a = irandom_range(0,2)
			audio_play_sound(ds_list_find_value(obj_battle.chomp_sound_list,a),0,0)
            // 重置攻击计时器
            attack_timer = 0;
        }
        break;
    }
    
    case ENEMY_STATE.DEAD: {
		ice_timer = 0
		frozen_timer = 0
        if (ash_death) {
            image_alpha = 0;
            break;
        }
        // 死亡动画
		if shield_max_hp > 0 && shield_hp > 0{
			if image_index >= death_anim + move_anim * 4 + attack_anim * 4 - 1 {
	            image_alpha -= 0.08;
	        } else {
	            image_index = (floor(timer / flash_speed) mod death_anim) + move_anim * 4 + attack_anim * 4;
	        }
		}
		else{
	        if image_index >= death_anim + move_anim * 2 + attack_anim * 2 - 1 {
	            image_alpha -= 0.08;
	        } else {
	            image_index = (floor(timer / flash_speed) mod death_anim) + move_anim * 2 + attack_anim * 2;
	        }
		}
        break;
    }
}

// 死亡处理
if (hp <= 0 && state != ENEMY_STATE.DEAD) {
    timer = 0;
    state = ENEMY_STATE.DEAD;
    target_plant = noone;  // 清除攻击目标
    if (ash_death) {
        image_alpha = 0;
    }
}

// 透明度处理
if (image_alpha <= 0 && state == ENEMY_STATE.DEAD) {
    // 从全局类型注册表中移除自己，避免子弹碰撞检测时报错
    if (enemy_registered && variable_global_exists("enemy_by_type")) {
        if (variable_struct_exists(global.enemy_by_type, enemy_registered_type)) {
            var _list = global.enemy_by_type[$ enemy_registered_type];
            var _idx = array_get_index(_list, id);
            if (_idx != -1) array_delete(_list, _idx, 1);
        }
        enemy_registered = false;
    }

    if (variable_instance_exists(id, "pooled_managed") && pooled_managed) {
        // 池化敌人：只结算一次死亡掉落，然后回收（不销毁）
        if (!death_reward_processed) {
            death_reward_processed = true;
            enemy_drop_reward(id);
        }
        pool_release_enemy(id, "death");
    } else {
        // 非池化敌人：保持原有生命周期
        instance_destroy();
    }
}




// 更新僵尸的网格位置和深度

var base_depth = -10 - (zombie_grid.row * 45) - (9 * 5);
depth = base_depth; // 僵尸比植物稍微靠后一点（在护罩外侧和咖啡豆之间）

if x < global.grid_offset_x-150 && hp > 0 && not place_meeting(x,y,obj_cat) && array_get_index(block_mouse_id_list,mouse_id) == -1{
	global.is_paused = true
	global.game_over = true
	instance_create_depth(room_width/2,room_height/2,-3001,obj_game_over)
	audio_play_sound(snd_lose,0,0)
}

//破冰动画
if current_frozen && not is_frozen{
	audio_play_sound(snd_mouse_unfreeze,0,0)
	var inst = instance_create_depth(x,y+50,depth,obj_unfreeze_effect)
	inst.sprite_index = ice_sprite
	ice_sprite = spr_mouse_frozen
	current_frozen = false
}