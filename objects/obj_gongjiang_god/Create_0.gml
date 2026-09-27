// 工匠神使 - 创建事件
// 继承卡片父对象默认值，注册 plant_id，按形态切换精灵
event_inherited();
plant_id = "gongjiang_god";
event_user(0);

if (shape == 0) sprite_index = spr_gongjiang_god;
else if (shape == 1) sprite_index = spr_gongjiang_god_1;
else if (shape == 2) sprite_index = spr_gongjiang_god_2;
else if (shape == 3) sprite_index = spr_gongjiang_god_3;

fire_dir1 = false;
fire_dir2 = false;
attack_anim = 12;        // 攻击帧：13-24（共12帧）
idle_anim = 12;          // 闲置帧：0-12（共13帧）
flash_speed = 5;
fire_frame_index = 6;    // 子弹在攻击动画第7帧（索引6 = 总帧19）射出
plant_type = "normal";
target_type = "all";    // 可攻击地下/陆地/飞行老鼠
is_slowdown = false;

// 三转(含以上)命中后 20% 概率定身 1.5 秒（90 帧）
pin_chance = 0.20;
pin_duration = 90;

// 子弹移动速度
bullet_speed = 8;
