event_inherited();
plant_id = "rig";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 1)
    sprite_index = spr_rig_1;
else if (shape == 2)
    sprite_index = spr_rig_2;
else if (shape == 3)
    sprite_index = spr_rig_3;
else
    sprite_index = spr_rig;

attack_anim = 16;
idle_anim = 9;
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
target_type = "normal";
cooldown_timer = cycle;
attacking = false;
global.rig_count += 1;
