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

var grid_pos = get_grid_position_from_world(x,y)

if flash_value > 0{
	flash_value -= 10
}

timer++

if state == "appear"{
	image_index = floor(timer/5) mod 8
	if timer >= 8*5 - 1{
		timer = 0
		state = "anim"
	}
}
else if state == "anim"{
	if hp > hurt_rate * maxhp{
		image_index = floor(timer/5) mod 70 + 8
	}
	else{
		image_index = floor(timer/5) mod 69 + 78
	}
	x -= 0.3
}
else if state == "death"{
	image_index = floor(timer/5) + 147
	if timer >= 13*5 - 2{
		timer = 62
		image_alpha -= 0.1
	}
}

if hp <= 0 && state != "death"{
	state = "death"
	timer = 0
}

if image_alpha <= 0 && hp <= 0{
	instance_destroy()
}

var zombie_grid = get_grid_position_from_world(x, y);

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
				
    // Check if in attack range
    if (is_in_front && zombie_grid.row == grid_row && !invincible && plant_type != "coffee") {
		if plant_id != "player"{
			if hp >= max_hp{
				obj_task_manager.card_loss++
			}
	        instance_destroy()
		}
		else{
			hp = 10
			event_user(2)
		}
    }
}

// Update grid position and depth

var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth ;

// Keep grid position updated

grid_col = zombie_grid.col;
grid_row = zombie_grid.row;
