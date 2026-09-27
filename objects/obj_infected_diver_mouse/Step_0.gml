if (hp <= 0 && state != UnknownEnum.Value_3)
{
    timer = 0;
    state = UnknownEnum.Value_3;
    
    if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows)
    {
        sprite_index = spr_infected_diver_mouse_land;
    }
    else if (global.grid_terrains[grid_row][grid_col].type == "water")
    {
        sprite_index = spr_infected_diver_mouse;
        death_anim = 10;
    }
    else
    {
        sprite_index = spr_infected_diver_mouse_land;
        death_anim = 13;
    }
}

if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows)
{
    sprite_index = spr_infected_diver_mouse_land;
    move_anim = 16;
    death_anim = 13;
}
else if (state != UnknownEnum.Value_3)
{
    if (global.grid_terrains[grid_row][grid_col].type == "water" && !entered)
    {
        if (sprite_index == spr_infected_diver_mouse_land)
        {
            state = UnknownEnum.Value_4;
            sprite_index = spr_infected_diver_mouse_enter;
            timer = 0;
            audio_play_sound(snd_enter_water, 0, 0);
            reversed = false;
        }
        
        move_anim = 4;
        death_anim = 10;
    }
}

if (state == UnknownEnum.Value_1 && entered)
{
    if (instance_exists(target_plant) && !up)
    {
        sprite_index = spr_infected_diver_mouse_up;
        state = UnknownEnum.Value_4;
        timer = 0;
    }
    
    if (!instance_exists(target_plant) && up)
    {
        sprite_index = spr_infected_diver_mouse_up;
        state = UnknownEnum.Value_4;
        timer = 0;
    }
}

event_inherited();

if (global.is_paused || is_frozen)
    exit;

if (state == UnknownEnum.Value_4)
{
    if (!entered)
    {
        if (hp <= 0)
        {
            timer = 0;
            state = UnknownEnum.Value_3;
            
            if (reversed)
                sprite_index = spr_infected_diver_mouse_land;
            else
                sprite_index = spr_infected_diver_mouse;
        }
        
        x -= move_speed;
        
        if (hp > (maxhp * hurt_rate))
        {
            if (reversed)
                image_index = 9 - (floor(timer / flash_speed) % 9);
            else
                image_index = floor(timer / flash_speed) % 9;
        }
        else if (reversed)
        {
            image_index = (9 - (floor(timer / flash_speed) % 9)) + 8;
        }
        else
        {
            image_index = (floor(timer / flash_speed) % 9) + 8;
        }
        
        if (timer >= (flash_speed * 9) || hp <= 0)
        {
            state = UnknownEnum.Value_2;
            
            if (reversed)
            {
                sprite_index = spr_infected_diver_mouse_land;
                entered = false;
            }
            else
            {
                sprite_index = spr_infected_diver_mouse;
                entered = true;
            }
            
            if (hp <= 0)
            {
                timer = 0;
                state = UnknownEnum.Value_3;
            }
        }
    }
    else
    {
        timer++;
        
        if (!up)
        {
            if (hp > (hp * hurt_rate))
                image_index = floor(timer / flash_speed) % 4;
            else
                image_index = (floor(timer / flash_speed) % 4) + 3;
        }
        else if (hp > (hp * hurt_rate))
        {
            image_index = 4 - (floor(timer / flash_speed) % 4);
        }
        else
        {
            image_index = (4 - (floor(timer / flash_speed) % 4)) + 3;
        }
        
        if (timer >= (flash_speed * 4) || hp <= 0)
        {
            state = UnknownEnum.Value_2;
            sprite_index = spr_infected_diver_mouse;
            up = !up;
            
            if (hp <= 0)
            {
                timer = 0;
                state = UnknownEnum.Value_3;
            }
        }
    }
}

if (sprite_index == spr_infected_diver_mouse && state != UnknownEnum.Value_1)
    target_type = "diver";
else
    target_type = "normal";
