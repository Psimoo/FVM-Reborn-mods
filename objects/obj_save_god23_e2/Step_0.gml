if (global.is_paused)
    exit;

timer++;
image_index = floor(timer / flash_speed) % anim_frames;
if (is_vertical) {
    y += move_speed;
    grid_row = get_grid_position_from_world(x, y).row;
} else {
    x += move_speed;
}

if (is_vertical && y > get_world_position_from_grid(0, global.grid_rows - 1).y + global.grid_cell_size_y)
    instance_destroy();
else if (!is_vertical && x > 2200)
    instance_destroy();

with (obj_enemy_parent)
{
    if (hp > 0 && grid_row == other.grid_row && abs(x - other.x) <= 100)
    {
        if (is_boss || array_get_index(other.ignore_list, mouse_id) != -1)
        {
            if (array_get_index(other.hit_array, id) == -1)
            {
                if (mouse_id == "barrier" && (other.shape == 3 || (other.shape == 2 && irandom(1) == 0)))
                {
                    hp = 0
                }
                else
                {
                    damage_amount = other.atk;
                    damage_type = other.damage_type;
                    event_user(0);
                }
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
