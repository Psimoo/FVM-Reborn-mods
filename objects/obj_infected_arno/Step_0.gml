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
    if (ash_death) {
        image_alpha = 0;
    }
    
    with (obj_battle)
    {
        if (boss_count <= 1 && current_wave >= (total_wave - 1))
            timer_pause = true;
    }
}

switch (state)
{
    case UnknownEnum.Value_1:
        sprite_index = spr_infected_arno_idle;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 12;
        else
            image_index = (floor(timer / 5) % 12) + 12;
        
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
        sprite_index = spr_infected_arno_appear;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 10;
        else
            image_index = (floor(timer / 5) % 10) + 10;
        
        if (timer == 49)
        {
            timer = 0;
            state = UnknownEnum.Value_1;
            break;
        }
        
        break;
    
    case UnknownEnum.Value_2:
        sprite_index = spr_infected_arno_skill_1;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 20;
        else
            image_index = (floor(timer / 5) % 20) + 20;
        
        var target_col = 0;
        
        for (j = 0; j < global.grid_cols; j++)
        {
            var plant_list = ds_grid_get(global.grid_plants, j, grid_row);
            
            if (ds_list_size(plant_list) != 0)
            {
                target_col = j;
                break;
            }
        }
        
        if (timer == 60 || timer == 150 || timer == 240)
        {
            var bullet = instance_create_depth(x - 60, y - 180, -200, obj_arno_bullet);
            bullet.row = grid_row;
            bullet.target_col = target_col;
            var bullet_pos = get_world_position_from_grid(target_col, grid_row);
            var enemy_x = bullet_pos.x;
            var enemy_y = bullet_pos.y;
            var distance_x = enemy_x - bullet.x;
            var flight_time = clamp(75 + ((distance_x / 1000) * 45), 75, 120);
            var total_distance_x = distance_x;
            var total_distance_y = 600;
            bullet.move_speed = total_distance_x / flight_time;
            bullet.cgravity = (2 * total_distance_y) / (flight_time * flight_time);
            bullet.cvspeed = (total_distance_y - (0.05 * bullet.cgravity * flight_time * flight_time)) / flight_time;
        }
        
        if (timer >= 300)
        {
            timer = 0;
            state = UnknownEnum.Value_9;
        }
        
        break;
    
    case UnknownEnum.Value_3:
        if (timer <= 194)
        {
            sprite_index = spr_infected_arno_skill_2_ready;
            
            if (hp > (maxhp * hurt_rate))
                image_index = floor(timer / 5) % 13;
            else
                image_index = (floor(timer / 5) % 13) + 13;
        }
        else
        {
            sprite_index = spr_infected_arno_skill_2;
            
            if (hp > (maxhp * hurt_rate))
                image_index = floor((timer - 195) / 5) % 11;
            else
                image_index = (floor((timer - 195) / 5) % 11) + 11;
        }
        
        if (timer > 195)
            x -= 4.5;
        
        if (timer == (195 + (30 * jump_times) + 1))
        {
            jump_times++;
            var erase_col = 9 - (jump_times * 1);
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
        
        if (jump_times >= 7)
        {
            jump_times = 0;
            timer = 0;
            state = UnknownEnum.Value_9;
        }
        
        break;
    
    case UnknownEnum.Value_9:
        sprite_index = spr_infected_arno_disappear;
        
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / 5) % 11;
        else
            image_index = (floor(timer / 5) % 11) + 11;
        
        if (timer == 54)
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
        if (ash_death) {
            image_alpha = 0;
            break;
        }
        sprite_index = spr_infected_arno_death;
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
