event_inherited();

if (state == UnknownEnum.Value_1)
{
    state = UnknownEnum.Value_4;
    timer = 0;
}

if (hp <= 0 && state != UnknownEnum.Value_3)
{
    state = UnknownEnum.Value_3;
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
                    hp -= 900;
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
