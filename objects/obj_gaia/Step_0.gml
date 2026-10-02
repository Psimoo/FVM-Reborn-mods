if (global.is_paused)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

event_inherited();

if (is_frozen || state == 4)
    exit;

if (cooldown_timer > 0)
{
    cooldown_timer--;
    state = 0;
    exit;
}

var has_enemy = false;
var target_enemy = -4;

if (!attacking)
{
 var min_distance = 10000;
 var row_offset = (shape == 3) ? 2 : 1;

 with (obj_enemy_parent)
 {
 if (grid_col <= (global.grid_cols + 1) && can_target_on(other.target_type, target_type) && grid_row >= (other.grid_row - row_offset) && grid_row <= (other.grid_row + row_offset))
 {
 var distance = grid_col - other.grid_col;

 if (distance < min_distance)
 {
 min_distance = distance;
 target_enemy = id;
 has_enemy = true;
 }
 }
 }
}

if (has_enemy)
{
 target_x = target_enemy.x;
 target_y = target_enemy.y;
 target_row = target_enemy.grid_row;
 attacking = true;
}

if (attacking)
{
    state = 1;
    attack_timer++;
    
    if (attack_timer == ((attack_anim - 10) * current_flash_speed))
        event_user(1);
    
    if (attack_timer == ((attack_anim - 8) * current_flash_speed))
        event_user(1);
    
    if (attack_timer == ((attack_anim - 6) * current_flash_speed))
        event_user(1);
    
    if (attack_timer >= (attack_anim * current_flash_speed))
    {
        attacking = false;
        cooldown_timer = cycle - attack_timer;
        attack_timer = 0;
        target_x = -4;
    }
}

