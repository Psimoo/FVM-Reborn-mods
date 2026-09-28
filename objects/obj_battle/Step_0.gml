if (global.level_id == "test_level")
{
    // F2 打开情报岛敌人页。
    if (!instance_exists(obj_info_island_bg) && keyboard_check_pressed(vk_f2))
    {
        var test_info = instance_create_depth(1380, room_height / 2, -4000, obj_info_island_bg);
        test_info.depth = -10000;
        test_info.info_button_select = 2;
        with (obj_card_slot)
        {
            is_selected = false;
            if (selected_preview != noone && instance_exists(selected_preview))
                instance_destroy(selected_preview);
            selected_preview = noone;
        }
        global.selected_slot = noone;
        global.test_mouse_picker_open = true;
        global.is_paused = true;
    }

    // 选择敌人的鼠标按键释放前，不允许点击背后的地图或卡槽。
    if (global.test_mouse_picker_block_place)
    {
        if (!mouse_check_button(mb_left))
            global.test_mouse_picker_block_place = false;
    }

    // 选中情报岛敌人后，点击场上格子生成。
    var test_player = instance_find(obj_player_character, 0);
    if (test_player != noone && test_player.is_placed
        && !instance_exists(obj_info_island_bg) && global.test_mouse_picker_id != ""
        && !global.test_mouse_picker_block_place
        && mouse_check_button_pressed(mb_left))
    {
        var place_pos = get_grid_position_from_world(mouse_x, mouse_y);
        if (place_pos.col >= 0 && place_pos.col < global.grid_cols
            && place_pos.row >= 0 && place_pos.row < global.grid_rows)
        {
            var enemy_data = global.enemy_map[? global.test_mouse_picker_id];
            var place_world = get_world_position_from_grid(place_pos.col, place_pos.row);
            var test_inst = instance_create_depth(place_world.x, place_world.y + 38, 0, obj_test_mouse);
            test_inst.sprite_index = enemy_data.spr;
            test_inst.mouse_id = global.test_mouse_picker_id;
            test_inst.grid_row = place_pos.row;
            test_inst.grid_col = place_pos.col;
            test_inst.hp = 2147483647;
            test_inst.maxhp = 2147483647;
            global.test_mouse_picker_id = "";
        }
    }
}

if global.is_paused{
	exit
}

if global.lose_focus_pause{
	if !window_has_focus() && !global.is_paused{
		global.is_paused = true
	}
}

battle_time ++
// obj_controller STEP 事件
if global.debug{
	if keyboard_check_pressed(ord("M")){
		var grid_pos = get_grid_position_from_world(mouse_x,mouse_y)
		var inst = instance_create_depth(grid_pos.x,grid_pos.y+38,0,obj_sawblade_mouse)
		inst.grid_row = grid_pos.row
		inst.grid_col = grid_pos.col
		inst.frozen_timer = 0000
	}
	if keyboard_check_pressed(ord("N")){
		var enemy_row = irandom_range(0,global.grid_rows-1)
		var enemy_pos = get_world_position_from_grid(10,enemy_row)
		instance_create_depth(enemy_pos.x-80,enemy_pos.y+33,-200,obj_blonde_mary)
		boss_count++
		//var grid_pos = get_grid_position_from_world(mouse_x,mouse_y)
		//var inst = instance_create_depth(grid_pos.x,grid_pos.y+38,0,obj_mario_mouse)
		//inst.grid_row = grid_pos.row
		//inst.grid_col = grid_pos.col
		//inst.frozen_timer = 0000
	}
	if keyboard_check_pressed(ord("L")){
		var grid_pos = get_grid_position_from_world(mouse_x,mouse_y)
		var inst = instance_create_depth(grid_pos.x,grid_pos.y+38,0,obj_war_god_soldier)
		inst.grid_row = grid_pos.row
		inst.grid_col = grid_pos.col
		inst.frozen_timer = 0000
	}
	if keyboard_check_pressed(ord("K")){
		var grid_pos = get_grid_position_from_world(mouse_x,mouse_y)
		var inst = instance_create_depth(grid_pos.x,grid_pos.y+38,0,obj_war_god_summon)
		inst.grid_row = grid_pos.row
		inst.grid_col = grid_pos.col
		inst.frozen_timer = 0000
	}
	if keyboard_check_pressed(ord("B")){
		var grid_pos = get_grid_position_from_world(mouse_x,mouse_y)
		var inst = instance_create_depth(grid_pos.x,grid_pos.y+38,0,obj_conch_mouse)
		inst.grid_row = grid_pos.row
		inst.grid_col = grid_pos.col
		inst.frozen_timer = 0000
	}
	if keyboard_check_pressed(ord("J")){
		global.is_paused = true
		global.game_over = true
		var inst = instance_create_depth(room_width/2,room_height/2,-3001,obj_game_over)
		inst.sprite_index = spr_win
		audio_play_sound(snd_win,0,0)
	}

	if keyboard_check_pressed(ord("R")){
		var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
		if (grid_pos.col >= 0 && grid_pos.col < global.grid_cols && 
	        grid_pos.row >= 0 && grid_pos.row < global.grid_rows) {
    
		    var new_plant = instance_create_depth(grid_pos.x, grid_pos.y, 0,obj_small_fire);
			var depth_value = calculate_plant_depth(grid_pos.col, grid_pos.row, new_plant.plant_type);
			card_created(new_plant, grid_pos.col, grid_pos.row);
			new_plant.depth = depth_value
			new_plant.flame_produce = 15000
			new_plant.ice_timer = 600
			instance_create_depth(grid_pos.x,grid_pos.y,-2,obj_place_effect)        
			audio_play_sound(snd_place1,0,0)
		}
	}

	if keyboard_check_pressed(ord("A")){
		var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
		if (grid_pos.col >= 0 && grid_pos.col < global.grid_cols && 
	        grid_pos.row >= 0 && grid_pos.row < global.grid_rows) {
    
		    var new_plant = instance_create_depth(grid_pos.x, grid_pos.y, 0,obj_xiao_long_bao);
			var depth_value = calculate_plant_depth(grid_pos.col, grid_pos.row, new_plant.plant_type);
			card_created(new_plant, grid_pos.col, grid_pos.row);
			new_plant.depth = depth_value
			new_plant.atk = 90
			new_plant.ice_timer = 600
			new_plant.frozen_timer = 240
			instance_create_depth(grid_pos.x,grid_pos.y,-2,obj_place_effect)        
			audio_play_sound(snd_place1,0,0)
		}
	}
}

//计时器逻辑
if global.level_file.time_limit != 0 && time_limit == -1{
	time_limit = global.level_file.time_limit * 60
}
if time_limit > 0{
	if !timer_pause{
		time_limit --
	}
	if time_limit <= 0{
		global.is_paused = true
		global.game_over = true
		instance_create_depth(room_width/2,room_height/2,-3001,obj_game_over)
		audio_play_sound(snd_lose,0,0)
	}
}


if keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_lshift){
	speed_up = not speed_up
	if speed_up{
		game_set_speed(120,gamespeed_fps)
	}
	else{
		game_set_speed(60,gamespeed_fps)
	}
}

if battle_time >= (global.level_file.first_wave_delay * 60) && level_stage == "ready" {
    
    level_stage = "pre"
    audio_play_sound(snd_mouse_wave_attack, 0, 0)
    
    enemy_subwave_summon()
    
    current_subwave += 1;
}
var current_total_subwaves = 0
var wave_data = {}
if current_wave < total_wave{
	current_total_subwaves = array_length(global.level_file.waves[current_wave].subwaves)
	wave_data = global.level_file.waves[current_wave]
}
else{
	current_total_subwaves = array_length(global.level_file.waves[current_wave-1].subwaves)
	wave_data = global.level_file.waves[current_wave-1]
}

if wave_timer <= 0 && level_stage == "pre"{
	if !boss_waiting_clear {
		if(global.save_data.unlocked_items.elite_unlocked) || !global.save_data.unlocked_items.elite_unlocked && current_wave < global.level_file.elite_wave{
			if current_wave < total_wave{
				enemy_subwave_summon()
			}
			if current_subwave < current_total_subwaves-1{
				current_subwave+=1
			}
			else if current_wave < total_wave{
				if wave_data.boss_wave && global.save_data.unlocked_items.elite_unlocked{
					// BOSS波：所有小怪生成完毕，等待玩家清光后再出BOSS
					boss_waiting_clear = true
				}
				else{
					current_wave += 1
					current_subwave = 0
					audio_play_sound(snd_mouse_wave_attack,0,0)
					instance_create_depth(room_width/2,room_height/2,-300,obj_huge_wave_text)
				}
			}
		}
	}
}
if wave_timer <= 0 && level_stage == "boss"{
	enemy_subwave_summon()
	if current_subwave < current_total_subwaves-1{
		current_subwave+=1
	}
	else{
		current_subwave = 0
	}
}

if global.debug{
	if keyboard_check_pressed(ord("V")){
		if level_stage == "ready"{
			battle_time = (global.level_file.first_wave_delay * 60)
		}
		if current_subwave < current_total_subwaves{
			current_subwave+=1
		}
		else if current_wave == total_wave-1{
			global.is_paused = true
			global.game_over = true
			var inst = instance_create_depth(room_width/2,room_height/2,-3001,obj_game_over)
			inst.sprite_index = spr_win
			audio_play_sound(snd_win,0,0)
		}
		else if current_wave < total_wave{
			current_wave += 1
			current_subwave = 0
		}
	}
}

// 测试关卡：5秒伤害统计
if global.level_id == "test_level"{
	var _test_damage_total = 0
	for (var _mouse_index = 0; _mouse_index < instance_number(obj_test_mouse); _mouse_index++) {
		var _test_mouse = instance_find(obj_test_mouse, _mouse_index)
		if !variable_instance_exists(_test_mouse, "test_damage_total"){
			_test_mouse.test_damage_total = 0
		}
		_test_damage_total += _test_mouse.test_damage_total
	}
	test_dps_timer++
	if test_dps_timer >= test_dps_window{
		test_dps_display = _test_damage_total - test_dps_last_total
		test_dps_last_total = _test_damage_total
		test_dps_timer = 0
	}
}
