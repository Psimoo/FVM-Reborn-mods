event_inherited();
plant_id = "shennong_god";
event_user(0);

if (shape == 0)
    sprite_index = spr_shennong_god;
else if (shape == 1)
    sprite_index = spr_shennong_god_1;
else
    sprite_index = spr_shennong_god_2;

attack_anim = 12;   // 攻击动画12帧（第14-25帧，索引13-24）
idle_anim = 12;     // 闲置动画13帧（第1-13帧，索引0-12）
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
target_type = "all"; // 可攻击所有类型：地面、空中、地下等

// 炎帝使用自定义攻击循环，计时器必须在创建时初始化。
attack_timer = 0;
cooldown_timer = 0;
