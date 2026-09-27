event_inherited();
plant_id = "shizi";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_shizi;
else if (shape == 1)
    sprite_index = spr_shizi_1;
else if (shape == 2)
    sprite_index = spr_shizi_2;

attack_anim = 13;
idle_anim = 10;
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
anim_timer = 0;
awake_anim = 0;
wake_timer = 0;
