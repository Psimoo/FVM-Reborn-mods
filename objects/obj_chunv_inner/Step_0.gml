if (instance_exists(parent_plant))
{
    // The card shape is assigned after the plant Create event, so resolve the
    // inner sprite here once the parent has its final shape value.
    if (parent_plant.shape == 2)
    {
        sprite_index = spr_melon_virgo_inner_3;
        y = parent_plant.y - 23;
    }
    else if (parent_plant.shape == 1)
    {
        sprite_index = spr_melon_virgo_inner_2;
        y = parent_plant.y - 18;
    }
    else
    {
        sprite_index = spr_melon_virgo_inner_1;
        y = parent_plant.y - 18;
    }

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
