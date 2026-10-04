/// @desc 栗子神 · 投掷攻击（参考祝融的抛物线投掷 + 范围爆炸灼烧）
///  shape 0-2: 单行投掷，落地后范围灼烧
///  shape 3:  三行同时投掷，落地后范围灼烧

var _max = (shape >= 1) ? 5 : 4;
var _bullet_spr = spr_lizi_god_bullet;
if (shape == 1)
    _bullet_spr = spr_lizi_god_bullet_1;
else if (shape >= 2)
    _bullet_spr = spr_lizi_god_bullet_2;

if (shape >= 3)
{
    // ===== 灵魂融合：三行同时投掷 =====
    var t_mid = -4;
    var t_up = -4;
    var t_down = -4;
    var mx_mid = 99999;
    var mx_up = 99999;
    var mx_down = 99999;

    with (obj_enemy_parent)
    {
        if (hp > 0 && can_target_on(other.target_type, target_type))
        {
            if (grid_row == other.grid_row && x < mx_mid)
            {
                mx_mid = x;
                t_mid = id;
            }
            else if (grid_row == (other.grid_row - 1) && x < mx_up)
            {
                mx_up = x;
                t_up = id;
            }
            else if (grid_row == (other.grid_row + 1) && x < mx_down)
            {
                mx_down = x;
                t_down = id;
            }
        }
    }

    var _lane_h = global.grid_cell_size_y;

    // 中间行
    if (t_mid != -4)
    {
        var inst_mid = instance_create_depth(x + 20, y - 105, depth - 45, obj_lizi_god_bullet);
        inst_mid.damage = atk;
        inst_mid.row = grid_row;
        inst_mid.thrower_y = y;
        inst_mid.shape = shape;
        inst_mid.sprite_index = _bullet_spr;

        var target_col_mid = min(t_mid.grid_col, grid_col + _max);
        var grid_pos_mid = get_world_position_from_grid(target_col_mid, grid_row);
        var target_x_mid = grid_pos_mid.x;
        var target_y_mid = grid_pos_mid.y;
        var distance_x_mid = target_x_mid - inst_mid.x;
        var flight_time_mid = clamp(30 + ((distance_x_mid / 1000) * 45), 30, 75);
        var total_distance_y_mid = 500;
        inst_mid.move_speed = distance_x_mid / flight_time_mid;
        inst_mid.cgravity = (2 * total_distance_y_mid) / (flight_time_mid * flight_time_mid);
        inst_mid.cvspeed = total_distance_y_mid / flight_time_mid;
        inst_mid.target_col = target_col_mid;
        inst_mid.target_x = target_x_mid;
        inst_mid.target_y = target_y_mid;
        inst_mid.has_target = true;
        inst_mid.hit_enemy = false;
    }
    else
    {
        // 无目标时向前投掷最大距离
        var inst_mid2 = instance_create_depth(x + 20, y - 105, depth - 45, obj_lizi_god_bullet);
        inst_mid2.damage = atk;
        inst_mid2.row = grid_row;
        inst_mid2.thrower_y = y;
        inst_mid2.shape = shape;
        inst_mid2.sprite_index = _bullet_spr;

        var final_col_mid = min(grid_col + _max, 9);
        var grid_pos_mid2 = get_world_position_from_grid(final_col_mid, grid_row);
        var tx_mid = grid_pos_mid2.x;
        var ty_mid = grid_pos_mid2.y;
        var dx_mid = tx_mid - inst_mid2.x;
        var ft_mid = clamp(30 + ((dx_mid / 1000) * 45), 30, 75);
        var tdy_mid = 500;
        inst_mid2.move_speed = dx_mid / ft_mid;
        inst_mid2.cgravity = (2 * tdy_mid) / (ft_mid * ft_mid);
        inst_mid2.cvspeed = tdy_mid / ft_mid;
        inst_mid2.target_col = final_col_mid;
        inst_mid2.target_x = tx_mid;
        inst_mid2.target_y = ty_mid;
        inst_mid2.has_target = true;
        inst_mid2.hit_enemy = false;
    }

    // 上一行
    if (t_up != -4)
    {
        var inst_up = instance_create_depth(x + 20, y - 105 - _lane_h, depth, obj_lizi_god_bullet);
        inst_up.damage = atk;
        inst_up.row = grid_row - 1;
        inst_up.thrower_y = y - _lane_h;
        inst_up.shape = shape;
        inst_up.sprite_index = _bullet_spr;

        var target_col_up = min(t_up.grid_col, grid_col + _max);
        var grid_pos_up = get_world_position_from_grid(target_col_up, grid_row - 1);
        var target_x_up = grid_pos_up.x;
        var target_y_up = grid_pos_up.y;
        var distance_x_up = target_x_up - inst_up.x;
        var flight_time_up = clamp(30 + ((distance_x_up / 1000) * 45), 30, 75);
        var total_distance_y_up = 500;
        inst_up.move_speed = distance_x_up / flight_time_up;
        inst_up.cgravity = (2 * total_distance_y_up) / (flight_time_up * flight_time_up);
        inst_up.cvspeed = total_distance_y_up / flight_time_up;
        inst_up.target_col = target_col_up;
        inst_up.target_x = target_x_up;
        inst_up.target_y = target_y_up;
        inst_up.has_target = true;
        inst_up.hit_enemy = false;
    }

    // 下一行
    if (t_down != -4)
    {
        var inst_down = instance_create_depth(x + 20, y - 105 + _lane_h, depth - 90, obj_lizi_god_bullet);
        inst_down.damage = atk;
        inst_down.row = grid_row + 1;
        inst_down.thrower_y = y + _lane_h;
        inst_down.shape = shape;
        inst_down.sprite_index = _bullet_spr;

        var target_col_down = min(t_down.grid_col, grid_col + _max);
        var grid_pos_down = get_world_position_from_grid(target_col_down, grid_row + 1);
        var target_x_down = grid_pos_down.x;
        var target_y_down = grid_pos_down.y;
        var distance_x_down = target_x_down - inst_down.x;
        var flight_time_down = clamp(30 + ((distance_x_down / 1000) * 45), 30, 75);
        var total_distance_y_down = 500;
        inst_down.move_speed = distance_x_down / flight_time_down;
        inst_down.cgravity = (2 * total_distance_y_down) / (flight_time_down * flight_time_down);
        inst_down.cvspeed = total_distance_y_down / flight_time_down;
        inst_down.target_col = target_col_down;
        inst_down.target_x = target_x_down;
        inst_down.target_y = target_y_down;
        inst_down.has_target = true;
        inst_down.hit_enemy = false;
    }
}
else
{
    // ===== shape 0-2：单行投掷（参考祝融） =====
    var inst = instance_create_depth(x + 20, y - 105, depth - 45, obj_lizi_god_bullet);
    audio_play_sound(snd_throw, 0, 0);
    inst.damage = atk;
    inst.row = grid_row;
    inst.thrower_y = y;
    inst.shape = shape;
    inst.sprite_index = _bullet_spr;

    if (target_instance != -4 && instance_exists(target_instance))
    {
        var target_col = target_instance.grid_col;
        var max_col = grid_col + _max;
        var final_col = min(target_col, max_col);
        var grid_pos = get_world_position_from_grid(final_col, grid_row);
        var target_x = grid_pos.x;
        var target_y = grid_pos.y;
        var distance_x = target_x - inst.x;
        var flight_time = clamp(30 + ((distance_x / 1000) * 45), 30, 75);
        var total_distance_x = distance_x;
        var total_distance_y = 500;
        inst.move_speed = total_distance_x / flight_time;
        inst.cgravity = (2 * total_distance_y) / (flight_time * flight_time);
        inst.cvspeed = total_distance_y / flight_time;
        inst.target_col = final_col;
        inst.target_x = target_x;
        inst.target_y = target_y;
        inst.has_target = true;
    }
    else
    {
        var final_col = min(grid_col + _max, 9);
        var grid_pos = get_world_position_from_grid(final_col, grid_row);
        var target_x = grid_pos.x;
        var target_y = grid_pos.y;
        var distance_x = target_x - inst.x;
        var flight_time = clamp(30 + ((distance_x / 1000) * 45), 30, 75);
        var total_distance_x = distance_x;
        var total_distance_y = 500;
        inst.move_speed = total_distance_x / flight_time;
        inst.cgravity = (2 * total_distance_y) / (flight_time * flight_time);
        inst.cvspeed = total_distance_y / flight_time;
        inst.target_col = final_col;
        inst.target_x = target_x;
        inst.target_y = target_y;
        inst.has_target = true;
    }

    inst.hit_enemy = false;
}
