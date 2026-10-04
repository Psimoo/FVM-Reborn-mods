// 工匠神使 - 步事件
// 有敌人在前方时按 cycle 计时开火，触发用户事件1（Other_11）发射两路子弹
if (global.is_paused) exit;
event_inherited();

if (is_frozen) exit;

var current_flash_speed = flash_speed;
if (is_slowdown) current_flash_speed *= 2;

attack_timer++;

// 进入攻击状态（从攻击动画第1帧开始播放）
if (attack_timer == (cycle - attack_anim * current_flash_speed))
{
    state = CARD_STATE.ATTACK;
}

// 子弹在攻击动画第 fire_frame_index 帧射出（总帧第19帧）
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
