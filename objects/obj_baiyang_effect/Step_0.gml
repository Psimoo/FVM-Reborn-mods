if (global.is_paused)
    exit;

timer++;
image_index = floor(timer / flash_speed) % anim_frames;
x += move_speed;

if (x > 2200)
    instance_destroy();

with (obj_enemy_parent)
{
    var cross_server_boss = is_boss && global.map_name == "跨服远征";
    if (hp > 0 && !cross_server_boss && grid_row == other.grid_row && abs(x - other.x) <= 100)
    {
        if (is_boss || array_get_index(other.ignore_list, mouse_id) != -1)
        {
            if (array_get_index(other.hit_array, id) == -1)
            {
                hp -= other.atk;
                event_user(0);
                array_push(other.hit_array, id);
            }
        }
        else
        {
            var inst = instance_create_depth(x, y, depth, obj_knock_back_effect);
            inst.sprite_index = sprite_index;
            inst.image_index = image_index;
            instance_destroy();
        }
    }
}
