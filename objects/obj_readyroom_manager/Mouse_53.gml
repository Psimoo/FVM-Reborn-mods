if hover_card_index != -1 && !is_submenu_open{
	if deck_slot_first_empty() != -1{
		audio_play_sound(snd_button,0,0)
		var card_id = global.player_deck[| deck_sort_order[hover_card_index]];
		var _shape_info = get_card_info_simple(card_id)
		if _shape_info != false{
			add_to_deck(card_id,_shape_info.shape)
		}
	}
}
if hover_slot_index != -1 && !is_submenu_open{
	if !deck_slot_is_empty(hover_slot_index){
		audio_play_sound(snd_button,0,0)
		remove_from_deck(hover_slot_index)
	}
}
if(mouse_x > 785 && mouse_x < 1546 && mouse_y > 762 && mouse_y < 980) && !is_submenu_open{
	audio_play_sound(snd_button,0,0)
	var inst = instance_create_depth(0,0,-500,obj_level_preview)
	inst.enemy_type_list = enemy_type_list
	inst.boss_type_list = boss_type_list
}