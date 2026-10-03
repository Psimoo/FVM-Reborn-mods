obj_pool_prewarm_tick();

for (var _i = 0; _i < array_length(global._move_instance_pre_arr); _i++) {
    var _inst = global._move_instance_pre_arr[_i];
    with (_inst) {
        // 判断是否拥有 parent_plant 或 parent_player 变量，且它们的值（对象索引）继承自 obj_card_parent
        var _hasPlant = variable_instance_exists(id, "parent_plant") && instance_exists(parent_plant) && object_is_ancestor(parent_plant.object_index, obj_card_parent);
        var _hasPlayer = variable_instance_exists(id, "parent_player") && instance_exists(parent_player) && object_is_ancestor(parent_player.object_index, obj_card_parent);
		// Some card-attached ground effects keep their owner in banding_card_obj.
		var _hasCard = (object_index == obj_in_water_effect || object_index == obj_sleep_effect || object_index == obj_lava_burn_effect)
			&& variable_instance_exists(id, "banding_card_obj")
			&& instance_exists(banding_card_obj)
			&& object_is_ancestor(banding_card_obj.object_index, obj_card_parent);
		if (_hasPlant || _hasPlayer || _hasCard) {
			if(!object_is_ancestor(object_index,obj_card_parent)){
	            var tid = _hasPlant ? parent_plant.id : (_hasPlayer ? parent_player.id : banding_card_obj.id);
				if !ds_map_exists(global._move_instance_map,tid){
					var _list = ds_list_create()
					ds_map_add(global._move_instance_map,tid,_list);
				}
				var _list = ds_map_find_value(global._move_instance_map,tid)
				ds_list_add(_list,id);
			}
        }
    }
}

global._move_instance_pre_arr = [];



current_wave_hp = 0
with obj_enemy_parent{
	if target_type != "obstacle"{
		other.current_wave_hp += hp
	}
}
var c_min_time = wave_min_time
if is_real(global.level_file.version){
	if global.level_file.version >= 1.3{
		if current_wave < total_wave{
			var current_total_subwaves = array_length(global.level_file.waves[current_wave].subwaves)
			if current_subwave < current_total_subwaves{
				if global.level_file.waves[current_wave].subwaves[current_subwave].local_min_wave_time >0{
					c_min_time = global.level_file.waves[current_wave].subwaves[current_subwave].local_min_wave_time
				}
			}
		}
		
	}
}
if current_wave_hp <= hp_ratio * current_total_hp && level_stage != "boss"{
	if current_wave_max_time > c_min_time{
		if wave_timer < (current_wave_max_time - c_min_time) && wave_timer > 30{
			wave_timer = 30
		}
	}
}
if not global.is_paused{
	wave_timer -= obj_battle.time_ticks_this_step
}
// 魔塔模式：小兵击杀后立刻进入下一波
var _is_tower = (string_pos("tower_cake_", global.level_data.id) > 0)
if _is_tower && level_stage == "pre" && !boss_waiting_clear && current_wave_hp <= 0 && current_wave < total_wave - 1 {
	var _curr_sub_total = array_length(global.level_file.waves[current_wave].subwaves)
	if current_subwave >= _curr_sub_total - 1 {
		// 所有子波已召唤且敌人全清，立刻进入下一波
		current_wave += 1
		current_subwave = 0
		wave_timer = 0
		audio_play_sound(snd_mouse_wave_attack,0,0)
		instance_create_depth(room_width/2,room_height/2,-300,obj_huge_wave_text)
	}
}
// 魔塔模式：Boss波一开始就出Boss（不等小兵清完）
if _is_tower && level_stage == "pre" && !boss_waiting_clear && current_wave < total_wave {
	var _tw_data = global.level_file.waves[current_wave]
	if _tw_data.boss_wave && global.save_data.unlocked_items.elite_unlocked {
		boss_waiting_clear = true
	}
}
// BOSS波：等待所有小怪被清光后召唤BOSS（魔塔模式直接召唤）
if boss_waiting_clear && level_stage == "pre" && (current_wave_hp <= 0 || _is_tower) {
	boss_waiting_clear = false
	level_stage = "boss"
	if _is_tower {
		wave_timer = 0
		current_subwave = 0
	}
	var wave_data = global.level_file.waves[current_wave]
	var boss_spawn_mult = 1
	if global.difficulty == 5{
		boss_spawn_mult = 2
	}
	var _boss_id = wave_data.boss
	if _boss_id != "" && ds_map_exists(global.enemy_map, _boss_id){
		for (var bm = 0; bm < boss_spawn_mult; bm++){
			var enemy_row = irandom_range(0,global.grid_rows-1)
			var enemy_pos = get_world_position_from_grid(10,enemy_row)
			var boss_inst = instance_create_depth(enemy_pos.x-80,enemy_pos.y+30,-200,global.enemy_map[? _boss_id]._obj)
			boss_count ++
			if is_real(global.level_file.version){
				boss_inst.hp *= wave_data.boss_1_hp_modify
				boss_inst.maxhp *= wave_data.boss_1_hp_modify
				var _boss2_id = wave_data.boss2
				if _boss2_id != "" && ds_map_exists(global.enemy_map, _boss2_id){
					var enemy_row_2 = irandom_range(0,global.grid_rows-1)
					var enemy_pos_2 = get_world_position_from_grid(10,enemy_row_2)
					var boss_2_inst = instance_create_depth(enemy_pos_2.x-80,enemy_pos_2.y+30,-200,global.enemy_map[? _boss2_id]._obj)
					boss_2_inst.hp *= wave_data.boss_2_hp_modify
					boss_2_inst.maxhp *= wave_data.boss_2_hp_modify
					boss_count ++
				}
			}
		}
	}
	with obj_battle_music_controller{
		new_battle_music = global.level_data.boss_music
		event_user(10)
	}
}
if (!global.save_data.unlocked_items.elite_unlocked && current_wave >= global.level_file.elite_wave)||current_wave >= global.level_file.total_waves{
	if current_wave_hp <= 0 && !instance_exists(obj_game_over) && !instance_exists(obj_gacha_drop){
		battle_finish_win();
	}
}

if (variable_global_exists("enemy_by_type")) {
	if (!variable_global_exists("_ebt_keys") || !variable_global_exists("_ebt_refresh") || global._ebt_refresh <= 0) {
		global._ebt_keys = variable_struct_get_names(global.enemy_by_type);
		global._ebt_refresh = 120;
	}
	global._ebt_refresh--;
	var _ebt_n = array_length(global._ebt_keys);
	if (_ebt_n > 0) {
		if (!variable_global_exists("_ebt_cursor") || global._ebt_cursor >= _ebt_n) global._ebt_cursor = 0;
		var _ebt_key = global._ebt_keys[global._ebt_cursor];
		global._ebt_cursor = (global._ebt_cursor + 1) % _ebt_n;
		if (variable_struct_exists(global.enemy_by_type, _ebt_key)) {
			var _ebt_list = global.enemy_by_type[$ _ebt_key];
			if (is_array(_ebt_list)) {
				var _ebt_keep = [];
				var _ebt_len = array_length(_ebt_list);
				for (var _ebt_i = 0; _ebt_i < _ebt_len; _ebt_i++) {
					var _ebt_id = _ebt_list[_ebt_i];
					if (instance_exists(_ebt_id)) array_push(_ebt_keep, _ebt_id);
				}
				if (array_length(_ebt_keep) != _ebt_len) {
					global.enemy_by_type[$ _ebt_key] = _ebt_keep;
				}
			}
		}
	}
}
