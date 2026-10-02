event_inherited();
plant_id = "aurora";
event_user(0);
sprite_index = spr_aurora;

if (shape == 1)
    sprite_index = spr_aurora_1;
else if (shape == 2)
    sprite_index = spr_aurora_2;
else if (shape == 3)
    sprite_index = spr_aurora_3;

attack_anim = 0;
idle_anim = 12;
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
buffer_type = "thrower";
buff_value = atk / 100;

if (shape < 3)
{
    buff_shape = "row";
    buff_cells = build_buff_cells(grid_col, grid_row, buff_shape, buff_value);
    buff_cells_refreshed = false;
}
else
{
    buff_cells = [];
    buff_cells_refreshed = true;
}

// Keep the final-form ground effect alive with the card.
// The effect sprite is scaled to cover 3 rows centered on the card and all columns.
aurora_effect_obj = noone;
if (shape >= 3)
{
    var _ex = global.grid_offset_x + global.grid_cols * global.grid_cell_size_x / 2;
    var _ey = y;
    aurora_effect_obj = instance_create_depth(_ex, _ey, 0, obj_aurora_effect);
    aurora_effect_obj.parent_plant = id;
}

ds_list_add(global.buff_sources, id);
global.buff_dirty = true;
