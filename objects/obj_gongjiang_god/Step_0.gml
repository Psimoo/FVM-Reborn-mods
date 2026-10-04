
if (global.is_paused) exit;
event_inherited();

if (is_frozen) exit;

var current_flash_speed = flash_speed;
if (is_slowdown) current_flash_speed *= 2;

attack_timer++;

if (attack_timer == (cycle - attack_anim * current_flash_speed))
{
    state = CARD_STATE.ATTACK;
}

if (attack_timer == (cycle - (attack_anim - fire_frame_index) * current_flash_speed))
{
    fire_dir1 = true;
    fire_dir2 = true;
    event_user(1);
}

if (attack_timer > cycle)
{
    attack_timer = 0;
    state = CARD_STATE.IDLE;
}
