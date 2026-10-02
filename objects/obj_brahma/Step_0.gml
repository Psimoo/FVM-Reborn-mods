if (global.is_paused)
    exit;

event_inherited();

if (!copied && !is_derivative && image_index >= 14)
{
    copied = true;
    var _blacklist = ["brahma", "magic_chicken", "ice_cream", "shegengbao"];
    var _copy_count = 2;
    
    if (shape == 2)
        _copy_count = 3;
    else if (shape == 3)
        _copy_count = 5;
    
    var _valid_target = target_card != "" && array_get_index(_blacklist, target_card) == -1;
    var card_save_data = false;
    
    if (_valid_target)
        card_save_data = get_card_info_simple(target_card);
    
    if (card_save_data != false)
    {
        var card_slot_data = deck_get_card_data(target_card, card_save_data.shape);
        var _copy_obj = ds_map_find_value(card_slot_data, "obj");
        var _copy_plant_type = ds_map_find_value(card_slot_data, "plant_type");
        var _copy_feature_type = ds_map_find_value(card_slot_data, "feature_type");
        var _copy_target_card = ds_map_find_value(card_slot_data, "target_card");
        var target_cells = [];
        var found_count = 0;
        var prev_replace = global.replace_placement;
        global.replace_placement = false;

        var plat_shift_x = 0;
        var plat_shift_y = 0;
        var _plat = instance_position(x, y, obj_platform);
        if (_plat != noone)
        {
            plat_shift_x = _plat.visual_x_shift;
            plat_shift_y = _plat.visual_y_shift;
        }

        var max_dist = max(global.grid_cols, global.grid_rows);

        // 优先尝试自身所在的格子（终转后该格会空出，也应能复制）
        var _self_world = get_world_position_from_grid(grid_col, grid_row);
        if (found_count < _copy_count && can_copy_card_at_position(_self_world.x, _self_world.y, _copy_plant_type, _copy_feature_type, target_card, _copy_target_card))
        {
            target_cells[found_count] = [grid_col, grid_row];
            found_count++;
        }

        for (var d = 1; d <= max_dist; d++)
        {
            var candidates = [];
            var dr = -d;
            
            while (dr <= d)
            {
                var dc_abs = d - abs(dr);
                
                if (dc_abs == 0)
                {
                    var col = grid_col;
                    var row = grid_row + dr;
                    
                    if (row >= 0 && row < global.grid_rows)
                    {
                        if (!(row == grid_row && col == grid_col))
                        {
                            var priority = (col == grid_col) ? 0 : ((row == grid_row) ? 1 : 2);
                            array_push(candidates, 
                            {
                                col: col,
                                row: row,
                                priority: priority
                            });
                        }
                    }
                }
                else
                {
                    for (var s = -1; s <= 1; s += 2)
                    {
                        var col = grid_col + (s * dc_abs);
                        var row = grid_row + dr;
                        
                        if (row >= 0 && row < global.grid_rows && col >= 0 && col < global.grid_cols)
                        {
                            if (!(row == grid_row && col == grid_col))
                            {
                                var priority = (col == grid_col) ? 0 : ((row == grid_row) ? 1 : 2);
                                array_push(candidates, 
                                {
                                    col: col,
                                    row: row,
                                    priority: priority
                                });
                            }
                        }
                    }
                }
                
                dr++;
            }
            
            array_sort(candidates, function(arg0, arg1)
            {
                if (arg0.priority != arg1.priority)
                    return arg0.priority - arg1.priority;
                
                if (arg0.row != arg1.row)
                    return arg0.row - arg1.row;
                
                return arg0.col - arg1.col;
            });
            
            for (var i = 0; i < array_length(candidates); i++)
            {
                var cand = candidates[i];
                var _cand_world = get_world_position_from_grid(cand.col, cand.row);
                
                if (can_copy_card_at_position(_cand_world.x, _cand_world.y, _copy_plant_type, _copy_feature_type, target_card, _copy_target_card))
                {
                    target_cells[found_count] = [cand.col, cand.row];
                    found_count++;
                    
                    if (found_count >= _copy_count)
                        break;
                }
            }
            
            if (found_count >= _copy_count)
                break;
        }
        
        for (var i = 0; i < found_count; i++)
        {
            var cell = target_cells[i];
            var col = cell[0];
            var row = cell[1];
            var _cell_world = get_world_position_from_grid(col, row);
            var inst_x = _cell_world.x + plat_shift_x;
            var inst_y = _cell_world.y + plat_shift_y;
            if (_copy_feature_type == "upgrade" && _copy_target_card != undefined && _copy_target_card != "none")
            {
                var _base_plant_list = ds_grid_get(global.grid_plants, col, row);
                for (var j = 0; j < ds_list_size(_base_plant_list); j++)
                {
                    var _base_plant = ds_list_find_value(_base_plant_list, j);
                    if (instance_exists(_base_plant) && variable_instance_exists(_base_plant, "plant_id") && _base_plant.plant_id == _copy_target_card)
                    {
                        card_destroyed(_base_plant);
                        instance_destroy(_base_plant);
                        break;
                    }
                }
            }
            var new_card = instance_create_depth_define(inst_x, inst_y, 0, _copy_obj);
            card_created(new_card, col, row);
        }
        
        global.replace_placement = prev_replace;
    }
}

if (shape >= 1 && !exploded && image_index >= 22)
{
    exploded = true;
    event_user(1);
}

if (image_index >= idle_anim)
    instance_destroy();
