if (global.is_paused)
    exit;

timer++;
var total_frames = sprite_get_number(sprite_index);
var total_time = total_frames * 5;
var damage_interval = total_time / 10;
image_index = floor(timer / 5);

if (image_index >= total_frames)
    image_index = total_frames - 1;

if (floor((timer - 1) / damage_interval) != floor(timer / damage_interval))
    event_user(0);

if (timer >= total_time)
    instance_destroy();
