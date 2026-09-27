if (global.is_paused)
    exit;

event_inherited();

// 首次刷新增幅范围
if (!ocean_buff_refreshed)
{
    ocean_buff_value = atk / 100;
    refresh_ocean_buff_cells();
    global.ocean_buff_dirty = true;
    ocean_buff_refreshed = true;
    ocean_last_col = grid_col;
    ocean_last_row = grid_row;
    ocean_last_shape = shape;
}
// 位置或形态变化时刷新增幅范围
else if (grid_col != ocean_last_col || grid_row != ocean_last_row || shape != ocean_last_shape)
{
    ocean_buff_value = atk / 100;
    
    // 三转及以上变为悬浮卡
    if (shape >= 2)
        plant_type = "gridless";
    else
        plant_type = "normal";
    
    refresh_ocean_buff_cells();
    global.ocean_buff_dirty = true;
    ocean_last_col = grid_col;
    ocean_last_row = grid_row;
    ocean_last_shape = shape;
}

// 更新特效对象位置
if (instance_exists(haiyang_effect_obj))
{
    haiyang_effect_obj.x = x;
    haiyang_effect_obj.y = y;
}

// 终转：检查是否满足全屏条件（场上>=4张海洋女神）
if (shape >= 3)
{
    var count = ds_list_size(global.ocean_god_sources);
    var should_fullscreen = (count >= 4);
    
    if (should_fullscreen != ocean_fullscreen)
    {
        ocean_fullscreen = should_fullscreen;
        refresh_ocean_buff_cells();
        global.ocean_buff_dirty = true;
    }
}

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;
