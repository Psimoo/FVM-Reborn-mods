if (global.is_paused)
    exit;

// 延迟注册到全局类型注册表
if (!enemy_registered || enemy_registered_type != target_type) {
	if (enemy_registered) {
		var _old_list = global.enemy_by_type[$ enemy_registered_type];
		var _old_idx = array_get_index(_old_list, id);
		if (_old_idx != -1) array_delete(_old_list, _old_idx, 1);
	}
	if (!variable_global_exists("enemy_by_type")) {
		global.enemy_by_type = {};
	}
	var _reg_key = target_type;
	if (!variable_struct_exists(global.enemy_by_type, _reg_key)) {
		global.enemy_by_type[$ _reg_key] = [];
	}
	array_push(global.enemy_by_type[$ _reg_key], id);
	enemy_registered = true;
	enemy_registered_type = target_type;
}

if (flash_value > 0)
    flash_value -= 10;

if (hp <= 0 && state != UnknownEnum.Value_11)
{
    global.save_data.player.gold += 2500;
    timer = 0;
    state = UnknownEnum.Value_11;
    target_plant = -4;
    
    with (obj_battle)
    {
        if (boss_count <= 1 && current_wave >= (total_wave - 1))
            timer_pause = true;
    }
}

switch (state)
{
    case UnknownEnum.Value_1:
        sprite_index = spr_infected_mario_mouse_idle;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 8;
        else
            image_index = (floor(timer / 5) % 8) + 8;
        
        if (timer >= wait_time)
        {
            timer = 0;
            var i = irandom_range(1, 100);
            
            if (i <= 50)
                state = UnknownEnum.Value_2;
            else
                state = UnknownEnum.Value_3;
        }
        
        break;
    
    case UnknownEnum.Value_0:
        sprite_index = spr_infected_mario_mouse_appear;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 13;
        else
            image_index = (floor(timer / 5) % 13) + 13;
        
        if (timer == 64)
        {
            timer = 0;
            state = UnknownEnum.Value_1;
            break;
        }
        
        break;
    
    case UnknownEnum.Value_2:
        sprite_index = spr_infected_mario_mouse_skill_1;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 8;
        else
            image_index = (floor(timer / 5) % 8) + 8;
        
        if (timer == 180)
        {
            var cave_pos = get_world_position_from_grid(8, grid_row);
            var erase_col = 8;
            var erase_row = grid_row;
            
            with (obj_card_parent)
            {
                if (grid_col == erase_col && grid_row == erase_row && plant_id != "player")
                {
                    if (hp >= max_hp)
                        obj_task_manager.card_loss++;
                    
                    instance_destroy();
                }
            }
            
            cave[0] = instance_create_depth(cave_pos.x + 8, cave_pos.y + 15, depth, obj_infected_mario_cave);
            
            if (grid_row >= (global.grid_rows - 1))
            {
                cave[1] = instance_create_depth(cave_pos.x + 8, (cave_pos.y + 15) - global.grid_cell_size_y, depth + 45, obj_infected_mario_cave);
                cave[2] = -4;
            }
            else if (grid_row <= 0)
            {
                cave[1] = instance_create_depth(cave_pos.x + 8, cave_pos.y + 15 + global.grid_cell_size_y, depth - 45, obj_infected_mario_cave);
                cave[2] = -4;
            }
            else
            {
                cave[1] = instance_create_depth(cave_pos.x + 8, cave_pos.y + 15 + global.grid_cell_size_y, depth - 45, obj_infected_mario_cave);
                cave[2] = instance_create_depth(cave_pos.x + 8, (cave_pos.y + 15) - global.grid_cell_size_y, depth + 45, obj_infected_mario_cave);
            }
        }
        
        if (timer == 240)
        {
            var cave_count = 3;
            
            if (grid_row >= (global.grid_rows - 1) || grid_row <= 0)
                cave_count = 2;
            
            var used_positions = [];
            
            for (var i = 0; i < cave_count; i++)
            {
                var pipeline_col = irandom_range(3, 6);
                var pipeline_row = irandom_range(0, global.grid_rows - 1);
                
                for (var j = 0; j < 100; j++)
                {
                    pipeline_row = irandom_range(0, global.grid_rows - 1);
                    
                    if (array_get_index(used_positions, pipeline_row) == -1)
                    {
                        array_push(used_positions, pipeline_row);
                        break;
                    }
                }
                
                var pipeline_pos = get_world_position_from_grid(pipeline_col, pipeline_row);
                
                with (obj_card_parent)
                {
                    if (grid_col == pipeline_col && grid_row == pipeline_row && plant_id != "player")
                    {
                        if (hp >= max_hp)
                            obj_task_manager.card_loss++;
                        
                        instance_destroy();
                    }
                }
                
                pipeline[i] = instance_create_depth(pipeline_pos.x + 8, pipeline_pos.y + 15, depth, obj_infected_mario_pipeline);
                
                if (i == 0)
                    pipeline[i].main_pipe = true;
                
                if (instance_exists(cave[i]))
                {
                    cave[i].banding_pipeline_obj = pipeline[i];
                    pipeline[i].banding_cave_obj = cave[i];
                }
            }
        }
        
        if (timer >= 300)
        {
            timer = 0;
            state = UnknownEnum.Value_9;
        }
        
        break;
    
    case UnknownEnum.Value_3:
        sprite_index = spr_infected_mario_mouse_skill_2;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 14;
        else
            image_index = (floor(timer / 5) % 14) + 14;
        
        if (timer >= (20 + (70 * jump_times)) && timer <= (50 + (70 * jump_times)))
        {
            if (jump_times == 0)
                x -= 7.6;
            else
                x -= ((global.grid_cell_size_x * 2) / 30);
        }
        
        if (timer == (50 + (70 * jump_times) + 1))
        {
            jump_times++;
            var erase_col = 9 - (jump_times * 2);
            var erase_row = grid_row;
            
            with (obj_card_parent)
            {
                if (grid_col == erase_col && grid_row == erase_row && plant_id != "player")
                {
                    if (hp >= max_hp)
                        obj_task_manager.card_loss++;
                    
                    instance_destroy();
                }
            }
        }
        
        if (jump_times >= 4)
        {
            jump_times = 0;
            timer = 0;
            state = UnknownEnum.Value_9;
        }
        
        break;
    
    case UnknownEnum.Value_9:
        sprite_index = spr_infected_mario_mouse_dig_down;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 18;
        else
            image_index = (floor(timer / 5) % 18) + 18;
        
        if (timer == 89)
            image_alpha = 0;
        
        if (timer == 210)
        {
            var enemy_row = irandom_range(0, global.grid_rows - 1);
            var enemy_pos = get_world_position_from_grid(10, enemy_row);
            x = enemy_pos.x - 80;
            y = enemy_pos.y + 30;
            image_alpha = 1;
            timer = 0;
            state = UnknownEnum.Value_0;
            break;
        }
        
        break;
    
    case UnknownEnum.Value_11:
        sprite_index = spr_mario_mouse_death;
        image_index = floor(timer / 5) % image_number;
        
        if (timer >= (image_number * 5))
        {
            image_alpha -= 0.1;
            image_index = image_number - 1;
        }
        
        break;
}

timer++;

if (image_alpha <= 0 && state == UnknownEnum.Value_11)
    instance_destroy();

var zombie_grid = get_grid_position_from_world(x, y);
var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth - 4.5;
grid_col = zombie_grid.col;
grid_row = zombie_grid.row;
