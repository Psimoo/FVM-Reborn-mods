function build_shield_grid()
{
    global.shield_grid = array_create(global.grid_cols);
    
    for (var c = 0; c < global.grid_cols; c++)
        global.shield_grid[c] = array_create(global.grid_rows, 0);
}

function rebuild_shield_grid()
{
    for (var c = 0; c < global.grid_cols; c++)
    {
        for (var r = 0; r < global.grid_rows; r++)
            global.shield_grid[c][r] = 0;
    }
}

function apply_shield_buff(arg0)
{
    var cells = arg0.buff_cells;
    
    for (var i = 0; i < array_length(cells); i++)
    {
        var c = cells[i][0];
        var r = cells[i][1];
        var v = cells[i][2];
        global.shield_grid[c][r] = v;
    }
}

function add_shield_area(arg0, arg1, arg2, arg3)
{
    for (var dx = -2; dx <= 2; dx++)
    {
        for (var dy = -2; dy <= 2; dy++)
        {
            var c = arg1 + dx;
            var r = arg2 + dy;

            if (c >= 0 && c < global.grid_cols && r >= 0 && r < global.grid_rows)
            {
                var dist = max(abs(dx), abs(dy));
                var v;

                if (dist <= 1)
                    v = arg3;
                else
                    v = arg3 * 0.5;

                array_push(arg0, [c, r, v]);
            }
        }
    }
}

function get_shield_gem_atk_mult(card_col, card_row, plant_id)
{
    var _mult = 1;

    if (!instance_exists(obj_player_shield))
        return _mult;

    var _s = instance_find(obj_player_shield, 0);
    var _srow = _s.grid_row;
    var _scol = _s.grid_col;

    if (array_get_index(_s.blacklist, plant_id) != -1)
        return _mult;

    if (_s.strength_gem)
    {
        if (card_row >= (_srow - 1) && card_row <= (_srow + 1) &&
            card_col >= (_scol - 1) && card_col <= (_scol + 1))
        {
            _mult *= (_s.atk_ratio + 1);
        }
    }

    if (_s.gods_buff_gem)
    {
        var _in3x3 = card_row >= (_srow - 1) && card_row <= (_srow + 1) &&
                     card_col >= (_scol - 1) && card_col <= (_scol + 1);
        var _in5x5 = card_row >= (_srow - 2) && card_row <= (_srow + 2) &&
                     card_col >= (_scol - 2) && card_col <= (_scol + 2);
        if (_in3x3)
            _mult *= (_s.gods_buff_inner + 1);
        else if (_in5x5)
            _mult *= (_s.gods_buff_outer + 1);
    }

    if (_s.rose_buff_gem)
    {
        if (_s.rose_buff_type == "5x5")
        {
            var _in3x3 = card_row >= (_srow - 1) && card_row <= (_srow + 1) &&
                         card_col >= (_scol - 1) && card_col <= (_scol + 1);
            var _in5x5 = card_row >= (_srow - 2) && card_row <= (_srow + 2) &&
                         card_col >= (_scol - 2) && card_col <= (_scol + 2);
            if (_in3x3)
                _mult *= (_s.rose_buff_inner + 1);
            else if (_in5x5)
                _mult *= (_s.rose_buff_outer + 1);
        }
        else if (_s.rose_buff_type == "5x7")
        {
            if (card_row >= (_srow - 3) && card_row <= (_srow + 3) &&
                card_col >= (_scol - 2) && card_col <= (_scol + 2))
            {
                _mult *= (_s.rose_buff_ratio + 1);
            }
        }
    }

    if (_s.divine_protect_gem)
    {
        var _in3x3 = card_row >= (_srow - 1) && card_row <= (_srow + 1) &&
                     card_col >= (_scol - 1) && card_col <= (_scol + 1);
        var _in5x5 = card_row >= (_srow - 2) && card_row <= (_srow + 2) &&
                     card_col >= (_scol - 2) && card_col <= (_scol + 2);
        if (_in3x3)
            _mult *= (_s.divine_protect_ratio + 1);
        else if (_in5x5)
            _mult *= (_s.divine_protect_ratio * 0.5 + 1);
    }

    return _mult;
}
