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

if shape == "ice"{
	spr_list = [spr_infected_bingzha_appear,spr_infected_bingzha_skill_1_ready,spr_infected_bingzha_skill_1,spr_infected_bingzha_skill_2,spr_infected_bingzha_disappear,spr_infected_bingzha_death]
}
else{
	spr_list = [spr_infected_bingzha_fire_appear,spr_infected_bingzha_fire_skill_1_ready,spr_infected_bingzha_fire_skill_1,spr_infected_bingzha_fire_skill_2,spr_infected_bingzha_fire_disappear,spr_infected_bingzha_fire_death]
}

if flash_value > 0 {
	flash_value -= 10
}

// Death handling
if (hp <= 0 && state != BOSS_STATE.DEATH) {
	global.save_data.player.gold += 750
    timer = 0;
    state = BOSS_STATE.DEATH;
    target_plant = noone;  // Clear attack target
	with obj_battle{
		if boss_count <= 1 && current_wave >= total_wave - 1{
			timer_pause = true
		}
	}
}

switch state{
	case BOSS_STATE.IDLE:
		sprite_index = spr_list[1]
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 12
		}
		else{
			image_index = floor(timer/5) mod 12
		}
		if timer >= wait_time{
			timer = 0
			if skill_count == 0{
				state = BOSS_STATE.SKILL1
				skill_count++
			}
			else{
				state = BOSS_STATE.SKILL2
				skill_count = 0
			}
		}
		break
		
	case BOSS_STATE.APPEAR:
		sprite_index = spr_list[0]
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 10
		}
		else{
			image_index = floor(timer/5) mod 10 + 10
		}
		if timer == 10 * 5 - 1{
			timer = 0
			state = BOSS_STATE.IDLE
			break
		}
		break
	
	case BOSS_STATE.SKILL2:
		sprite_index = spr_list[3]
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/5) mod 19
		}
		else{
			image_index = floor(timer/5) mod 19 + 19
		}
		
		var target_col = 0
		
		for(j = 0 ; j < global.grid_cols;j++){
			var plant_list = ds_grid_get(global.grid_plants, j, grid_row);
			if ds_list_size(plant_list) != 0{
				target_col = j
				break
			}
		}
		
		// 6 shots total: at 45, 130, 215, 300, 385, 470 (every 85 frames)
		// 6th shot (final) causes 3x3 destruction
		var shot_times = [45, 130, 215, 300, 385, 470]
		for(var s = 0; s < 6; s++){
			if timer == shot_times[s]{
				var bullet = instance_create_depth(x-60,y-180,-200,obj_infected_bingzha_bullet)
				bullet.row = grid_row
				bullet.target_col = target_col
				bullet.damage = 2000
				bullet.sprite_index = spr_infected_bingzha_bullet
				if s == 5{
					bullet.is_final = true
				}
				
				 // Get enemy position and speed
				var bullet_pos = get_world_position_from_grid(target_col,grid_row)
			    var enemy_x = bullet_pos.x
			    var enemy_y = bullet_pos.y
		    
			    // Calculate bullet flight time
			    var distance_x = enemy_x - bullet.x
			    var flight_time = clamp(75 + (distance_x/1000) * 45, 75, 120)

			    // Calculate bullet velocity
			    var total_distance_x = distance_x
			    var total_distance_y = 600
		    
			    // Parabolic motion calculation
			    bullet.move_speed = total_distance_x / flight_time
				bullet.cgravity = (2 * total_distance_y) / (flight_time * flight_time)
			    bullet.cvspeed = (total_distance_y - 0.05 * bullet.cgravity * flight_time * flight_time) / flight_time
			}
		}
		if timer >= 510{
			timer = 0
			state = BOSS_STATE.DISAPPEAR
		}
		break
		
	case BOSS_STATE.SKILL1:
		if timer <= 8 * 10 * 3 - 1{
			sprite_index = spr_list[1]
			if hp > maxhp * hurt_rate{
				image_index = floor(timer/5) mod 9
			}
			else{
				image_index = floor(timer/5) mod 9 + 9
			}
		}
		else{
			sprite_index = spr_list[2]
			if hp > maxhp * hurt_rate{
				image_index = floor((timer - 8 * 5 * 3)/5) mod 18
			}
			else{
				image_index = floor((timer - 8 * 5 * 3)/5) mod 18 + 18
			}
		}
		
		if timer == 8 * 10 * 3 + 6 * 5{
			// Create ice/fire balls in 3 rows centered on boss's row
			var ball_rows = [grid_row - 1, grid_row, grid_row + 1]
			for(var br = 0; br < 3; br++){
				var r = ball_rows[br]
				if r >= 0 && r < global.grid_rows{
					var ball_pos = get_world_position_from_grid(10, r)
					var inst = instance_create_depth(ball_pos.x - 80, ball_pos.y + 30, -500, obj_infected_bingzha_ball)
					if shape == "ice"{
						inst.shape = "ice"
						inst.sprite_index = spr_infected_bingzha_ball
					}
					else{
						inst.shape = "fire"
						inst.sprite_index = spr_infected_bingzha_fire_ball
					}
				}
			}
		}
		if timer == 8 * 10 * 3 + 16 * 5 - 1{
			timer = 0
			state = BOSS_STATE.DISAPPEAR
		}
		break
		
	case BOSS_STATE.DISAPPEAR:
		sprite_index = spr_list[4]
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
			x = enemy_pos.x - 80
			y = enemy_pos.y + 30
			image_alpha = 1
			var shape_i = irandom_range(1,100)
			if shape_i <= 50{shape = "ice"}
			else{shape = "fire"}
			timer = 0
			state = BOSS_STATE.APPEAR
			break
		}
		break
	case BOSS_STATE.STUN:
		
		if timer >= 300{
			timer = 0
			state = BOSS_STATE.DISAPPEAR
		}
	
		break
	
	
	case BOSS_STATE.DEATH:
		sprite_index = spr_list[5]
		image_index = floor(timer/5) mod image_number
		if timer >= image_number * 5{
			image_alpha -= 0.1
			image_index = image_number - 1
		}
		break
}


timer ++


// Alpha handling
if (image_alpha <= 0 && state == BOSS_STATE.DEATH) {
    instance_destroy();
}


var zombie_grid = get_grid_position_from_world(x, y);

// Update grid position and depth

var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth - 4.5;

// Keep grid position updated

grid_col = zombie_grid.col;
grid_row = zombie_grid.row;
