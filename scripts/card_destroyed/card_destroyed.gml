/// @function plant_destroyed(plant_inst)
/// @description 当植物销毁时调用，更新网格数据
/// @param {instance} plant_inst 植物实例
function card_destroyed(plant_inst) {
    var col = plant_inst.grid_col;
    var row = plant_inst.grid_row;
    
    // 先尝试从记录的格子中移除
    if (col >= 0 && col < global.grid_cols && row >= 0 && row < global.grid_rows) {
        var plant_list = ds_grid_get(global.grid_plants, col, row);
        var index = ds_list_find_index(plant_list, plant_inst);
        if (index != -1) {
            ds_list_delete(plant_list, index);
            if (variable_global_exists("ocean_buff_dirty"))
                global.ocean_buff_dirty = true;
            return;
        }
    }
    
    // 如果在记录的格子中没找到，遍历所有格子查找（防止grid_col/grid_row偏移导致的残留）
    for (var c = 0; c < global.grid_cols; c++) {
        for (var r = 0; r < global.grid_rows; r++) {
            var list = ds_grid_get(global.grid_plants, c, r);
            var idx = ds_list_find_index(list, plant_inst);
            if (idx != -1) {
                ds_list_delete(list, idx);
                if (variable_global_exists("ocean_buff_dirty"))
                    global.ocean_buff_dirty = true;
                return;
            }
        }
    }
}
