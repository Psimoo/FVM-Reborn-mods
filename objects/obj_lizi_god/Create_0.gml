event_inherited();
plant_id = "lizi_god";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_lizi_god;
else if (shape == 1)
    sprite_index = spr_lizi_god_1;
else
    sprite_index = spr_lizi_god_2;

attack_anim = 12;
idle_anim = 9;
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
target_type = "throw";
target_instance = -4;
cooldown_timer = cycle;
attacking = false;
