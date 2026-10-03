if (global.is_paused) image_speed = 0;
else image_speed = 0.75;
if (parent_plant != noone && !instance_exists(parent_plant)) instance_destroy();
