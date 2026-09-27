if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows)
{
    if (hp > (maxhp - helmet_hp))
        sprite_index = spr_infected_duck_mouse_land_helmet;
    else
        sprite_index = spr_infected_duck_mouse_land;
    
    death_anim = 12;
}
else
{
    if (global.grid_terrains[grid_row][grid_col].type == "water")
    {
        if (sprite_index == spr_infected_duck_mouse_land || sprite_index == spr_infected_duck_mouse_land_helmet)
        {
            state = UnknownEnum.Value_4;
            sprite_index = spr_infected_duck_mouse_enter;
            timer = 0;
            audio_play_sound(snd_enter_water, 0, 0);
            reversed = false;
        }
        
        death_anim = 8;
    }
    else
    {
        if (sprite_index == spr_infected_duck_mouse || sprite_index == spr_infected_duck_mouse_helmet)
        {
            state = UnknownEnum.Value_4;
            sprite_index = spr_infected_duck_mouse_enter;
            timer = 0;
            audio_play_sound(snd_enter_water, 0, 0);
            reversed = true;
        }
        
        death_anim = 12;
    }
    
    if (hp > (maxhp - helmet_hp) && state != UnknownEnum.Value_4)
    {
        if (global.grid_terrains[grid_row][grid_col].type == "water")
            sprite_index = spr_infected_duck_mouse_helmet;
        else
            sprite_index = spr_infected_duck_mouse_land_helmet;
    }
    else if (hp <= (maxhp - helmet_hp) && state != UnknownEnum.Value_4)
    {
        if (global.grid_terrains[grid_row][grid_col].type == "water")
            sprite_index = spr_infected_duck_mouse;
        else
            sprite_index = spr_infected_duck_mouse_land;
    }
}

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

if (hp <= (maxhp - helmet_hp) && !armor_dropped)
{
    var inst = instance_create_depth(x - 25, y - 175, depth - 1, obj_enemy_armor);
    
    if (sprite_index == spr_infected_duck_mouse || sprite_index == spr_infected_duck_mouse_helmet)
    {
        inst.y += 30;
        inst.water = true;
    }
    
    inst.ground_y = y - 45;
    inst.type = "helmet";
    inst.x_speed = random_range(3, 5);
    inst.y_speed = random_range(-5, -8);
    inst.cgravity = 0.8;
    inst.sprite_index = spr_football_helmet;
    armor_dropped = true;
}

event_inherited();

if (global.is_paused || is_frozen)
    exit;

if (state == UnknownEnum.Value_4)
{
    if (hp > (maxhp - helmet_hp))
        sprite_index = spr_infected_duck_mouse_enter_helmet;
    else
        sprite_index = spr_infected_duck_mouse_enter;
    
    x -= move_speed;
    
    if (hp > (maxhp * hurt_rate))
    {
        if (reversed)
            image_index = 4 - (floor(timer / flash_speed) % 4);
        else
            image_index = floor(timer / flash_speed) % 4;
    }
    else if (reversed)
    {
        image_index = (4 - (floor(timer / flash_speed) % 4)) + 4;
    }
    else
    {
        image_index = (floor(timer / flash_speed) % 4) + 4;
    }
    
    if (timer >= (flash_speed * 4) || hp <= 0)
    {
        state = UnknownEnum.Value_2;
        timer = 0;
        
        if (reversed)
        {
            if (hp > (maxhp - helmet_hp))
                sprite_index = spr_infected_duck_mouse_land_helmet;
            else
                sprite_index = spr_infected_duck_mouse_land;
        }
        else if (hp > (maxhp - helmet_hp))
        {
            sprite_index = spr_infected_duck_mouse_helmet;
        }
        else
        {
            sprite_index = spr_infected_duck_mouse;
        }
    }
}
