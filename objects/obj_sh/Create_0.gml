event_inherited();
plant_id = "sheng_huo";
obj_type = object_index;
current_level = 1;
cluster_multiplier = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_sh;
else if (shape == 1)
    sprite_index = spr_sh_1;
else if (shape == 2)
    sprite_index = spr_sh_2;
else if (shape == 3)
    sprite_index = spr_sh_3;

attack_anim = 9;
idle_anim = 10;
flash_speed = 5;
plant_type = "normal";
target_type = "pierce";
is_slowdown = false;
awake_anim = 0;
anim_timer = 0;
base_atk = atk;

if (shape == 2)
    target_type = "all";
else if (shape == 3)
    target_type = "all";
else
    target_type = "pierce";

