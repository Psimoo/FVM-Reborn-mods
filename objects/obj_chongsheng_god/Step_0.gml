if (global.is_paused) exit;

if (state == CARD_STATE.ATTACK && image_index >= 33 && timer >= flash_speed - 1) {
    instance_destroy();
    exit;
}

if (state == CARD_STATE.ATTACK && !revive_triggered && image_index >= 25) {
    revive_triggered = true;

    var _eff1_spr = spr_chongsheng_god_effect_0_1;
    if (shape == 1) _eff1_spr = spr_chongsheng_god_effect_1_1;
    else if (shape == 2) _eff1_spr = spr_chongsheng_god_effect_2_1;
    else if (shape == 3) _eff1_spr = spr_chongsheng_god_effect_3_1;

    var _n = revive_apply_targets(grid_col, grid_row, grid_range_col, grid_range_row,
        revive_limit - revive_count, true, _eff1_spr);
    revive_count += _n;

    if (_n > 0 && !buff_applied) {
        buff_applied = true;
    }
}

event_inherited();

if (is_frozen || state == CARD_STATE.SLEEP) exit;

if (state == CARD_STATE.IDLE) {
    if (array_length(revive_collect_targets(grid_col, grid_row, grid_range_col, grid_range_row, true)) > 0) {
        state = CARD_STATE.ATTACK;
        image_index = idle_anim + 1;
        timer = 0;
    }
}

if (buff_applied)
{
    var _my_id = id;
    var _bdur = buff_duration;
    var _red = chongsheng_reduction;
    for (var _col = grid_col - grid_range_col; _col <= grid_col + grid_range_col; _col++) {
        for (var _row = grid_row - grid_range_row; _row <= grid_row + grid_range_row; _row++) {
            if (_col < 0 || _col >= global.grid_cols || _row < 0 || _row >= global.grid_rows) continue;
            var _list = ds_grid_get(global.grid_plants, _col, _row);
            for (var _k = 0; _k < ds_list_size(_list); _k++) {
                var _p = _list[| _k];
                if (instance_exists(_p) && _p.hp > 0 && _p.id != _my_id) {
                    if (variable_instance_exists(_p, "chongsheng_buff_source")) {
                        _p.chongsheng_buff_source = _my_id;
                        _p.chongsheng_buff_timer = _bdur;
                        _p.chongsheng_buff_reduction = _red;
                    }
                }
            }
        }
    }
}

if (flash_value > 0) flash_value -= 10;

var grid_pos = get_grid_position_from_world(x, y);
grid_col = grid_pos.col;
grid_row = grid_pos.row;
depth = calculate_plant_depth(grid_col, grid_row, plant_type);
if (instance_exists(banding_star_obj)) {
    banding_star_obj.depth = depth - 1;
}

if (hp <= 0) instance_destroy();
