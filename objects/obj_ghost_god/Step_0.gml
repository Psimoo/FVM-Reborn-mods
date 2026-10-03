if (global.is_paused)
    exit;

event_inherited();

if (is_frozen || state == 4)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

var has_enemy = false;

with (obj_enemy_parent)
{
    if ((grid_row == other.grid_row || grid_col >= other.grid_col && grid_col <= (global.grid_cols + 1)) && can_target_on(other.target_type, target_type))
    {
        has_enemy = true;
        break;
    }
}

if (has_enemy)
{
    if (attack_timer <= (cycle - (attack_anim * current_flash_speed)))
    {
        attack_timer++;
    }
    else if (attack_timer <= cycle)
    {
        attack_timer++;
        state = 1;
    }
    else
    {
        attack_timer = 0;
        state = 0;
    }

    if (attack_timer == (cycle - 10))
    {
        if (shape < 3)
            event_user(1);
        else
            event_user(3);
    }

    if (attack_timer == (cycle - 5))
    {
        if (shape < 3)
            event_user(1);
        else
            event_user(3);
    }

    if (attack_timer == (cycle - 15) && shape >= 1)
        event_user(3);

    if (attack_timer == (cycle - 20) && shape >= 3)
        event_user(3);
}
else
{
    attack_timer = 0;
    state = 0;
}
