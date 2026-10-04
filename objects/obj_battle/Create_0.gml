
surface_set_target(application_surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

depth = 50

instance_create_depth(0,0,-900,obj_flame_manager)
instance_create_depth(0,0,0,obj_event_manager)

var mus_inst = instance_create_depth(0,0,0,obj_battle_music_controller)
mus_inst.battle_music = global.level_data.pre_music

global.game_over = false

global.enemy_by_type = {};

global.enemy_sx = [];
global.enemy_sx_l = [];
global.enemy_sx_pmax = [];
global.enemy_sx_gen = 0;

if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;

instance_create_depth(0,0,0,obj_battle_pause_manager)
instance_create_depth(0,0,-2900,obj_battle_timer_display)
instance_create_depth(mouse_x,mouse_y,0,obj_player_character)

instance_create_depth(room_width-200,room_height-25,0,obj_level_progress_bar)

global.selected_slot = noone;
global.current_seed = noone;
global.grid_offset_x = 695
global.grid_cell_size_x = 107
global.grid_cell_size_y = 116
global.grid_offset_y = 228
global.grid_cols = global.level_file.map_cols
global.grid_rows = global.level_file.map_rows

global.enemy_col_n = array_create(global.grid_cols, 0);

global.test_mouse_picker_open = false;
global.test_mouse_picker_id = "";
global.test_mouse_picker_block_place = false;
global.test_info_island_mode = (global.level_id == "test_level");

chomp_sound_list = ds_list_create()
battle_time = 0

frame_time_accumulator = 0;
time_ticks_this_step = 1;
boss_count = 0
map_spr_index = 0

test_dps_timer = 0
test_dps_window = 5 * 60
test_dps_display = 0
test_dps_last_total = 0

speed_up = false
time_limit = -1
timer_pause = false

ds_list_add(chomp_sound_list,snd_chomp1)
ds_list_add(chomp_sound_list,snd_chomp2)
ds_list_add(chomp_sound_list,snd_chomp3)

if (variable_global_exists("grid_plants") && ds_exists(global.grid_plants, ds_type_grid)) {
	for (var _c = 0; _c < ds_grid_width(global.grid_plants); _c++) {
		for (var _r = 0; _r < ds_grid_height(global.grid_plants); _r++) {
			var _old_list = ds_grid_get(global.grid_plants, _c, _r);
			if (ds_exists(_old_list, ds_type_list)) {
				ds_list_destroy(_old_list);
			}
		}
	}
	ds_grid_destroy(global.grid_plants);
}
if (variable_global_exists("plant_layers") && ds_exists(global.plant_layers, ds_type_map)) {
	ds_map_destroy(global.plant_layers);
}
if (variable_global_exists("shovel_order") && ds_exists(global.shovel_order, ds_type_list)) {
	ds_list_destroy(global.shovel_order);
}
if (variable_global_exists("eat_order") && ds_exists(global.eat_order, ds_type_list)) {
	ds_list_destroy(global.eat_order);
}

if (variable_global_exists("dead_cards") && ds_exists(global.dead_cards, ds_type_list)) {
	for (var _d = 0; _d < ds_list_size(global.dead_cards); _d++) {
		var _dead_map = global.dead_cards[| _d];
		if (ds_exists(_dead_map, ds_type_map)) {
			ds_map_destroy(_dead_map);
		}
	}
	ds_list_destroy(global.dead_cards);
}
global.dead_cards = ds_list_create();

global.plant_layers = ds_map_create();
ds_map_add(global.plant_layers, "normal", 0);
ds_map_add(global.plant_layers, "shield_inner", 1);
ds_map_add(global.plant_layers, "lilypad", 2);
ds_map_add(global.plant_layers, "shield_outer", 3);
ds_map_add(global.plant_layers, "coffee", 4);
ds_map_add(global.plant_layers, "gridless", 5);

global.shovel_order = ds_list_create();
ds_list_add(global.shovel_order,"normal", "shield","shield_outer", "lilypad","coffee","gridless");
global.eat_order = ds_list_create();
ds_list_add(global.eat_order,"shield","shield_outer","normal","lilypad");

global.grid_plants = ds_grid_create(global.grid_cols, global.grid_rows);

with obj_task_manager{
	reset_task_state()
}

for (var col = 0; col < global.grid_cols; col++) {
    for (var row = 0; row < global.grid_rows; row++) {

        var plant_list = ds_list_create();
        ds_grid_set(global.grid_plants, col, row, plant_list);
    }
}

var plant_list = global.level_file.map
global.grid_terrains = global.level_file.map
global.row_feature = []
for(var i = 0 ; i < global.grid_rows;i++){
	if global.grid_terrains[i][1].type == "water"{
		global.row_feature[i] = "water"
	}
	else{
		global.row_feature[i] = "land"
	}
}
for(var i = 0 ; i < global.grid_rows ; i++){
	for(var j = 0 ; j < global.grid_cols ; j ++){
		var cards = plant_list[i][j].plant
		if array_length(cards) > 0{
			for(var k = 0; k < array_length(cards);k++){
				var card_data = deck_get_card_data(cards[k],0)
				var card_obj = card_data[? "obj"]
				var new_x = global.grid_offset_x + j * global.grid_cell_size_x
				var new_y = global.grid_offset_y + i * global.grid_cell_size_y
				var grid_pos = get_grid_position_from_world(new_x,new_y)
				var new_plant = instance_create_depth(grid_pos.x, grid_pos.y, 0,card_obj);
				var depth_value = calculate_plant_depth(j, i, new_plant.plant_type);
				card_created(new_plant, j, i);
				new_plant.depth = depth_value
			}

		}
		var map_objs = plant_list[i][j].object
		if array_length(map_objs) > 0{
			for(var k = 0; k < array_length(map_objs);k++){
				var map_obj_data = get_map_object_data(map_objs[k])
				var map_obj = map_obj_data._obj
				var grid_pos = get_world_position_from_grid(j,i)
				var new_x = grid_pos.x + map_obj_data.x_offset
				var new_y = grid_pos.y + map_obj_data.y_offset

				var new_obj = instance_create_depth(new_x, new_y, -1200,map_obj);
				new_obj.row = i
				new_obj.col = j
			}

		}
	}
	var new_x = global.grid_offset_x -1 * global.grid_cell_size_x
	var new_y = global.grid_offset_y + i * global.grid_cell_size_y
	var grid_pos = get_grid_position_from_world(new_x,new_y)
	var cat_inst = instance_create_depth(grid_pos.x - 10, grid_pos.y+10, 0,obj_cat);
	cat_inst.row = i
	if global.row_feature[i] == "water" || global.map_id == "undersea_vortex"{
		cat_inst.sprite_index = spr_crab
		cat_inst.idle_anim = 8
		cat_inst.awake_anim = 6
		cat_inst.attack_anim = 9
	}
}

current_wave = 0
current_subwave = 0
total_wave = global.level_file.total_waves
level_stage = "ready"
current_total_hp = 0
current_wave_hp = 0
hp_ratio = 0.2
if global.difficulty >= 2{
	hp_ratio = 0.5
}
enemy_list = []

wave_max_time = 25*60
wave_min_time = 4 * 60
wave_timer = 0

if global.difficulty >= 3 && global.map_id != "tower_cake"{
	wave_max_time = 12.5*60
}
if is_real(global.level_file.version){
	wave_max_time = global.level_file.max_wave_time
	wave_min_time = global.level_file.min_wave_time
	if global.difficulty >= 3 && global.map_id != "tower_cake"{
		wave_max_time = round(wave_max_time/2)
	}
}

current_wave_max_time = wave_max_time
global.prev_place_id = ""
boss_waiting_clear = false

function enemy_subwave_summon(){
	current_total_hp = 0

    wave_timer = wave_max_time

	if level_stage == "boss"{
		wave_timer = 10 * 60
	}

	if is_real(global.level_file.version){
		if global.level_file.version >= 1.3{
			if current_wave < total_wave && current_subwave < array_length(global.level_file.waves[current_wave].subwaves){
				if global.level_file.waves[current_wave].subwaves[current_subwave].local_max_wave_time >0{
					wave_timer = global.level_file.waves[current_wave].subwaves[current_subwave].local_max_wave_time
				}
			}
		}
	}

	current_wave_max_time = wave_timer

	if current_wave >= total_wave || current_subwave >= array_length(global.level_file.waves[current_wave].subwaves){
		return
	}

    var subwave_enemy = global.level_file.waves[current_wave].subwaves
    enemy_list = subwave_enemy[current_subwave].enemy_list

    var row_enemy_count = array_create(global.grid_rows, 0);

    for (var i = 0; i < array_length(enemy_list); i++) {
        if (enemy_list[i].type != "" && enemy_list[i].row > 0) {
            var row_index = enemy_list[i].row - 1;
            if (row_index >= 0 && row_index < global.grid_rows) {

            }
        }
    }

    var rows_used = array_create(global.grid_rows, false);

    var spawn_multiplier = 1
    if global.difficulty == 5{
        spawn_multiplier = 2
    }
    for (var m = 0; m < spawn_multiplier; m++) {
    for (var i = 0; i < array_length(enemy_list); i++) {
        if (enemy_list[i].type != "") {
            var _enemy_type = enemy_list[i].type
            if (!ds_map_exists(global.enemy_map, _enemy_type)){
                show_debug_message("警告：敌人类型未注册，跳过生成: " + _enemy_type)
                continue
            }
            var target_row = enemy_list[i].row;
            var x_offset = 0;

            var enemy_feature = global.enemy_map[? _enemy_type].feature;

            if (target_row > 0 && target_row <= global.grid_rows) {

                var row_index = target_row - 1;
                var row_type = global.row_feature[row_index];

                if ((enemy_feature == "land" && row_type != "land") ||
                    (enemy_feature == "water" && row_type != "water")) {

                    target_row = 0;
                } else {

                    x_offset = row_enemy_count[row_index];
                    rows_used[row_index] = true;
                }
            }

            if (target_row <= 0 || target_row > global.grid_rows) {

                var available_rows = [];
                for (var r = 0; r < global.grid_rows; r++) {
                    var row_type = global.row_feature[r];

                    var row_matches = false;
                    if (enemy_feature == "land" && row_type == "land") {
                        row_matches = true;
                    } else if (enemy_feature == "water" && row_type == "water") {
                        row_matches = true;
                    }

                    if (row_matches && !rows_used[r]) {
                        array_push(available_rows, r + 1);
                    }
                }

                if (array_length(available_rows) > 0) {

                    target_row = available_rows[irandom(array_length(available_rows) - 1)];
                } else {

                    var all_matching_rows = [];
                    for (var r = 0; r < global.grid_rows; r++) {
                        var row_type = global.row_feature[r];

                        var row_matches = false;
                        if (enemy_feature == "land" && row_type == "land") {
                            row_matches = true;
                        } else if (enemy_feature == "water" && row_type == "water") {
                            row_matches = true;
                        }

                        if (row_matches) {
                            array_push(all_matching_rows, r + 1);
                        }
                    }

                    if (array_length(all_matching_rows) > 0) {
                        target_row = all_matching_rows[irandom(array_length(all_matching_rows) - 1)];
                    } else {

                        show_debug_message("错误：没有适合" + enemy_feature + "敌人的行！");
                        target_row = 1;
                    }
                }

                enemy_list[i].row = target_row;
                var row_index = target_row - 1;
                x_offset = row_enemy_count[row_index];
                rows_used[row_index] = true;
            }

            var enemy_obj = global.enemy_map[? _enemy_type]._obj;

            var new_x = global.grid_offset_x + (9 + x_offset) * global.grid_cell_size_x;
            var new_y = global.grid_offset_y + (target_row - 1) * global.grid_cell_size_y;

            var grid_pos = get_grid_position_from_world(new_x, new_y);
            var new_enemy = instance_create_depth(grid_pos.x+30, grid_pos.y + 38, 0, enemy_obj);

            current_total_hp += global.enemy_map[? _enemy_type].hp;

            var row_index = target_row - 1;
            row_enemy_count[row_index]++;
        }
    }
    }

}
