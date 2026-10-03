event_inherited();
plant_id = "hongliukaochuan";
event_user(0);

// 0/1/2 转均已接正式素材（各 20 帧攻击动画）
if (shape == 0)
    sprite_index = spr_hongliukaochuan;
else if (shape == 1)
    sprite_index = spr_hongliukaochuan_1;
else if (shape == 2)
    sprite_index = spr_hongliukaochuan_2;

// 父对象约定：待机 = 0~idle_anim（共 idle_anim+1 帧），攻击 = idle_anim+1 起共 attack_anim 帧
// 三形态素材都是 20 帧：0~12 待机（13 帧），13~19 攻击（7 帧），合计 20 帧正好用满
idle_anim = 12;
attack_anim = 7;
flash_speed = 5;
plant_type = "normal";
feature_type = "normal";
is_slowdown = false;
attack_type = ATTACK_TYPE.SHOOTER;
