
event_inherited();
damage = 0;
move_speed = 8;
vertical_dir = 1;
col = 0;
damage_type = "normal";
target_type = "normal";
hittable_types = get_hittable_enemy_types(target_type);
hit_tick = 0;

hitted_enemy = ds_list_create();

shape = 0;
pin_chance = 0;
pin_duration = 90;

poison_chance = 0;
poison_spr = -1;

max_life_frames = 600;
life_frames = 0;

my_top = global.grid_offset_y - 40;
my_bottom = global.grid_offset_y + global.grid_cell_size_y * global.grid_rows + 40;

image_xscale = 1.8;
image_yscale = 1.8;
