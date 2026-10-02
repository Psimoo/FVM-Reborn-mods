if (instance_exists(parent_plant))
{
    if (parent_plant.hp > (0.66 * parent_plant.max_hp))
        image_index = 0;
    else if (parent_plant.hp > (0.33 * parent_plant.max_hp))
        image_index = 1;
    else
        image_index = 2;
    
    depth = calculate_plant_depth(parent_plant.grid_col, parent_plant.grid_row, "shield_inner");
}
else
{
    instance_destroy();
}
