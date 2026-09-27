if (hp <= 0 && state != UnknownEnum.Value_3)
{
    timer = 0;
    state = UnknownEnum.Value_3;
    sprite_index = spr_infected_frog_prince_mouse;
    move_anim = 10;
    attack_anim = 6;
    move_speed = 0.3;
}

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

event_inherited();

if (grid_col < 0)
{
    sprite_index = spr_infected_frog_prince_mouse_land;
    move_anim = 16;
    attack_anim = 6;
    attack_range = 90;
}

if (global.is_paused || is_frozen || is_stun)
    exit;

if (state == UnknownEnum.Value_1 && sprite_index == spr_infected_frog_prince_mouse_frog)
{
    timer = 0;
    state = UnknownEnum.Value_4;
}

if (state == UnknownEnum.Value_4)
{
    if (hp <= 0)
    {
        state = UnknownEnum.Value_2;
        sprite_index = spr_infected_frog_prince_mouse;
        move_anim = 10;
        attack_anim = 6;
        move_speed = 0.3;
    }
    
    if (sprite_index == spr_infected_frog_prince_mouse_enter)
    {
        if (hp > (maxhp * hurt_rate))
            image_index = floor(timer / flash_speed) % 10;
        else
            image_index = (floor(timer / flash_speed) % 10) + 9;
        
        if (timer >= (flash_speed * 4))
        {
            if (is_slowdown)
                x -= 1.1;
            else
                x -= 2.25;
        }
        
        if (timer >= (flash_speed * 10) || hp <= 0)
        {
            audio_play_sound(snd_enter_water, 0, 0);
            state = UnknownEnum.Value_2;
            sprite_index = spr_infected_frog_prince_mouse_frog;
            
            if (hp <= 0)
            {
                sprite_index = spr_infected_frog_prince_mouse;
                move_anim = 10;
                attack_anim = 6;
                move_speed = 0.3;
            }
        }
    }
    else
    {
        if (instance_exists(target_plant))
        {
            if (array_get_index(block_list, target_plant.plant_id) == -1)
            {
                if (is_slowdown)
                    x -= 3;
                else
                    x -= 6;
            }
            else
            {
                x -= 0;
            }
        }
        else if (is_slowdown)
        {
            x -= 3;
        }
        else
        {
            x -= 6;
        }
        
        if (hp > (maxhp * hurt_rate))
            image_index = ((floor(timer / flash_speed) % attack_anim) + (move_anim * 2)) - 1;
        else
            image_index = ((floor(timer / flash_speed) % attack_anim) + attack_anim + (move_anim * 2)) - 1;
        
        if (timer >= (flash_speed * 10) || hp <= 0)
        {
            audio_play_sound(snd_enter_water, 0, 0);
            state = UnknownEnum.Value_2;
            sprite_index = spr_infected_frog_prince_mouse;
            move_anim = 10;
            attack_anim = 6;
            move_speed = 0.3;
            attack_range = 90;
        }
    }
}
