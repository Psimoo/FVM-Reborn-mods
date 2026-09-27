/// @func refresh_ocean_buff_cells()
/// @desc 刷新海洋女神的三类增幅范围格子
function refresh_ocean_buff_cells()
{
    ocean_buff_cells_sprayer = [];
    ocean_buff_cells_attach = [];
    ocean_buff_cells_coffee = [];
    
    var val = ocean_buff_value;
    var col = grid_col;
    var row = grid_row;
    
    // 终转全屏模式
    if (ocean_fullscreen)
    {
        // 全屏：所有格子都加入三类增幅
        for (var c = 0; c < global.grid_cols; c++)
        {
            for (var r = 0; r < global.grid_rows; r++)
            {
                array_push(ocean_buff_cells_sprayer, [c, r, val]);
                array_push(ocean_buff_cells_attach, [c, r, val]);
                array_push(ocean_buff_cells_coffee, [c, r, val]);
            }
        }
        return;
    }
    
    // ===== 喷壶类：5x5 范围 =====
    var dx = -2;
    while (dx <= 2)
    {
        var dy = -2;
        while (dy <= 2)
        {
            var cc = col + dx;
            var rr = row + dy;
            if (cc >= 0 && cc < global.grid_cols && rr >= 0 && rr < global.grid_rows)
                array_push(ocean_buff_cells_sprayer, [cc, rr, val]);
            dy++;
        }
        dx++;
    }
    
    // ===== 附加类：5x1 横向范围 =====
    var dx2 = -2;
    while (dx2 <= 2)
    {
        var cc2 = col + dx2;
        var rr2 = row;
        if (cc2 >= 0 && cc2 < global.grid_cols && rr2 >= 0 && rr2 < global.grid_rows)
            array_push(ocean_buff_cells_attach, [cc2, rr2, val]);
        dx2++;
    }
    
    // ===== 咖啡喷壶类：本行范围 =====
    for (var c3 = 0; c3 < global.grid_cols; c3++)
    {
        array_push(ocean_buff_cells_coffee, [c3, row, val]);
    }
}

/// @func rebuild_ocean_buff()
/// @desc 重建所有海洋女神的增幅，重新计算所有受益卡片的 ocean_buff_multiplier
function rebuild_ocean_buff()
{
    if (!variable_global_exists("ocean_god_sources"))
        return;
    
    if (!variable_global_exists("grid_plants"))
        return;
    
    // 重置所有卡片的 ocean_buff_multiplier
    with (obj_card_parent)
    {
        ocean_buff_multiplier = 1;
    }
    
    // 遍历所有海洋女神来源，应用增幅
    var sources = global.ocean_god_sources;
    for (var i = 0; i < ds_list_size(sources); i++)
    {
        var inst = ds_list_find_value(sources, i);
        if (!instance_exists(inst))
            continue;
        
        apply_ocean_buff(inst);
    }
    
    // 标记 dirty 为 false
    global.ocean_buff_dirty = false;
    
    // 触发攻击力更新（递增buff应用ID，使所有卡片重新计算攻击力）
    global.buff_apply_id++;
}

/// @func apply_ocean_buff(arg0)
/// @desc 应用单个海洋女神的增幅到所有受益卡片
/// @param {instance} arg0 海洋女神实例
function apply_ocean_buff(arg0)
{
    // 喷壶类增幅
    apply_ocean_buff_type(arg0, arg0.ocean_buff_cells_sprayer, "sprayer");
    
    // 附加类增幅
    apply_ocean_buff_type(arg0, arg0.ocean_buff_cells_attach, "attach");
    
    // 咖啡喷壶类增幅（按 plant_type == "coffee" 判断）
    apply_ocean_buff_coffee(arg0);
}

/// @func apply_ocean_buff_type(arg0, arg1, arg2)
/// @desc 应用指定类型的增幅
/// @param {instance} arg0 海洋女神实例
/// @param {array} arg1 增幅格子数组
/// @param {string} arg2 buff 类型
function apply_ocean_buff_type(arg0, arg1, arg2)
{
    var cells = arg1;
    var buff_type = arg2;
    
    for (var i = 0; i < array_length(cells); i++)
    {
        var c = cells[i][0];
        var r = cells[i][1];
        var v = cells[i][2];
        
        // 边界检查
        if (c < 0 || c >= global.grid_cols || r < 0 || r >= global.grid_rows)
            continue;
        
        // 获取该格子上的所有卡片（ds_grid -> ds_list）
        var cell_list = ds_grid_get(global.grid_plants, c, r);
        if (cell_list == undefined)
            continue;
        
        for (var j = 0; j < ds_list_size(cell_list); j++)
        {
            var card = ds_list_find_value(cell_list, j);
            if (!instance_exists(card))
                continue;
            
            // 检查卡片是否属于该 buff 类型
            var card_buff_type = mod_get_ocean_buff_type(card.plant_id);
            if (card_buff_type != buff_type && card_buff_type != "both")
                continue;
            
            // 来源计数：加法叠加（叠加方式固定）
            // 总倍率 = 1 + sum(每个来源的倍率 - 1)
            card.ocean_buff_multiplier += (v - 1);
        }
    }
}

/// @func apply_ocean_buff_coffee(arg0)
/// @desc 应用咖啡喷壶类增幅（按 plant_type == "coffee" 判断）
/// @param {instance} arg0 海洋女神实例
function apply_ocean_buff_coffee(arg0)
{
    var cells = arg0.ocean_buff_cells_coffee;
    
    for (var i = 0; i < array_length(cells); i++)
    {
        var c = cells[i][0];
        var r = cells[i][1];
        var v = cells[i][2];
        
        // 边界检查
        if (c < 0 || c >= global.grid_cols || r < 0 || r >= global.grid_rows)
            continue;
        
        // 获取该格子上的所有卡片（ds_grid -> ds_list）
        var cell_list = ds_grid_get(global.grid_plants, c, r);
        if (cell_list == undefined)
            continue;
        
        for (var j = 0; j < ds_list_size(cell_list); j++)
        {
            var card = ds_list_find_value(cell_list, j);
            if (!instance_exists(card))
                continue;
            
            // 检查是否为咖啡喷壶类（plant_type == "coffee"）
            if (card.plant_type != "coffee")
                continue;
            
            // 来源计数：加法叠加
            card.ocean_buff_multiplier += (v - 1);
        }
    }
}

/// @func mod_get_ocean_buff_type(arg0)
/// @desc 获取卡片在海洋女神系统中的 buff 类型
/// @param {string} arg0 卡片 plant_id
/// @return {string} buff 类型（"sprayer"/"attach"/"both"/"none"）
function mod_get_ocean_buff_type(arg0)
{
    var type = mod_get_buff_type(arg0);
    
    // 喷壶类
    if (type == "sprayer")
        return "sprayer";
    
    // 附加类
    if (ds_map_exists(global.plant_buff_map, arg0))
    {
        var t = ds_map_find_value(global.plant_buff_map, arg0);
        if (t == "attach")
            return "attach";
    }
    
    // 第二类型检查
    if (ds_map_exists(global.plant_buff_map_2, arg0))
    {
        var t2 = ds_map_find_value(global.plant_buff_map_2, arg0);
        if (t2 == "attach")
            return "attach";
        if (t2 == "sprayer")
            return "both";
    }
    
    return "none";
}
