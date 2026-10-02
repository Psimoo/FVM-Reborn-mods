event_inherited();
plant_id = "guangming_god";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_guangming_god;
else if (shape == 1)
    sprite_index = spr_guangming_god_1;
else if (shape == 2)
    sprite_index = spr_guangming_god_2;
else if (shape == 3)
    sprite_index = spr_guangming_god_3;

idle_anim = 11;           // 前12帧为待机（帧0-11）
attack_anim = 21;         // 攻击动画21帧（帧12-32）
attack_fire_frame = 21;   // 第21帧释放子弹
flash_speed = 2;
plant_type = "normal";
is_slowdown = false;
current_hp = hp;
image_speed = 0;

// 攻击相关变量
attack_timer = 0;
has_fired = false;
attack_tick = 0;
attack_tick_timer = 0;
attack_targets = [];
state = CARD_STATE.IDLE;

// 范围（以格子为单位）
grid_range = 2; // 5x5 = 上下左右各2格
if (shape >= 3)
    grid_range = 3; // 7x7 = 上下左右各3格

// 光明神常驻在场
image_alpha = 1;

// 常驻光环效果
guangming_effect_obj = instance_create_depth(x, y - 30, 0, obj_guangming_god_effect);
guangming_effect_obj.parent_plant = id;
guangming_effect_obj.sprite_index = spr_guangming_god_effect;
guangming_effect_obj.is_one_shot = false;
