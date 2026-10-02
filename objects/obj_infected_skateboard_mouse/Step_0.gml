if (skipped || hp <= 0)
{
    sprite_index = spr_infected_skateboard_mouse;
    move_anim = 14;
    attack_anim = 4;
    death_anim = 14;
    move_speed = 0.3;
}

// Register to global enemy type registry
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

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

if (global.is_paused)
    exit;

if (ice_timer > 0)
{
    ice_timer--;
    is_slowdown = true;
}
else
{
    is_slowdown = false;
}

if (frozen_timer > 0)
{
    current_frozen = true;
    frozen_timer--;
    is_frozen = true;
}
else
{
    is_frozen = false;
}

if (scare_timer > 0)
{
    scare_timer--;
    is_scare = true;
}
else
{
    is_scare = false;
}

if (flash_value > 0)
    flash_value -= 10;

if (hp <= 0)
{
    frozen_timer = 0;
    scare_timer = 0;
    left_move_flashs = 0;
    stun_timer = 0;
}

var current_atk_cycle = 0;
var current_move_speed = 0;

if (is_slowdown)
{
    flash_speed = 12;
    current_move_speed = move_speed / 2;
    current_atk_cycle = atk_cycle * 2;
}
else
{
    flash_speed = 6;
    current_move_speed = move_speed;
    current_atk_cycle = atk_cycle;
}

if (left_move_flashs > 0)
{
    y += y_move;
    left_move_flashs--;
}

if (is_frozen || is_scare)
    exit;

var zombie_grid = get_grid_position_from_world(x, y);
timer++;

if (instance_exists(target_plant) && target_plant.hp <= 0)
    target_plant = -4;

switch (state)
{
    case UnknownEnum.Value_0:
        break;
    
    case UnknownEnum.Value_2:
        x -= current_move_speed;
        
        if (helmet_hp > 0 && hp > (maxhp - helmet_hp))
        {
            if ((((hp + helmet_hp) - maxhp) / maxhp) > hurt_rate)
                image_index = floor(timer / flash_speed) % move_anim;
            else
                image_index = (floor(timer / flash_speed) % move_anim) + move_anim;
        }
        else if ((hp / (maxhp - helmet_hp)) > hurt_rate)
        {
            image_index = floor(timer / flash_speed) % move_anim;
        }
        else
        {
            image_index = (floor(timer / flash_speed) % move_anim) + move_anim;
        }
        
        var plant_in_range = -4;
        var plant_order_list = [-4, -4, -4, -4];
        
        with (obj_card_parent)
        {
            var dx = x - other.x;
            var dy = y - other.y;
            var is_in_front = false;
            is_in_front = dx < 0 && dx > -other.attack_range;
            
            if (is_in_front && zombie_grid.row == grid_row && (feature_type != "dwarf" || (feature_type == "dwarf" && other.giant_type)))
            {
                for (var i = 0; i < ds_list_size(global.eat_order); i++)
                {
                    var _target_type = ds_list_find_value(global.eat_order, i);
                    
                    if (plant_type == _target_type)
                    {
                        plant_order_list[i] = id;
                        break;
                    }
                }
                
                if (plant_in_range != -4)
                    break;
            }
        }
        
        for (var i = 0; i < 4; i++)
        {
            if (plant_order_list[i] != -4)
            {
                plant_in_range = plant_order_list[i];
                break;
            }
        }
        
        if (plant_in_range != -4)
        {
            state = UnknownEnum.Value_1;
            target_plant = plant_in_range;
            attack_timer = 0;
            timer = 0;
        }
        
        break;
    
    case UnknownEnum.Value_4:
        break;
    
    case UnknownEnum.Value_1:
        if ((hp / maxhp) > hurt_rate)
            image_index = (floor(timer / flash_speed) % attack_anim) + (move_anim * 2);
        else
            image_index = (floor(timer / flash_speed) % attack_anim) + (move_anim * 2) + attack_anim;
        
        if (!skipped)
        {
            if (instance_exists(target_plant))
            {
                if (array_get_index(block_list, target_plant.plant_id) == -1)
                    move_speed = 3.6;
                else
                    move_speed = 0;
            }
            else
            {
                move_speed = 3.6;
            }
            
            if (((hp / maxhp) > hurt_rate && image_index == (((move_anim * 2) + attack_anim) - 1)) || ((hp / maxhp) <= hurt_rate && image_index == (((move_anim * 2) + (attack_anim * 2)) - 1)))
                skipped = true;
            
            x -= current_move_speed;
        }
        else
        {
            plant_in_range = -4;
            plant_order_list = [-4, -4, -4, -4];
            
            with (obj_card_parent)
            {
                var dx = x - other.x;
                var dy = y - other.y;
                var is_in_front = false;
                is_in_front = dx < 0 && dx > -other.attack_range;
                
                if (is_in_front && zombie_grid.row == grid_row && (feature_type != "dwarf" || (feature_type == "dwarf" && other.giant_type)))
                {
                    for (var i = 0; i < ds_list_size(global.eat_order); i++)
                    {
                        var _target_type = ds_list_find_value(global.eat_order, i);
                        
                        if (plant_type == _target_type)
                        {
                            plant_order_list[i] = id;
                            break;
                        }
                    }
                    
                    if (plant_in_range != -4)
                        break;
                }
            }
            
            for (var i = 0; i < 4; i++)
            {
                if (plant_order_list[i] != -4)
                {
                    plant_in_range = plant_order_list[i];
                    break;
                }
            }
            
            if (plant_in_range != -4)
            {
                target_plant = plant_in_range;
            }
            else
            {
                state = UnknownEnum.Value_2;
                target_plant = plant_in_range;
                attack_timer = 0;
                timer = 0;
            }
            
            attack_timer++;
            
            if (attack_timer >= current_atk_cycle)
            {
                with (target_plant)
                {
                    if (!invincible)
                        hp -= other.atk;
                    
                    event_user(2);
                    
                    if (instance_exists(other))
                    {
                    }
                }
                
                var a = irandom_range(0, 2);
                audio_play_sound(ds_list_find_value(obj_battle.chomp_sound_list, a), 0, 0);
                attack_timer = 0;
            }
        }
        
        break;
    
    case UnknownEnum.Value_3:
        ice_timer = 0;
        frozen_timer = 0;
        if (ash_death) {
            image_alpha = 0;
            break;
        }
        if (image_index >= ((death_anim + (move_anim * 2) + (attack_anim * 2)) - 1))
            image_alpha -= 0.08;
        else
            image_index = (floor(timer / flash_speed) % death_anim) + (move_anim * 2) + (attack_anim * 2);
        
        break;
}

if (hp <= 0 && state != UnknownEnum.Value_3)
{
    timer = 0;
    state = UnknownEnum.Value_3;
    target_plant = -4;
    if (ash_death) {
        image_alpha = 0;
    }
}

if (image_alpha <= 0 && state == UnknownEnum.Value_3)
    instance_destroy();

var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth - 4.5;
grid_col = zombie_grid.col;
grid_row = zombie_grid.row;

if (x < (global.grid_offset_x - 150) && hp > 0 && !place_meeting(x, y, obj_cat))
{
    global.is_paused = true;
    global.game_over = true;
    instance_create_depth(room_width / 2, room_height / 2, -3001, obj_game_over);
    audio_play_sound(snd_lose, 0, 0);
}
