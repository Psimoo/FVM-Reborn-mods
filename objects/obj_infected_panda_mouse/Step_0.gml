if (hp <= 0 && state != UnknownEnum.Value_3)
{
    sprite_index = spr_infected_panda_mouse;
    state = UnknownEnum.Value_3;
    timer = 0;
}

event_inherited();

if (global.is_paused || is_frozen || is_stun)
    exit;

if (hp <= (maxhp * hurt_rate) && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_3 && state != UnknownEnum.Value_5 && grid_col > 4 && !throwed)
{
    timer = 0;
    sprite_index = spr_infected_panda_mouse_throw;
    state = UnknownEnum.Value_5;
    throwed = true;
}

if (state == UnknownEnum.Value_1)
{
    state = UnknownEnum.Value_4;
    timer = 0;
}

var current_move_speed = 0;

if (is_slowdown)
{
    flash_speed = 12;
    current_move_speed = move_speed / 2;
}
else
{
    flash_speed = 6;
    current_move_speed = move_speed;
}

if (state == UnknownEnum.Value_4)
{
    if ((hp / maxhp) > hurt_rate)
        image_index = (floor(timer / flash_speed) % attack_anim) + (move_anim * 2);
    else
        image_index = (floor(timer / flash_speed) % attack_anim) + (move_anim * 2) + attack_anim;
    
    if (timer == (10 * flash_speed))
    {
        if (instance_exists(target_plant))
        {
            with (target_plant)
            {
                if (!invincible)
                {
                    hp -= other.atk;
                    event_user(2);
                }
            }
        }
    }
    
    if (timer >= ((attack_anim * flash_speed) - 1))
    {
        state = UnknownEnum.Value_2;
        timer = 0;
    }
}

if (state == UnknownEnum.Value_5)
{
    if ((hp / maxhp) > hurt_rate)
        image_index = floor(timer / flash_speed) % 14;
    else
        image_index = (floor(timer / flash_speed) % 14) + 14;
    
    if (timer >= ((14 * flash_speed) - 1))
    {
        state = UnknownEnum.Value_2;
        timer = 0;
        sprite_index = spr_panda_mouse;
    }
    
    if (timer == ((7 * flash_speed) - 1))
        event_user(1);
    
    if (timer == ((9 * flash_speed) - 1))
        event_user(2);
}
