damage = 0;
move_speed = 0;
row = 0;
hitted_enemy = ds_list_create();
shape = 0;
burnt = 0;
bounced = false;
damage_type = "pierce";
target_type = "normal";
brazier_list = ds_list_create();
image_xscale = 1.8;
image_yscale = 1.8;
// Keep the visual scale at 1.8 while using the sprite's unscaled bbox for collisions.
use_unscaled_collision = true;
hittable_types = get_hittable_enemy_types(target_type);
