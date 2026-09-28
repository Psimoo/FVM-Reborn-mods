if (global.is_paused)
    exit;

event_inherited();

lifetime_timer--;
if (lifetime_timer <= 0)
{
    if (instance_exists(time_god_effect_obj))
        instance_destroy(time_god_effect_obj);
    instance_destroy();
    exit;
}

var _tg_blacklist = ["brahma", "ice_cream", "magic_chicken", "clotho"];

var col_offset = 1;
var row_offset = 1;
var cd_ratio = 0.7;

if (shape == 2)
{
    col_offset = 2;
    row_offset = 2;
    cd_ratio = 0.5;
}
else if (shape == 3)
{
    col_offset = 999;
    row_offset = 999;
    cd_ratio = 0;
}

var current_interval;
if (exec_count == 0)
    current_interval = first_delay;
else
    current_interval = cycle_interval;

var current_flash = flash_speed;
if (is_slowdown)
    current_flash *= 2;

var max_flash = floor(current_interval / idle_anim);
if (max_flash < 1)
    max_flash = 1;
if (current_flash > max_flash)
    current_flash = max_flash;

var anim_play_frames = idle_anim * current_flash;

if (exec_count < max_exec)
{
    reduction_timer--;

    if (reduction_timer <= 0)
    {
        var my_col = grid_col;
        var my_row = grid_row;

        var nearby_ids = ds_list_create();

        with (obj_card_parent)
        {
            if (plant_id != "time_god" && plant_id != "player" && array_get_index(_tg_blacklist, plant_id) == -1)
            {
                var dx = abs(grid_col - my_col);
                var dy = abs(grid_row - my_row);

                if (dx <= col_offset && dy <= row_offset)
                {
                    if (ds_list_find_index(nearby_ids, plant_id) == -1)
                        ds_list_add(nearby_ids, plant_id);
                }
            }
        }

        with (obj_card_slot)
        {
            if (cooldown_timer < cooldown)
            {
                if (ds_list_find_index(nearby_ids, card_id) != -1)
                {
                    var boost = floor(cooldown * (1 - cd_ratio));
                    cooldown_timer = min(cooldown, cooldown_timer + boost);
                }
            }
        }

        ds_list_destroy(nearby_ids);
        exec_count++;

        if (exec_count < max_exec)
            reduction_timer = cycle_interval;

        anim_frame = 0;
        image_index = 0;
        tg_timer = 0;
        image_alpha = 0;
        if (instance_exists(time_god_effect_obj))
            time_god_effect_obj.image_alpha = 0;
        if (instance_exists(banding_star_obj))
            banding_star_obj.image_alpha = 0;
    }
    else if (reduction_timer <= anim_play_frames)
    {
        if (image_alpha == 0)
        {
            image_alpha = 1;
            if (instance_exists(time_god_effect_obj))
                time_god_effect_obj.image_alpha = 1;
            if (instance_exists(banding_star_obj))
                banding_star_obj.image_alpha = 1;
        }

        if (tg_timer < current_flash - 1)
        {
            tg_timer++;
        }
        else
        {
            tg_timer = 0;
            if (anim_frame < idle_anim)
            {
                anim_frame++;
                image_index = anim_frame;
            }
        }
    }
    else
    {
        if (image_alpha > 0)
        {
            image_alpha = 0;
            if (instance_exists(time_god_effect_obj))
                time_god_effect_obj.image_alpha = 0;
            if (instance_exists(banding_star_obj))
                banding_star_obj.image_alpha = 0;
        }
    }
}
else
{
    if (image_alpha > 0)
    {
        image_alpha = 0;
        if (instance_exists(time_god_effect_obj))
            time_god_effect_obj.image_alpha = 0;
        if (instance_exists(banding_star_obj))
            banding_star_obj.image_alpha = 0;
    }
}
