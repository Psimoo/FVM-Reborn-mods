function mod_get_buff_type(arg0)
{
    if (ds_map_exists(global.plant_buff_map, arg0))
        return ds_map_find_value(global.plant_buff_map, arg0);
    
    return "normal";
}

function is_row_sprayer_card(plant_id)
{
    return plant_id == "coffee_pot" || plant_id == "oden_pot"
        || plant_id == "sheng_huo" || plant_id == "beef_hotpot"
        || plant_id == "spicy_pot";
}
