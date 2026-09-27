if (hp < max_hp && !invincible)
    obj_task_manager.card_loss++;

if (instance_exists(xiangshui_effect_obj))
    instance_destroy(xiangshui_effect_obj);

card_destroyed(id);
var idx = ds_list_find_index(global.buff_sources, id);

if (idx != -1)
    ds_list_delete(global.buff_sources, idx);

global.buff_dirty = true;

if (shape >= 2)
{
    with (obj_enemy_parent)
    {
        if (grid_row >= (other.grid_row - 2) && grid_row <= (other.grid_row + 2) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2))
        {
            var can_ash = !immune_to_ash;
            var _prev_hp = hp;
            hp -= 900;
            event_user(0);

            if (can_ash)
            {
                if (_prev_hp > 0 && hp <= 0)
                {
                    if ((is_boss || string_pos("infected_", mouse_id) == 1) && special_ash)
                    {
                        var inst = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                        inst.special_ash = true;
                        inst.sprite_index = sprite_index;
                        inst.image_index = image_index;
                    }
                    else
                    {
                        instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                    }

                    instance_destroy();
                }
            }
        }
    }

    audio_play_sound(snd_coke_bomb_explode, 0, false);
}
