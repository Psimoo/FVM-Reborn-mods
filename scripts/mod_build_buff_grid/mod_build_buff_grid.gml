function build_buff_grid()
{
    global.buff_grid = ds_map_create();
    var types = ["tracker", "thrower", "sprayer", "sprayer_row", "five_dir", "multi_dir", "xiangshui"];
    
    for (var t = 0; t < array_length(types); t++)
    {
        var type = types[t];
        var grid = array_create(global.grid_cols);
        
        for (var c = 0; c < global.grid_cols; c++)
            grid[c] = array_create(global.grid_rows, 1);
        
        ds_map_set(global.buff_grid, type, grid);
    }
    
    global.buff_stack_grid = ds_map_create();
    global.buff_stack_count = ds_map_create();
    
    for (var t = 0; t < array_length(types); t++)
    {
        var type = types[t];
        var stack_grid = array_create(global.grid_cols);
        var stack_count = array_create(global.grid_cols);
        
        for (var c = 0; c < global.grid_cols; c++)
        {
            stack_grid[c] = array_create(global.grid_rows, 0);
            stack_count[c] = array_create(global.grid_rows, 0);
        }
        
        ds_map_set(global.buff_stack_grid, type, stack_grid);
        ds_map_set(global.buff_stack_count, type, stack_count);
    }
}

function rebuild_buff_grid()
{
    var keys = ds_map_keys_to_array(global.buff_grid);
    
    for (var k = 0; k < array_length(keys); k++)
    {
        var type = keys[k];
        var grid = ds_map_find_value(global.buff_grid, type);
        
        for (var c = 0; c < global.grid_cols; c++)
        {
            for (var r = 0; r < global.grid_rows; r++)
                grid[c][r] = 1;
        }
        
        var stack_grid = ds_map_find_value(global.buff_stack_grid, type);
        var stack_count = ds_map_find_value(global.buff_stack_count, type);
        
        if (stack_grid != undefined && stack_count != undefined)
        {
            for (var c = 0; c < global.grid_cols; c++)
            {
                for (var r = 0; r < global.grid_rows; r++)
                {
                    stack_grid[c][r] = 0;
                    stack_count[c][r] = 0;
                }
            }
        }
    }
    
    for (var i = 0; i < ds_list_size(global.buff_sources); i++)
    {
        var inst = ds_list_find_value(global.buff_sources, i);
        
        if (!instance_exists(inst))
            continue;
        
        apply_buff(inst);
        apply_aurora(inst);
    }
}

function apply_buff(arg0)
{
    if (arg0.plant_id == "aurora" && arg0.shape >= 3)
        exit;
    
    var type = arg0.buffer_type;
    var grid = ds_map_find_value(global.buff_grid, type);
    var cells = arg0.buff_cells;
    
    var stacking = variable_instance_exists(arg0, "buff_stacking") && arg0.buff_stacking;
    var max_stacks = stacking ? arg0.buff_max_stacks : 1;
    
    var stack_grid = undefined;
    var stack_count = undefined;
    
    if (stacking)
    {
        stack_grid = ds_map_find_value(global.buff_stack_grid, type);
        stack_count = ds_map_find_value(global.buff_stack_count, type);
    }
    
    for (var i = 0; i < array_length(cells); i++)
    {
        var c = cells[i][0];
        var r = cells[i][1];
        var v = cells[i][2];
        
        if (c < 0 || r < 0)
        {
            show_debug_message("INVALID GRID: " + string(arg0.id) + " col=" + string(c) + " row=" + string(r));
            exit;
        }
        
        if (c >= array_length(grid) || r >= array_length(grid[0]))
            exit;

        // 直线喷壶保留其他来源的范围，仅将魔杖蛇的增幅限制在本行。
        if (type == "sprayer" && (arg0.plant_id != "mozhang" || r == arg0.grid_row))
        {
            var row_sprayer_grid = ds_map_find_value(global.buff_grid, "sprayer_row");
            row_sprayer_grid[c][r] = max(row_sprayer_grid[c][r], v);
        }
        
        if (stacking && stack_grid != undefined && stack_count != undefined)
        {
            if (stack_count[c][r] < max_stacks)
            {
                stack_grid[c][r] += v;
                stack_count[c][r]++;
            }
        }
        else
        {
            if (v > grid[c][r])
                grid[c][r] = v;
        }
        
        if (variable_instance_exists(arg0, "buffer_type_2") && !is_undefined(arg0.buffer_type_2))
        {
            var type2 = arg0.buffer_type_2;
            var grid2 = ds_map_find_value(global.buff_grid, type2);
            
            if (grid2 != undefined && c < array_length(grid2) && r < array_length(grid2[0]))
            {
                if (stacking)
                {
                    var stack_grid2 = ds_map_find_value(global.buff_stack_grid, type2);
                    var stack_count2 = ds_map_find_value(global.buff_stack_count, type2);
                    
                    if (stack_grid2 != undefined && stack_count2 != undefined && stack_count2[c][r] < max_stacks)
                    {
                        stack_grid2[c][r] += v;
                        stack_count2[c][r]++;
                    }
                }
                else
                {
                    if (v > grid2[c][r])
                        grid2[c][r] = v;
                }
            }
        }
    }
}
