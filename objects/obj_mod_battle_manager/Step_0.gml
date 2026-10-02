if (!instance_exists(obj_battle))
    instance_destroy();

if (global.buff_dirty)
{
    reset_aurora_grid();
    rebuild_buff_grid();
    global.buff_apply_id++;
    global.buff_dirty = false;
    show_debug_message("buff地图更新");
}

// 海洋女神增幅系统
if (variable_global_exists("ocean_buff_dirty") && global.ocean_buff_dirty)
{
    rebuild_ocean_buff();
    show_debug_message("海洋女神增幅更新");
}

shield_replaced = true;

if (buff_timer > 0)
{
    buff_timer--;
}
else
{
    with (obj_card_parent)
    {
        if (self.plant_id != "player")
        {
            var just_initialized = false;
            
            if (!variable_instance_exists(self.id, "base_atk"))
            {
                var upgrade_data = get_plant_data_with_skill(self.plant_id, self.shape, self.current_level, self.skill);
                self.base_atk = (upgrade_data != undefined) ? ds_map_find_value(upgrade_data, "atk") : self.atk;
                just_initialized = true;
            }
            
            if (!variable_instance_exists(self.id, "base_cycle"))
            {
                var upgrade_data = get_plant_data_with_skill(self.plant_id, self.shape, self.current_level, self.skill);
                self.base_cycle = (upgrade_data != undefined) ? ds_map_find_value(upgrade_data, "cycle") : self.cycle;
                just_initialized = true;
            }
            
            if (!variable_instance_exists(self.id, "buff_type"))
            {
                self.buff_type = mod_get_buff_type(self.plant_id);
                just_initialized = true;
            }
            
            if (!variable_instance_exists(self.id, "buff_applied_id"))
            {
                self.buff_applied_id = -1;
                just_initialized = true;
            }

            if (!variable_instance_exists(self.id, "ocean_buff_multiplier"))
            {
                self.ocean_buff_multiplier = 1;
                just_initialized = true;
            }
            
            if (!variable_instance_exists(self.id, "buffer_type"))
            {
                if (!variable_instance_exists(self.id, "shield_buffed"))
                {
                    if (self.grid_col >= 0 && self.grid_col < global.grid_cols && self.grid_row >= 0 && self.grid_row < global.grid_rows)
                    {
                        var shield_buff = global.shield_grid[self.grid_col][self.grid_row] + 1;
                        self.base_atk *= shield_buff;
                    }
                    self.shield_buffed = true;
                    just_initialized = true;
                }
                else if (!self.shield_buffed)
                {
                    if (self.grid_col >= 0 && self.grid_col < global.grid_cols && self.grid_row >= 0 && self.grid_row < global.grid_rows)
                    {
                        var shield_buff = global.shield_grid[self.grid_col][self.grid_row] + 1;
                        self.base_atk *= shield_buff;
                    }
                    self.shield_buffed = true;
                    just_initialized = true;
                }
            }
            
            // 放置、复活或移动后的目标都按当前坐标重新判定。
            var current_ocean_mult = get_ocean_buff_multiplier(self.id);
            if (current_ocean_mult != self.ocean_buff_multiplier)
            {
                self.ocean_buff_multiplier = current_ocean_mult;
                just_initialized = true;
            }

            if (just_initialized || self.buff_applied_id != global.buff_apply_id)
            {
                if (self.grid_col < 0 || self.grid_col >= global.grid_cols || self.grid_row < 0 || self.grid_row >= global.grid_rows)
                {
                    self.atk = self.base_atk;
                    self.buff_applied_id = global.buff_apply_id;
                    continue;
                }

                var buff_multiplier = 1;

                if (!is_undefined(self.buff_type))
                {
                    switch (self.buff_type)
                    {
                        case "thrower":
                            var grid_thrower = ds_map_find_value(global.buff_grid, "thrower");
                            var buff_au = get_aurora_buff(self.grid_col, self.grid_row);
                            buff_multiplier = max(grid_thrower[self.grid_col][self.grid_row], buff_au);
                            break;

                        case "tracker":
                            var grid_tracker = ds_map_find_value(global.buff_grid, "tracker");
                            var stack_tracker = ds_map_find_value(global.buff_stack_grid, "tracker");
                            var tr_normal = grid_tracker[self.grid_col][self.grid_row];
                            var tr_stack = stack_tracker[self.grid_col][self.grid_row];
                            buff_multiplier = max(tr_normal, tr_stack);
                            break;

                        case "xiangshui":
                            var grid_xiangshui = ds_map_find_value(global.buff_grid, "xiangshui");
                            var stack_xiangshui = ds_map_find_value(global.buff_stack_grid, "xiangshui");
                            var xs_normal = grid_xiangshui[self.grid_col][self.grid_row];
                            var xs_stack = stack_xiangshui[self.grid_col][self.grid_row];
                            buff_multiplier = max(xs_normal, xs_stack);
                            break;

                        case "sprayer":
                            var grid_sprayer = ds_map_find_value(global.buff_grid,
                                is_row_sprayer_card(self.plant_id) ? "sprayer_row" : "sprayer");
                            buff_multiplier = grid_sprayer[self.grid_col][self.grid_row];
                            break;

                        case "five_dir":
                            var grid_five_dir = ds_map_find_value(global.buff_grid, "five_dir");
                            var stack_five_dir = ds_map_find_value(global.buff_stack_grid, "five_dir");
                            var fd_normal = grid_five_dir[self.grid_col][self.grid_row];
                            var fd_stack = stack_five_dir[self.grid_col][self.grid_row];
                            buff_multiplier = max(fd_normal, fd_stack);
                            break;

                        case "multi_dir":
                            var grid_multi_dir = ds_map_find_value(global.buff_grid, "multi_dir");
                            var stack_multi_dir = ds_map_find_value(global.buff_stack_grid, "multi_dir");
                            var md_normal = grid_multi_dir[self.grid_col][self.grid_row];
                            var md_stack = stack_multi_dir[self.grid_col][self.grid_row];
                            buff_multiplier = max(md_normal, md_stack);
                            break;

                        default:
                            buff_multiplier = 1;
                            break;
                    }
                }

                // 第二buff类型：取与第一buff的较大值（避免同一增幅源重复计算）
                var buff_type_2 = "";
                if (variable_global_exists("plant_buff_map_2") && ds_exists(global.plant_buff_map_2, ds_type_map) && ds_map_exists(global.plant_buff_map_2, self.plant_id))
                    buff_type_2 = ds_map_find_value(global.plant_buff_map_2, self.plant_id);

                if (buff_type_2 != "" && buff_type_2 != self.buff_type)
                {
                    var buff2_multiplier = 1;
                    switch (buff_type_2)
                    {
                        case "thrower":
                            var grid_thrower2 = ds_map_find_value(global.buff_grid, "thrower");
                            var buff_au2 = get_aurora_buff(self.grid_col, self.grid_row);
                            buff2_multiplier = max(grid_thrower2[self.grid_col][self.grid_row], buff_au2);
                            break;

                        case "tracker":
                            var grid_tracker2 = ds_map_find_value(global.buff_grid, "tracker");
                            var stack_tracker2 = ds_map_find_value(global.buff_stack_grid, "tracker");
                            var tr2_normal = grid_tracker2[self.grid_col][self.grid_row];
                            var tr2_stack = stack_tracker2[self.grid_col][self.grid_row];
                            buff2_multiplier = max(tr2_normal, tr2_stack);
                            break;

                        case "xiangshui":
                            var grid_xiangshui2 = ds_map_find_value(global.buff_grid, "xiangshui");
                            var stack_xiangshui2 = ds_map_find_value(global.buff_stack_grid, "xiangshui");
                            var xs2_normal = grid_xiangshui2[self.grid_col][self.grid_row];
                            var xs2_stack = stack_xiangshui2[self.grid_col][self.grid_row];
                            buff2_multiplier = max(xs2_normal, xs2_stack);
                            break;

                        case "sprayer":
                            var grid_sprayer2 = ds_map_find_value(global.buff_grid,
                                is_row_sprayer_card(self.plant_id) ? "sprayer_row" : "sprayer");
                            buff2_multiplier = grid_sprayer2[self.grid_col][self.grid_row];
                            break;

                        case "five_dir":
                            var grid_five_dir2 = ds_map_find_value(global.buff_grid, "five_dir");
                            var stack_five_dir2 = ds_map_find_value(global.buff_stack_grid, "five_dir");
                            var fd2_normal = grid_five_dir2[self.grid_col][self.grid_row];
                            var fd2_stack = stack_five_dir2[self.grid_col][self.grid_row];
                            buff2_multiplier = max(fd2_normal, fd2_stack);
                            break;

                        case "multi_dir":
                            var grid_multi_dir2 = ds_map_find_value(global.buff_grid, "multi_dir");
                            var stack_multi_dir2 = ds_map_find_value(global.buff_stack_grid, "multi_dir");
                            var md2_normal = grid_multi_dir2[self.grid_col][self.grid_row];
                            var md2_stack = stack_multi_dir2[self.grid_col][self.grid_row];
                            buff2_multiplier = max(md2_normal, md2_stack);
                            break;
                    }

                    buff_multiplier = max(buff_multiplier, buff2_multiplier);
                }

                // 海洋女神与榨汁机、魔杖蛇的喷壶增幅不叠加，取较高倍率。
                var ocean_mult = 1;
                if (variable_instance_exists(self.id, "ocean_buff_multiplier"))
                    ocean_mult = self.ocean_buff_multiplier;

                var has_sprayer_buff = (self.buff_type == "sprayer" || buff_type_2 == "sprayer");
                var combined_buff_multiplier = has_sprayer_buff
                    ? max(buff_multiplier, ocean_mult)
                    : buff_multiplier * ocean_mult;

                var _shield_gem_mult = get_shield_gem_atk_mult(self.grid_col, self.grid_row, self.plant_id);
                self.atk = self.base_atk * combined_buff_multiplier * _shield_gem_mult;

                self.buff_applied_id = global.buff_apply_id;
            }
        }
    }
    
    buff_timer = 5;
}

if (record_timer > 0)
{
    record_timer--;
}
else
{
    with (obj_card_parent)
    {
        if (plant_id != "player")
        {
            if (!variable_instance_exists(id, "transform_recorded"))
            {
                mod_on_card_placed(self.plant_id, self.shape);
                self.transform_recorded = true;
            }
        }
    }
    
    record_timer = 5;
}

if (global.debug)
{
    if (keyboard_check_pressed(vk_numpad1))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_frog_prince_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad2))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_duck_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad3))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_submarine_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad4))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_normal_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad5))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_football_fan_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad6))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_iron_pan_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
    }
    
    if (keyboard_check_pressed(vk_numpad7))
    {
        var grid_pos = get_grid_position_from_world(mouse_x, mouse_y);
        var inst = instance_create_depth(grid_pos.x, grid_pos.y + 38, 0, obj_infected_mario_mouse);
        inst.grid_row = grid_pos.row;
        inst.grid_col = grid_pos.col;
        inst.frozen_timer = 0;
        obj_battle.boss_count += 1;
    }
}

if (global.level_id == "ancient_castle_1" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_2" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_3" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_4" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_5" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_6" && !event_created)
{
    var obstacle_pos_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}

if (global.level_id == "ancient_castle_7" && !event_created)
{
    var obstacle_pos_list = [[1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0]];
    
    for (var i = 0; i < array_length(obstacle_pos_list); i++)
    {
        for (var j = 0; j < array_length(obstacle_pos_list[i]); j++)
        {
            if (obstacle_pos_list[i][j] == 1)
            {
                var obs_pos = get_world_position_from_grid(j, i);
                var inst = instance_create_depth(obs_pos.x, obs_pos.y - 35, -1200, obj_obstacle);
                inst.row = i;
            }
        }
    }
    
    event_created = true;
}
