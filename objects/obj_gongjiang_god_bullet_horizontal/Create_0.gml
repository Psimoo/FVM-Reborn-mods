
event_inherited();
damage = 0;
move_speed = 8;
damage_type = "normal";
target_type = "normal";
hittable_types = get_hittable_enemy_types(target_type);
hit_tick = 0;

hitted_enemy = ds_list_create();

origin_card_id = noone;
start_x = 0;
start_y = 0;

wp1_x = 0;
wp1_y = 0;
wp2_x = 0;
wp2_y = 0;

phase = 1;

shape = 0;
pin_chance = 0;
pin_duration = 90;

poison_chance = 0;
poison_spr = -1;

max_life_frames = 900;
life_frames = 0;

image_xscale = 1.8;
image_yscale = 1.8;
