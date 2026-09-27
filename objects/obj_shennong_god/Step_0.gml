if (global.is_paused)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

event_inherited();

if (is_frozen || state == CARD_STATE.SLEEP)
    exit;

// 冷却中则跳过攻击逻辑
if (cooldown_timer > 0)
{
    cooldown_timer--;
    exit;
}

// 检测全屏是否有可攻击的敌人（子弹全屏飞行）
var has_enemy = false;

with (obj_enemy_parent)
{
    if (grid_col >= 0 && grid_col <= (global.grid_cols + 1)
        && can_target_on(other.target_type, target_type))
    {
        has_enemy = true;
        break;
    }
}

var attack_total_frames = attack_anim * current_flash_speed;

if (has_enemy)
{
    attack_timer++;

    // 第19帧发射（索引18），攻击从第14帧（索引13）开始
    // 攻击动画共12帧（索引13~24），第19帧是攻击开始后第6帧（索引18-13=5）
    var fire_frame_in_attack = 5;
    var fire_time = fire_frame_in_attack * current_flash_speed;

    // 开始攻击
    if (attack_timer == 1)
    {
        state = CARD_STATE.ATTACK;
        image_index = idle_anim + 1;
    }

    // 第19帧发射子弹
    if (attack_timer == fire_time)
    {
        event_user(1);
    }

    // 攻击结束，重置冷却
    if (attack_timer >= attack_total_frames)
    {
        attack_timer = 0;
        cooldown_timer = cycle - attack_total_frames;
        state = CARD_STATE.IDLE;
    }
}
else
{
    attack_timer = 0;
    state = CARD_STATE.IDLE;
}
