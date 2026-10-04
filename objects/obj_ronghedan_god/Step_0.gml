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

// ========== 攻击计时与状态切换 ==========
if (has_enemy) {
    if (attack_timer < cycle) {
        attack_timer++;
    } else {
        attack_timer = 0;
        has_fired = false;
    }
    // 进入攻击阶段（播放攻击动画）
    if (attack_timer > cycle - attack_anim * current_flash_speed) {
        state = CARD_STATE.ATTACK;
    }
} else {
    attack_timer = 0;
    has_fired = false;
    state = CARD_STATE.IDLE;
}

// ========== 动画播放 ==========
var _total_frames = sprite_get_number(sprite_index);
if (_total_frames > 1) {
    if (state == CARD_STATE.IDLE) {
        // 空闲动画：0 ~ idle_anim 帧循环
        if (image_index < idle_anim - 1) {
            image_index += (1 / current_flash_speed);
        } else {
            image_index = 0;
        }
    } else if (state == CARD_STATE.ATTACK) {
        // 攻击动画：从第 idle_anim 帧开始播放
        var _attack_start = idle_anim;
        var _attack_end = idle_anim + attack_anim - 1;
        if (image_index < _attack_start) {
            image_index = _attack_start;
        } else if (image_index < _attack_end - 0.01) {
            image_index += (1 / current_flash_speed);
        } else {
            image_index = _attack_end;
        }
        
        // 第20帧时发射子弹
        if (!has_fired && image_index >= 20) {
            has_fired = true;
            event_user(1);
            audio_play_sound(snd_throw, 0, 0);
        }
    }
}
