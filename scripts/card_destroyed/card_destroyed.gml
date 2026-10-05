function card_destroyed(plant_inst) {
    var col = plant_inst.grid_col;
    var row = plant_inst.grid_row;
    
    if (col >= 0 && col < global.grid_cols && row >= 0 && row < global.grid_rows) {
        var plant_list = ds_grid_get(global.grid_plants, col, row);
        var index = ds_list_find_index(plant_list, plant_inst);
        if (index != -1) {
            ds_list_delete(plant_list, index);
            if (variable_global_exists("ocean_buff_dirty"))
                global.ocean_buff_dirty = true;
            return;
        }
    }
    
    for (var c = 0; c < global.grid_cols; c++) {
        for (var r = 0; r < global.grid_rows; r++) {
            var list = ds_grid_get(global.grid_plants, c, r);
            var idx = ds_list_find_index(list, plant_inst);
            if (idx != -1) {
                ds_list_delete(list, idx);
                if (variable_global_exists("ocean_buff_dirty"))
                    global.ocean_buff_dirty = true;
                return;
            }
        }
    }
}

function revive_cell_can_place(col, row, card_data, card_id) {
    if (col < 0 || col >= global.grid_cols || row < 0 || row >= global.grid_rows)
        return false;

    var _world = get_world_position_from_grid(col, row);
    return can_place_at_position(_world.x, _world.y,
        card_data[? "plant_type"], card_data[? "feature_type"], card_data[? "target_card"], card_id);
}

function revive_collect_targets(origin_col, origin_row, range_col, range_row, skip_shoveled) {
    var _cand = [];
    var _cell_ok = {};
    if (!variable_global_exists("dead_cards") || !ds_exists(global.dead_cards, ds_type_list)) return _cand;

    for (var i = ds_list_size(global.dead_cards) - 1; i >= 0; i--) {
        var dead_info = global.dead_cards[| i];
        if (is_undefined(dead_info) || !ds_exists(dead_info, ds_type_map)) continue;
        if (!ds_map_exists(dead_info, "grid_col") || !ds_map_exists(dead_info, "grid_row")) continue;

        if (skip_shoveled && ds_map_find_value(dead_info, "death_cause") == "shovel") continue;

        var dead_col = dead_info[? "grid_col"];
        var dead_row = dead_info[? "grid_row"];

        if (abs(dead_col - origin_col) > range_col || abs(dead_row - origin_row) > range_row) continue;
        if (dead_col < 0 || dead_col >= global.grid_cols || dead_row < 0 || dead_row >= global.grid_rows) continue;

        var _plant_id = dead_info[? "plant_id"];
        var card_data = deck_get_card_data(_plant_id, dead_info[? "shape"]);
        if (card_data == noone) continue;

        var _cell_key = string(dead_col) + "_" + string(dead_row);
        if (!variable_struct_exists(_cell_ok, _cell_key)) _cell_ok[$ _cell_key] = false;
        if (!_cell_ok[$ _cell_key] && revive_cell_can_place(dead_col, dead_row, card_data, _plant_id))
            _cell_ok[$ _cell_key] = true;

        array_push(_cand, { index: i, key: _cell_key });
    }

    var _idxs = [];
    for (var t = 0; t < array_length(_cand); t++) {
        if (_cell_ok[$ _cand[t].key]) array_push(_idxs, _cand[t].index);
    }
    return _idxs;
}

function revive_apply_targets(origin_col, origin_row, range_col, range_row, max_count, skip_shoveled, effect_sprite = -1) {
    if (max_count <= 0) return 0;

    var _idxs = revive_collect_targets(origin_col, origin_row, range_col, range_row, skip_shoveled);
    if (array_length(_idxs) == 0) return 0;

    var _done = {};
    var _used = [];
    var _revived = 0;

    var _progress = true;
    while (_progress && _revived < max_count) {
        _progress = false;

        for (var t = 0; t < array_length(_idxs) && _revived < max_count; t++) {
            var _key = string(_idxs[t]);
            if (variable_struct_exists(_done, _key)) continue;

            var dead_info = global.dead_cards[| _idxs[t]];
            if (is_undefined(dead_info) || !ds_exists(dead_info, ds_type_map)) { _done[$ _key] = true; continue; }

            var dead_col = dead_info[? "grid_col"];
            var dead_row = dead_info[? "grid_row"];
            var _plant_id = dead_info[? "plant_id"];
            var _shape = dead_info[? "shape"];
            var _level = dead_info[? "level"];
            var _skill = dead_info[? "skill"];

            var card_data = deck_get_card_data(_plant_id, _shape);
            if (card_data == noone) { _done[$ _key] = true; continue; }

            if (!revive_cell_can_place(dead_col, dead_row, card_data, _plant_id)) continue;

            var card_obj = card_data[? "obj"];
            var grid_pos = get_world_position_from_grid(dead_col, dead_row);

            var new_plant = instance_create_depth(grid_pos.x, grid_pos.y, 0, card_obj);
            new_plant.current_level = _level;
            new_plant.skill = _skill;
            new_plant.shape = _shape;
            with (new_plant) event_user(0);

            var depth_value = calculate_plant_depth(dead_col, dead_row, new_plant.plant_type);
            card_created(new_plant, dead_col, dead_row);
            new_plant.depth = depth_value;
            new_plant.attack_timer = 0;
            new_plant.state = 0;

            var _eff = instance_create_depth(grid_pos.x, grid_pos.y - 20, depth_value - 100, obj_card_heal_effect);
            if (effect_sprite != -1) _eff.sprite_index = effect_sprite;

            _done[$ _key] = true;
            array_push(_used, _idxs[t]);
            _revived++;
            _progress = true;
        }
    }

    for (var a = 0; a < array_length(_used); a++) {
        for (var b = a + 1; b < array_length(_used); b++) {
            if (_used[b] > _used[a]) {
                var _tmp = _used[a];
                _used[a] = _used[b];
                _used[b] = _tmp;
            }
        }
    }
    for (var k = 0; k < array_length(_used); k++) {
        var _dead_info = global.dead_cards[| _used[k]];
        ds_list_delete(global.dead_cards, _used[k]);
        ds_map_destroy(_dead_info);
    }

    return _revived;
}
