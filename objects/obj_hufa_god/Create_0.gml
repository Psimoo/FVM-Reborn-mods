event_inherited();
plant_id = "hufa_god";
event_user(0);

if (shape == 0)
    sprite_index = spr_hufa_god;
else if (shape == 1)
    sprite_index = spr_hufa_god_1;
else if (shape == 2)
    sprite_index = spr_hufa_god_2;
else if (shape == 3)
    sprite_index = spr_hufa_god_3;

idle_anim = 15;
attack_anim = 13;
flash_speed = 5;
plant_type = "normal";
feature_type = "normal";
is_slowdown = false;
