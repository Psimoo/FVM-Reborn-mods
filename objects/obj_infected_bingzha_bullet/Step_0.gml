if global.is_paused{
	image_speed = 0
	exit
}
else{
	image_speed = 1
}

var target_x = get_world_position_from_grid(target_col,row).x

if x > 2200 or y > 1200 or x < -200 or y < -200{
	instance_destroy()
}

x += move_speed
image_angle += 1
y -= cvspeed
cvspeed -= cgravity

if x >= target_x - 10 && x <= target_x + 10{
	var erase_col = target_col
	var erase_row = row
	
	if is_final{
		// 3x3 destruction effect for final bullet
		for(var dc = -1; dc <= 1; dc++){
			for(var dr = -1; dr <= 1; dr++){
				var c = erase_col + dc
				var r = erase_row + dr
				if c >= 0 && c < global.grid_cols && r >= 0 && r < global.grid_rows{
					with (obj_card_parent) {
						if(grid_col == c && grid_row == r && plant_id != "player"){
							hp = 0
							event_user(2)
						}
					}
				}
			}
		}
	}
	else{
		// Normal single-target damage
		var plant_in_range = noone;
		var plant_order_list = [noone,noone,noone,noone]
			
		with (obj_card_parent) {
			if(grid_col == erase_col && grid_row == erase_row) {
				for (var i = 0; i < ds_list_size(global.shovel_order); i++) {
					var _shovel_type = ds_list_find_value(global.shovel_order, i);
					if (plant_type == _shovel_type) {
						plant_order_list[i] = id;
						break;
					}
				}
				if (plant_in_range != noone) break;
			}
		}
		
		for(var i = 0 ; i < array_length(plant_order_list) ; i++){
			if plant_order_list[i] != noone && instance_exists(plant_order_list[i]){
				with plant_order_list[i]{
					if plant_id != "player"{
						hp -= other.damage
						event_user(2)
					}
				}
				break
			}
		}
	}
	
	var inst = instance_create_depth(x,y,-200,obj_engineer_bullet_effect)
	if sprite_index == spr_infected_bingzha_bullet{
		inst.sprite_index = spr_infected_bingzha_bullet_effect
		inst.is_final_bullet = is_final
		if is_final{
			inst.image_index = 4
		}
		else{
			inst.image_index = 0
		}
	}
	
	instance_destroy()
}
