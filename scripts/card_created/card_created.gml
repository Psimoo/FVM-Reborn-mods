/// @function plant_created(plant_inst, col, row)
/// @description 当植物创建时调用，更新网格数据
/// @param {instance} plant_inst 植物实例
/// @param {real} col 网格列
/// @param {real} row 网格行
function card_created(plant_inst, col, row) {
    // 获取该网格的植物列表
    var plant_list = ds_grid_get(global.grid_plants, col, row);
    
    // 添加新植物到列表
    ds_list_add(plant_list, plant_inst);
    
    // 设置植物的网格位置
    plant_inst.grid_col = col;
    plant_inst.grid_row = row;
    
    // 更新植物的深度偏移（根据层级）
    plant_inst.depth_offset = ds_list_size(plant_list) * 5;
    
    // 更新所有植物的深度偏移
	sort_plants_in_grid(col, row)

    // 新卡放置后需要重新计算海洋女神增幅，
    // 否则只会在海洋女神自身变化时重建，导致放置顺序影响增幅。
    if (variable_global_exists("ocean_buff_dirty"))
        global.ocean_buff_dirty = true;
}
