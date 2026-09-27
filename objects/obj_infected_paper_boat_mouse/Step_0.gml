if (hp <= 0 && state != UnknownEnum.Value_3)
{
    timer = 0;
    state = UnknownEnum.Value_3;
    
    if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows)
    {
        sprite_index = spr_infected_paper_boat_mouse_land;
        death_anim = 17;
    }
    else if (global.grid_terrains[grid_row][grid_col].type == "water")
    {
        sprite_index = spr_infected_paper_boat_mouse;
        death_anim = 8;
    }
    else
    {
        sprite_index = spr_infected_paper_boat_mouse_land;
        death_anim = 17;
    }
}

if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows)
{
    sprite_index = spr_infected_paper_boat_mouse_land;
    death_anim = 17;
}
else if (state != UnknownEnum.Value_3)
{
    if (global.grid_terrains[grid_row][grid_col].type == "water")
    {
        if (sprite_index == spr_infected_paper_boat_mouse_land)
        {
            state = UnknownEnum.Value_4;
            sprite_index = spr_infected_paper_boat_mouse_enter;
            timer = 0;
            audio_play_sound(snd_enter_water, 0, 0);
            reversed = false;
        }
        
        death_anim = 8;
    }
    else
    {
        if (sprite_index == spr_infected_paper_boat_mouse)
        {
            state = UnknownEnum.Value_4;
            sprite_index = spr_infected_paper_boat_mouse_enter;
            timer = 0;
            audio_play_sound(snd_enter_water, 0, 0);
            reversed = true;
        }
        
        death_anim = 17;
    }
}

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

event_inherited();

if (global.is_paused || is_frozen)
    exit;

if (state == UnknownEnum.Value_4)
{
    x -= move_speed;
    
    if (hp > (maxhp * hurt_rate))
    {
        if (reversed)
            image_index = 8 - (floor(timer / flash_speed) % 8);
        else
            image_index = floor(timer / flash_speed) % 8;
    }
    else if (reversed)
    {
        image_index = (8 - (floor(timer / flash_speed) % 8)) + 7;
    }
    else
    {
        image_index = (floor(timer / flash_speed) % 8) + 7;
    }
    
    if (timer >= (flash_speed * 8) || hp <= 0)
    {
        state = UnknownEnum.Value_2;
        
        if (reversed)
            sprite_index = spr_infected_paper_boat_mouse_land;
        else
            sprite_index = spr_infected_paper_boat_mouse;
    }
}
