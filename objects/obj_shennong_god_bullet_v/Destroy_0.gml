if (ds_exists(hitted_enemy, ds_type_list))
    ds_list_destroy(hitted_enemy);
if (ds_exists(col_hit_count, ds_type_map))
    ds_map_destroy(col_hit_count);
