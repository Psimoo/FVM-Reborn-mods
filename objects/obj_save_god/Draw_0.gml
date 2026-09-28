event_inherited();

if (shape == 3) {
    var right_col_pos = get_world_position_from_grid(global.grid_cols - 1, grid_row);
    draw_sprite_ext(
        spr_save_god_23_e2,
        image_index,
        right_col_pos.x,
        right_col_pos.y,
        1.8,
        1.8,
        0,
        c_white,
        flash_value > 0 ? flash_value / 200 : 1
    );
}
