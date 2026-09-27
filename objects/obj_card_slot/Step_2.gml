if card_id == "magic_chicken"{
	var _blacklist = ["brahma","magic_chicken","ice_cream"]
	if global.last_placed_card_id != "" && array_get_index(_blacklist,global.last_placed_card_id) == -1{
		var card_save_data = get_card_info_simple(global.last_placed_card_id)
		if card_save_data != false{
			var prev_card_info = get_plant_data_with_skill(global.last_placed_card_id,card_save_data.shape,card_save_data.level,card_save_data.skill)
			if prev_card_info == undefined{
				exit
			}
			cost = prev_card_info[? "cost"]
			if cooldown_timer >= cooldown{
				cooldown = prev_card_info[? "cooldown"]
				//检查食谱
				var cookbook_list = global.save_data.equipped_cookbook
				for(var i = 0 ; i < array_length(cookbook_list) ; i++){
					for(var j = 0 ; j < array_length(cookbook_list[i]) ; j++){
						var cookbook_data = get_cookbook_data(cookbook_list[i][j])
						var modifs = cookbook_data.modif
						for(var k = 0 ; k < array_length(modifs) ; k++){
							if array_get_index(modifs[k].card_id,global.last_placed_card_id) != -1{
								if variable_instance_exists(self,modifs[k].modif_type){
									if modifs[k].modif_calc == "plus"{
										variable_instance_set(self,modifs[k].modif_type,variable_instance_get(self,modifs[k].modif_type)+modifs[k].amount)
									}
									else if modifs[k].modif_calc == "multiply"{
										variable_instance_set(self,modifs[k].modif_type,variable_instance_get(self,modifs[k].modif_type)*modifs[k].amount)
									}
								}
							}
						}
					}
				}
				if cooldown < 13.5 * 60{
					cooldown = 13.5 * 60
				}
				cooldown_timer = cooldown
			}
			var card_slot_data = deck_get_card_data(global.last_placed_card_id,card_save_data.shape)
			if card_slot_data != noone{
				card_spr = card_slot_data[? "sprite"]
			}
			//place_preview = card_slot_data[? "place_preview"]
			//card_obj = card_slot_data[? "obj"]
			
			current_cost = cost
			if ds_exists(global.plus_card_map, ds_type_map) && ds_map_find_value(global.plus_card_map,global.last_placed_card_id) != undefined{
				var plus_info = ds_map_find_value(global.plus_card_map,global.last_placed_card_id)
				with plus_info[0]{
					if card_save_data.shape < plus_info[1]{
						other.current_cost += 50
					}
				}
			}
		}
	}
}