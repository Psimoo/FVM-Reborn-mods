var _x = x;
var _y = y;
var _col = grid_col;
var _row = grid_row;
var _atk = atk;
var _shape = shape;

with (obj_enemy_parent)
{
    var in_range = false;
    
    if (_shape >= 2)
    {
        if (grid_row == _row || grid_col == _col || grid_col == (_col + 1))
            in_range = true;
    }
    else
    {
        var is_horizontal = grid_row == _row && abs(grid_col - _col) <= 2;
        var is_vertical_1 = grid_col == _col && abs(grid_row - _row) <= 2;
        var is_vertical_2 = grid_col == (_col + 1) && abs(grid_row - _row) <= 2;
        
        if (is_horizontal || is_vertical_1 || is_vertical_2)
            in_range = true;
    }
    
    if (in_range)
    {
        var is_intersection = grid_row == _row && (grid_col == _col || grid_col == (_col + 1));
        var actual_damage = _atk;
        
        if (is_intersection)
            actual_damage = _atk * 2;
        
        if (immune_to_ash && hp > actual_damage)
        {
            hp -= actual_damage;
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

audio_play_sound(snd_bottle_explode, 0, false);

if (global.screen_shake)
    Camera_Shock(5, 20);

audio_play_sound(snd_bottle_explode, 0, false);

if (global.screen_shake)
    Camera_Shock(5, 20);

if (shape == 2)
{
    var effect_inst = instance_create_depth(x - 15, y + 15, depth, obj_wine_bottle_bomb_explode);
    effect_inst.col = grid_col;
    effect_inst.row = grid_row;
    effect_inst.is_parent = true;
    var effect_inst1 = instance_create_depth(x - 15, y + 15, depth, obj_wine_bottle_bomb_explode);
    effect_inst1.col = grid_col;
    effect_inst1.row = grid_row;
    effect_inst1.is_parent = true;
    effect_inst1.type = 1;
}
else
{
    var effect_inst = instance_create_depth(x - 15, y + 15, depth, obj_shuiping_explode);
    effect_inst.col = grid_col;
    effect_inst.row = grid_row;
    effect_inst.is_parent = true;
    var effect_inst1 = instance_create_depth(x - 15, y + 15, depth, obj_shuiping_explode);
    effect_inst1.col = grid_col;
    effect_inst1.row = grid_row;
    effect_inst1.is_parent = true;
    effect_inst1.type = 1;
}

event_inherited();
