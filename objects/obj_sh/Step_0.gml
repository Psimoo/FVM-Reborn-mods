if (global.is_paused)
    exit;

event_inherited();

if (is_frozen)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

var count = instance_number(obj_sh) - 1;
cluster_multiplier = 1 + (0.08 * count);
cluster_multiplier = min(cluster_multiplier, 1.5);

if (shape != 3)
    cluster_multiplier = 1;

var has_enemy = false;

if (state != CARD_STATE.SLEEP && state != CARD_STATE.AWAKE)
{
    with (obj_enemy_parent)
    {
        if ((grid_row == (other.grid_row - 1) || grid_row == other.grid_row || grid_row == (other.grid_row + 1)) && grid_col >= other.grid_col && grid_col <= (global.grid_cols + 1) && can_target_on(other.target_type, target_type))
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
        else if (attack_timer == (cycle - ((attack_anim - 3) * current_flash_speed)))
        {
            attack_timer++;
            event_user(1);
        }
        else if (attack_timer <= cycle)
        {
            attack_timer++;
            state = CARD_STATE.ATTACK;
        }
        else
        {
            attack_timer = 0;
            state = CARD_STATE.IDLE;
        }
    }
    else
    {
        attack_timer = 0;
        state = CARD_STATE.IDLE;
    }
}