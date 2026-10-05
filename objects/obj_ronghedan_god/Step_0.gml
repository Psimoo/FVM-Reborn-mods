if global.is_paused{
	exit
}
event_inherited();
if is_frozen || state == CARD_STATE.SLEEP{
	exit
}
var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}
// 检测自身右方是否有敌人，并获取最近的敌人
var has_enemy = false
var target_enemy = noone
var min_distance = 10000

with(obj_enemy_parent){
    if (grid_row == other.grid_row && grid_col >= other.grid_col && grid_col <= (global.grid_cols + 1) && can_target_on(other.target_type,target_type)){
        var distance = grid_col - other.grid_col
        if (distance < min_distance) {
            min_distance = distance
            target_enemy = id
            has_enemy = true
        }
    }
}

// 存储目标敌人信息
if (has_enemy) {
    target_instance = target_enemy
} else {
    target_instance = noone
}

//攻击逻辑
if (has_enemy) {
    if (attack_timer <= cycle - attack_anim * current_flash_speed) {
        attack_timer++;
        has_fired = false;
    } else if (attack_timer <= cycle) {
        attack_timer++;
        state = CARD_STATE.ATTACK;

        // 第20帧时发射子弹
        if (!has_fired && floor(image_index) >= 20) {
            has_fired = true;
            event_user(1);
            audio_play_sound(snd_throw, 0, 0);
        }
    } else {
        attack_timer = 0;
        has_fired = false;
        state = CARD_STATE.IDLE;
    }
} else {
    // 没有符合条件的敌人，重置状态
    attack_timer = 0;
    has_fired = false;
    state = CARD_STATE.IDLE;
}
