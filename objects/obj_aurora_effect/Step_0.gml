// Force the effect to expand upward by 1 extra row while keeping the bottom edge in place.
// 4 rows tall total (card row + 1 below + 2 above), bottom stays at card y position.
if (variable_global_exists("grid_cols") && variable_global_exists("grid_cell_size_x")
    && variable_global_exists("grid_cell_size_y") && variable_global_exists("grid_offset_x"))
{
    var _spr_w = sprite_get_width(sprite_index);
    var _spr_h = sprite_get_height(sprite_index);

    // Width: full grid + 1 extra cell on left + 1 extra cell on right
    var _total_w = (global.grid_cols + 2) * global.grid_cell_size_x;
    image_xscale = _total_w / _spr_w;

    // Height: 4 rows (expanded upward by 1 from the original 3)
    var _total_h = global.grid_cell_size_y * 4;
    image_yscale = _total_h / _spr_h;

    // Horizontal position: center of the grid
    x = global.grid_offset_x + global.grid_cols * global.grid_cell_size_x / 2;

    // Vertical: bottom edge stays at the parent plant's row; expand upward.
    // Sprite origin is at center, so shift center up by half a row.
    if (instance_exists(parent_plant))
        y = parent_plant.y - global.grid_cell_size_y * 0.5;
}
