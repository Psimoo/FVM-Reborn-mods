instance_destroy(inner_inst);
var _x = x;
var _y = y;
var _row = 2;
bleed_damage = hp;

with (obj_enemy_parent)
{
    if (hp > 0 && abs(grid_row - other.grid_row) <= _row && abs(grid_col - other.grid_col) <= _row)
    {
        hp -= other.bleed_damage;
        event_user(0);
        
        if (array_get_index(other.can_mouse_list, mouse_id) != -1 && !can_dropped)
        {
            into_act();
        }
        else if (immune_to_ash && hp > other.atk)
        {
            hp -= other.atk;
            event_user(0);
        }
        else
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

audio_play_sound(snd_coke_bomb_explode, 0, false);

if (global.screen_shake)
    Camera_Shock(5, 20);

var effect_inst = instance_create_depth(x, y, depth, obj_coke_bomb_explode);
effect_inst.sprite_index = spr_hera_explode;
event_inherited();
