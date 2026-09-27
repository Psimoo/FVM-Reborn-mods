event_inherited();
plant_id = "panduola_god";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_panduola_god;
else if (shape == 1)
    sprite_index = spr_panduola_god_1;
else if (shape == 2)
    sprite_index = spr_panduola_god_2;
else if (shape == 3)
    sprite_index = spr_panduola_god_3;

image_index = 0;
image_speed = 0;

attack_anim = 0;
idle_anim = 0;
flash_speed = 5;
plant_type = "normal";
target_type = "all";
invincible = true;

trigger_timer = 0;
triggered = false;
