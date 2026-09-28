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
	global.save_data.player.gold += 1500
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
		sprite_index = spr_abyss_pharaoh_idle
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 14
		}
		else{
			image_index = floor(timer/5) mod 14 + 14
		}
		if timer >= wait_time{
			timer = 0
			if skill_cycle == 0{
				state = BOSS_STATE.SKILL3
			}
			else if skill_cycle == 1{
				state = BOSS_STATE.SKILL1
			}
			else if skill_cycle == 2{
				state = BOSS_STATE.SKILL2
			}
		}
		break
		
	case BOSS_STATE.APPEAR:
		sprite_index = spr_abyss_pharaoh_appear
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 58
		}
		else{
			image_index = floor(timer/5) mod 58
		}
		if timer == 58 * 5 - 1{
			timer = 0
			state = BOSS_STATE.IDLE
			break
		}
		break
	
	case BOSS_STATE.SKILL1:
		sprite_index = spr_abyss_pharaoh_skill_3
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 17
		}
		else{
			image_index = floor(timer/5) mod 17 + 17
		}
		
		if timer == 1{
			// 创建已选坐标数组
			var selected_coords = [];

			// 循环直到选出4个不同的坐标
			while (array_length(selected_coords) < 6) {
			    // 生成随机坐标
			    var rand_x = irandom_range(0, 8);
			    var rand_y = irandom_range(0, global.grid_rows - 1);
			    var new_coord = [rand_x, rand_y];
    
			    // 检查是否已存在
			    var exists = false;
			    for (var i = 0; i < array_length(selected_coords); i++) {
			        if (selected_coords[i][0] == new_coord[0] && selected_coords[i][1] == new_coord[1]) {
			            exists = true;
			            break;
			        }
			    }
    
			    // 如果不存在则添加
			    if (!exists) {
			        array_push(selected_coords, new_coord);
			    }
			}
			target_coord = selected_coords
		}
		
		
		
		if timer == 12 * 5+17*5*floor(jump_times/2) ||timer == 13 * 5+17*5*floor(jump_times/3)||timer == 14 * 5+17*5*floor(jump_times/3){
			var coord = target_coord[jump_times]
			var bandage_pos = get_world_position_from_grid(coord[0],coord[1])
			instance_create_depth(bandage_pos.x,bandage_pos.y+15,-200,obj_pharaoh_bandage)
			var erase_col = coord[0]
			var erase_row = coord[1]
			with obj_card_parent{
				if(grid_col == erase_col && grid_row == erase_row && plant_id != "player"){
					if hp >= max_hp{
						obj_task_manager.card_loss++
					}
					instance_destroy()
				}
			}
			jump_times++
		}
		
		if timer >= 17 * 5 * 2 - 1{
			skill_cycle += 1
			timer = 0
			move_target_row = irandom_range(0,global.grid_rows-1)
			var land_pos = get_world_position_from_grid(10,move_target_row)
			y_move_speed = (land_pos.y+33 - y)/180
			state = BOSS_STATE.MOVE
			jump_times = 0
		}
		break
		
	case BOSS_STATE.SKILL2:
		
			sprite_index = spr_abyss_pharaoh_skill_2
			if hp > maxhp * hurt_rate{
				image_index = floor(timer/5) mod 12
			}
			else{
				image_index = floor(timer/5) mod 12 + 12
			}
		
		
		if timer == 1{
			// 创建已选坐标数组
			var selected_coords = [];

			// 循环直到选出4个不同的坐标
			while (array_length(selected_coords) < 4) {
			    // 生成随机坐标
			    var rand_x = irandom_range(4, 8);
			    var rand_y = irandom_range(0, global.grid_rows - 1);
			    var new_coord = [rand_x, rand_y];
    
			    // 检查是否已存在
			    var exists = false;
			    for (var i = 0; i < array_length(selected_coords); i++) {
			        if (selected_coords[i][0] == new_coord[0] && selected_coords[i][1] == new_coord[1]) {
			            exists = true;
			            break;
			        }
			    }
    
			    // 如果不存在则添加
			    if (!exists) {
			        array_push(selected_coords, new_coord);
			    }
			}
			target_coord = selected_coords
		}
		
		
		
		if timer == 10 * 5  + 110 * jump_times + 1{
			var coord = target_coord[jump_times]
			var bandage_pos = get_world_position_from_grid(coord[0],coord[1])
			instance_create_depth(bandage_pos.x,bandage_pos.y-40,-200,obj_pharaoh_coffin)
			//var plant_list = ds_grid_get(global.grid_plants, coord[0],coord[1]);
			var erase_col = coord[0]
			var erase_row = coord[1]
			with obj_card_parent{
				if(grid_col == erase_col && grid_row == erase_row && plant_id != "player"){
					if hp >= max_hp{
						obj_task_manager.card_loss++
					}
					instance_destroy()
				}
			}
			jump_times++
			
		}
		if jump_times >= 4{
			skill_cycle = 0
			jump_times = 0
			timer = 0
			move_target_row = irandom_range(0,global.grid_rows-1)
			var land_pos = get_world_position_from_grid(10,move_target_row)
			y_move_speed = (land_pos.y+33 - y)/180
			state = BOSS_STATE.MOVE
		}
		break
		
	case BOSS_STATE.SKILL3:
		
		sprite_index = spr_abyss_pharaoh_skill_1
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 12
		}
		else{
			image_index = floor(timer/5) mod 12 + 12
		}
		if timer == 7*5+24*5*jump_times{
			var avaliable_line = []
			for(var i = 0 ; i < global.grid_rows; i++){
				var lf = global.row_feature[i]
				if lf == "land"{
					array_push(avaliable_line, i)
				}
			}
			var _avaliable_count = array_length(avaliable_line)
			if (_avaliable_count > 0) {
				var linei = irandom_range(0, _avaliable_count - 1)
				// 防御性检查：确保索引有效
				if (linei < 0) linei = 0
				if (linei >= _avaliable_count) linei = _avaliable_count - 1
				var hole_col = irandom_range(7, 8)
				var hole_row = avaliable_line[linei]
				var hole_pos = get_world_position_from_grid(hole_col, hole_row)
				with obj_card_parent{
					if grid_row == hole_row && grid_col == hole_col && plant_id != "player" && !invincible{
						if hp >= max_hp{
							obj_task_manager.card_loss++
						}
						instance_destroy()
					}
				}
				instance_create_depth(hole_pos.x, hole_pos.y, -5, obj_pharaoh_hole)
			}
			jump_times++
		}
		if timer >= 12*5*8-1{
			skill_cycle += 1
			timer = 0
			move_target_row = irandom_range(0, global.grid_rows-1)
			var land_pos = get_world_position_from_grid(10, move_target_row)
			y_move_speed = (land_pos.y+33 - y)/180
			state = BOSS_STATE.MOVE
			jump_times = 0
		}
		break
		
	case BOSS_STATE.DISAPPEAR:
		//break
		//sprite_index = spr_temple_pharaoh_disappear
		//if hp > maxhp * hurt_rate{
		//	image_index = floor(timer/5) mod 44
		//}
		//else{
		//	image_index = floor(timer/5) mod 44 + 44
		//}
		//if timer == 44 * 5 - 1{
		//	image_alpha = 0
		//}
		//if timer == 360{
		//	var enemy_row = irandom_range(0,global.grid_rows-1)
		//	var enemy_pos = get_world_position_from_grid(10,enemy_row)
		//	x = enemy_pos.x - 50
		//	y = enemy_pos.y + 30
		//	image_alpha = 1
		//	timer = 0
		//	state = BOSS_STATE.APPEAR
		//}
		break
		
	case BOSS_STATE.MOVE:
		sprite_index = spr_abyss_pharaoh_idle
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 14
		}
		else{
			image_index = floor(timer/5) mod 14 + 14
		}
		y += y_move_speed
		if timer >= 180{
			timer = 0
			state = BOSS_STATE.IDLE
		}
		break
	
	case BOSS_STATE.DEATH:
		sprite_index = spr_abyss_pharaoh_death
		image_index = floor(timer/5) mod image_number
		if timer >= image_number * 5{
			image_alpha = 0
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

