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

/// @desc 按目标卡的逻辑坐标计算海洋增幅，不依赖放置顺序或格子列表缓存。
function get_ocean_buff_multiplier(card)
{
    var multiplier = 1;
    if (card.grid_col < 0 || card.grid_col >= global.grid_cols
        || card.grid_row < 0 || card.grid_row >= global.grid_rows)
        return multiplier;

    var buff_type = mod_get_ocean_buff_type(card.plant_id);
    var is_coffee = (card.plant_type == "coffee");
    // row_sprayer（直线喷壶/咖啡喷壶类）也属于喷壶类，需要参与后续判定
    if (buff_type == "none" && !is_coffee)
        return multiplier;

    // 仅统计当前战场上有效的海洋女神，排除跨局残留的来源列表。
    var sources = [];
    with (obj_haiyang_god)
    {
        if (hp > 0 && grid_col >= 0 && grid_col < global.grid_cols
            && grid_row >= 0 && grid_row < global.grid_rows)
            array_push(sources, id);
    }
    var count = array_length(sources);
    var max_buff = 1;
    for (var i = 0; i < count; i++)
    {
        var source = sources[i];
        var dc = abs(card.grid_col - source.grid_col);
        var dr = abs(card.grid_row - source.grid_row);
        var in_range = (source.shape == 3 && count >= 4);
        if (!in_range)
        {
            // 1. 直线喷壶（咖啡喷壶类 / row_sprayer）：本行整行增幅
            if (buff_type == "row_sprayer" && dr == 0)
            {
                in_range = true;
            }
            // 2. 普通喷壶类 + 附加类：5x5 喷壶范围 / 5x1 附加范围
            else
            {
                var _sprayer_ok = (buff_type == "sprayer" || buff_type == "both") && dc <= 2 && dr <= 2;
                var _attach_ok  = (buff_type == "attach"  || buff_type == "both") && dc <= 2 && dr == 0;
                in_range = _sprayer_ok || _attach_ok;
            }

            // 3. 兜底：plant_type 为 "coffee" 的卡片也享受本行增幅
            if (!in_range && is_coffee && dr == 0)
                in_range = true;
        }
        // 多个海洋女神的增幅不叠加，取最高倍率。
        if (in_range && source.ocean_buff_value > max_buff)
            max_buff = source.ocean_buff_value;
    }
    return max_buff;
}

/// @desc 重建海洋增幅，并触发攻击力更新。
function rebuild_ocean_buff()
{
    with (obj_card_parent)
        ocean_buff_multiplier = get_ocean_buff_multiplier(id);
    global.ocean_buff_dirty = false;
    global.buff_apply_id++;
}

/// @func mod_get_ocean_buff_type(arg0)
/// @desc 获取卡片在海洋女神系统中的 buff 类型
/// @param {string} arg0 卡片 plant_id
/// @return {string} buff 类型（"row_sprayer"/"sprayer"/"attach"/"both"/"none"）
function mod_get_ocean_buff_type(arg0)
{
    // 护法神同时属于附加类和喷壶类，单独处理以避免附加类提前返回。
    if (arg0 == "hufa_god")
        return "both";

    var type = mod_get_buff_type(arg0);

    // 喷壶类
    if (type == "sprayer")
    {
        // 直线喷壶（咖啡喷壶类）：单独分类，享受本行整行增幅
        if (is_row_sprayer_card(arg0))
            return "row_sprayer";
        return "sprayer";
    }

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
