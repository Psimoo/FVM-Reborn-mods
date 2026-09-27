if global.is_paused{
	exit
}
timer++

if state == "start"{
	image_index = floor(timer/5) mod 9
	if timer >= 5 * 9 - 1{
		state = "corner"
		timer = 0
	}
}
if state == "corner"{
	x -= 8
	image_index = floor(timer/5) mod 8 + 9
	if x <= get_world_position_from_grid(0,0).x{
		image_alpha -= 0.1
		if image_alpha <= 0{
			instance_destroy()
		}
	}
}

with obj_card_parent{
	if grid_col == other.target_col && grid_row == other.target_row && plant_type != "lilypad" &&
	plant_id != "player" && plant_type != "coffee" && !invincible && plant_id != "cotton_candy"{
		if hp >= max_hp{
			obj_task_manager.card_loss++
		}
		instance_destroy()
	}
}

// 变异战神升级技能：对1,3,5,7行（0-indexed: 0,2,4,6）同列卡片造成20点伤害
if target_col != last_damage_col && target_col >= 0{
	with obj_card_parent{
		if grid_col == other.target_col &&
		(grid_row == 0 || grid_row == 2 || grid_row == 4 || grid_row == 6) &&
		plant_id != "player" && plant_type != "coffee" && !invincible && plant_id != "cotton_candy" &&
		plant_type != "lilypad"{
			hp -= 20
			flash_value = 30
		}
	}
	last_damage_col = target_col
}

var grid_pos = get_grid_position_from_world(x,y)
target_col = grid_pos.col
target_row = grid_pos.row