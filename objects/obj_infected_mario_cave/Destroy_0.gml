var grid_pos = get_grid_position_from_world(x, y);

if (current_grid_type != "")
    global.grid_terrains[grid_pos.row][grid_pos.col].type = current_grid_type;

if (instance_exists(banding_pipeline_obj))
    instance_destroy(banding_pipeline_obj);
