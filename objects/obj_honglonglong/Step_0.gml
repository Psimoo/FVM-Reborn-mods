if global.is_paused{
	exit
}

// Register to global enemy type registry
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

if flash_value > 0 {
	flash_value -= 10
}

// 死亡处理
if (hp <= 0 && state != BOSS_STATE.DEATH) {
	global.save_data.player.gold += 750
    timer = 0;
    state = BOSS_STATE.DEATH;
    target_plant = noone;  // 清除攻击目标
	with obj_battle{
		if boss_count <= 1 && current_wave >= total_wave - 1{
			timer_pause = true
		}
	}
}

switch state{
	case BOSS_STATE.IDLE:
		target_type = "normal"
		sprite_index = spr_honglonglong_idle
		if hp > maxhp * hurt_rate{
			image_index = 0
		}
		else{
			image_index = 1
		}
		if timer >= wait_time{
			timer = 0
			state = BOSS_STATE.LAUNCH
			wait_time = 300
		}
		break
		
	case BOSS_STATE.APPEAR:
		target_type = "normal"
		sprite_index = spr_honglonglong_appear
		
		image_index = floor(timer/5) mod 11
		
		if timer == 11 * 5 - 1{
			timer = 0
			state = BOSS_STATE.IDLE
			break
		}
		break
	
	case BOSS_STATE.SKILL2:
		target_type = "normal"
		sprite_index = spr_honglonglong_skill_2
		if timer < 480{
			if hp > maxhp * hurt_rate{
				image_index = floor(timer/5) mod 16
			}
			else{
				image_index = floor(timer/5) mod 16 + 17
			}
		}
		else{
			if hp > maxhp * hurt_rate{
				image_index = 16
			}
			else{
				image_index = 33
			}
		}
		
		if timer == 480{
			instance_create_depth(x-150,y-120,-800,obj_honglonglong_laser)
			
			// 变异版激光：0°、+45°、-45°三条激光
			var _boss_row = grid_row
			var _boss_col = grid_col
			
			with obj_card_parent{
				var _hit = false
				
				// 0° 水平激光：本行全部卡片
				if grid_row == _boss_row && plant_id != "player" && plant_type != "lilypad"{
					_hit = true
				}
				
				// +45° 斜向上激光：从BOSS位置向左上方（列-1，行-1）
				if !_hit{
					var _dc = _boss_col - grid_col
					var _dr = _boss_row - grid_row
					if _dc > 0 && _dr > 0 && _dc == _dr && plant_id != "player" && plant_type != "lilypad"{
						_hit = true
					}
				}
				
				// -45° 斜向下激光：从BOSS位置向左下方（列-1，行+1）
				if !_hit{
					var _dc2 = _boss_col - grid_col
					var _dr2 = grid_row - _boss_row
					if _dc2 > 0 && _dr2 > 0 && _dc2 == _dr2 && plant_id != "player" && plant_type != "lilypad"{
						_hit = true
					}
				}
				
				if _hit{
					if hp >= max_hp{
						obj_task_manager.card_loss++
					}
					instance_destroy()
				}
			}
			
		}
		if timer == 510{
			jump_times = 0
			timer = 0
			state = BOSS_STATE.IDLE
		}
		break
		
	case BOSS_STATE.SKILL1:
		target_type = "normal"
		sprite_index = spr_honglonglong_skill_1
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 16
		}
		else{
			image_index = floor(timer/5) mod 15 + 16
		}
		
		// 变异版导弹技能：对后排发射3枚十字爆炸导弹
		// 智能瞄准：同一行从左到右依次瞄准有卡片的格子
		if timer == 19{
			// 找出所有有卡片的行
			var _rows_with_cards = ds_list_create()
			for(var _r = 0; _r < global.grid_rows; _r++){
				var _has_card = false
				for(var _c = 0; _c < global.grid_cols; _c++){
					var _plant_list = ds_grid_get(global.grid_plants, _c, _r)
					if ds_list_size(_plant_list) > 0{
						_has_card = true
						break
					}
				}
				if _has_card{
					ds_list_add(_rows_with_cards, _r)
				}
			}
			
			// 随机选一行
			var _target_row = -1
			if ds_list_size(_rows_with_cards) > 0{
				_target_row = ds_list_find_value(_rows_with_cards, irandom_range(0, ds_list_size(_rows_with_cards)-1))
			}
			ds_list_destroy(_rows_with_cards)
			
			// 收集该行从左到右有卡片的列（后排优先，即从左到右）
			if _target_row >= 0{
				ds_list_clear(avaliable_pos)
				for(var _c = 0; _c < global.grid_cols; _c++){
					var _plant_list = ds_grid_get(global.grid_plants, _c, _target_row)
					if ds_list_size(_plant_list) > 0{
						ds_list_add(avaliable_pos, {"col":_c, "row":_target_row})
					}
				}
			}
		}
		
		// 发射3枚导弹，间隔一定时间
		var _missile_count = ds_list_size(avaliable_pos)
		if _missile_count > 0{
			if timer == 4*5 && _missile_count >= 1{
				var _p1 = ds_list_find_value(avaliable_pos, 0)
				var _m1 = instance_create_depth(x-60, y-180, -800, obj_honglonglong_missile)
				_m1.target_col = _p1.col
				_m1.target_row = _p1.row
			}
			if timer == 7*5 && _missile_count >= 2{
				var _p2 = ds_list_find_value(avaliable_pos, 1)
				var _m2 = instance_create_depth(x-60, y-180, -800, obj_honglonglong_missile)
				_m2.target_col = _p2.col
				_m2.target_row = _p2.row
			}
			if timer == 10*5 && _missile_count >= 3{
				var _p3 = ds_list_find_value(avaliable_pos, 2)
				var _m3 = instance_create_depth(x-60, y-180, -800, obj_honglonglong_missile)
				_m3.target_col = _p3.col
				_m3.target_row = _p3.row
			}
		}
		
		if timer == 16 * 5 - 1{
			ds_list_destroy(avaliable_pos)
			avaliable_pos = ds_list_create()
			timer = 0
			state = BOSS_STATE.IDLE
			jump_times += 1
		}
		break
		
	case BOSS_STATE.DISAPPEAR:
		sprite_index = spr_honglonglong_idle
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 9
		}
		else{
			image_index = floor(timer/5) mod 9 + 9
		}
		if timer == 9 * 5 - 1{
			image_alpha = 0
		}
		if timer == 210{
			var enemy_row = irandom_range(0,global.grid_rows-1)
			var enemy_pos = get_world_position_from_grid(10,enemy_row)
			x = enemy_pos.x - 50
			y = enemy_pos.y + 30
			image_alpha = 1
			var shape_i = irandom_range(1,100)
			timer = 0
			state = BOSS_STATE.APPEAR
			break
		}
		break
	case BOSS_STATE.SKILL3:
		target_type = "normal"
		sprite_index = spr_honglonglong_skill_3
		
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 24
		}
		else{
			image_index = floor(timer/5) mod 24 + 24
		}
		if timer == 14 * 5{
				// 变异版坐压：4x4范围摧毁（以目标位置为中心）
				var _center_row = target_pos.row
				var _center_col = target_pos.col
				var _cards_to_destroy = []
				with obj_card_parent{
					if grid_row >= _center_row - 1 && grid_row <= _center_row + 2
					&& grid_col >= _center_col - 1 && grid_col <= _center_col + 2
					&& !invincible && plant_id != "player"{
						array_push(_cards_to_destroy, id)
					}
				}
				for (var i = 0; i < array_length(_cards_to_destroy); i++){
					var _card = _cards_to_destroy[i]
					with _card{
						if hp >= max_hp{
							obj_task_manager.card_loss++
						}
					}
					instance_destroy(_card)
				}
			}
		if timer >= 24*5-1{
			timer = 0
			state = BOSS_STATE.IDLE
			jump_times += 1
		}
	
		break
	case BOSS_STATE.DROP:
		target_type = "air"
		sprite_index = spr_honglonglong_drop
		
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 21
		}
		else{
			image_index = floor(timer/5) mod 21 + 21
		}
		if timer == 21 * 5 - 1{
			timer = 0
			if jump_times == 1{
				state = BOSS_STATE.SKILL1
			}
			else{
				state = BOSS_STATE.SKILL2
			}
		}
		break
	case BOSS_STATE.LAUNCH:
		target_type = "air"
		sprite_index = spr_honglonglong_launch
		
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 27
		}
		else{
			image_index = floor(timer/5) mod 27 + 27
		}
		if timer == 27 * 5 - 1{
			if jump_times == 0 || jump_times == 2{
				target_pos.row = irandom_range(1,global.grid_rows-1)
				target_pos.col = irandom_range(3,6)
				var land_pos = get_world_position_from_grid(target_pos.col,target_pos.row)
				x_move_speed = (land_pos.x-10 - x)/180
				y_move_speed = (land_pos.y+33 - y)/180
				timer = 0
				state = BOSS_STATE.MOVE
			}
			else{
				target_pos.row = irandom_range(1,global.grid_rows-1)
				target_pos.col = 10
				var land_pos = get_world_position_from_grid(target_pos.col,target_pos.row)
				x_move_speed = (land_pos.x-80 - x)/180
				y_move_speed = (land_pos.y+33 - y)/180
				timer = 0
				state = BOSS_STATE.MOVE
			}
		}
		break
	case BOSS_STATE.MOVE:
		target_type = "air"
		if x_move_speed <= 0{
			sprite_index = spr_honglonglong_move_forward
		}
		else{
			sprite_index = spr_honglonglong_move_backword
		}
		
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 6
		}
		else{
			image_index = floor(timer/5) mod 6 + 6
		}
		x += x_move_speed
		y += y_move_speed
		if timer >= 180{
			timer = 0
			if jump_times == 0 || jump_times == 2{
				state = BOSS_STATE.SKILL3
			}
			else{
				state = BOSS_STATE.DROP
			}
		}
		
		break
	
	
	case BOSS_STATE.DEATH:
		sprite_index = spr_honglonglong_death
		image_index = floor(timer/5) mod image_number
		if timer >= image_number * 5{
			image_alpha -= 0.1
			image_index = image_number - 1
		}
		break
}


timer ++


// 透明度处理
if (image_alpha <= 0 && state == BOSS_STATE.DEATH) {
    instance_destroy();
}


var zombie_grid = get_grid_position_from_world(x, y);

// 更新僵尸的网格位置和深度

var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth - 4.5; // 僵尸比植物稍微靠后一点（在护罩外侧和咖啡豆之间）

// 保持网格位置更新

grid_col = zombie_grid.col;
grid_row = zombie_grid.row;

