if (global.is_paused)
    exit;

event_inherited();

// 海洋女神悬浮在其他卡片上层，避免被同格或相邻卡片遮挡。
depth = calculate_plant_depth(grid_col, grid_row, plant_type) - 400;

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
{
    var count = 0;
    with (obj_haiyang_god)
    {
        if (hp > 0 && grid_col >= 0 && grid_col < global.grid_cols
            && grid_row >= 0 && grid_row < global.grid_rows)
            count++;
    }
    var should_fullscreen = (shape == 3 && hp > 0 && count >= 4);
    
    if (should_fullscreen != ocean_fullscreen
        || (should_fullscreen && (!variable_global_exists("ocean_corner_effect_owner")
            || !instance_exists(global.ocean_corner_effect_owner))))
    {
        ocean_fullscreen = should_fullscreen;

        // 全屏增幅时将特效定位在地图网格四角，避免覆盖两侧卡牌栏和顶部界面。
        if (ocean_fullscreen && (!variable_global_exists("ocean_corner_effect_owner") || !instance_exists(global.ocean_corner_effect_owner)))
        {
            global.ocean_corner_effect_owner = id;
            var fx_scale = 1.8;
            var fx_width = sprite_get_width(spr_haiyang_god_effect_4);
            var fx_xoffset = sprite_get_xoffset(spr_haiyang_god_effect_4);
            var fx_yoffset = sprite_get_yoffset(spr_haiyang_god_effect_4);
            var grid_left = global.grid_offset_x;
            var grid_top = global.grid_offset_y;
            var grid_right = grid_left + global.grid_cols * global.grid_cell_size_x;
            var grid_bottom = grid_top + global.grid_rows * global.grid_cell_size_y;
            var grid_effect_offset_y = -20;
            var corner_x = [
                grid_left + (fx_width - fx_xoffset) * fx_scale,
                grid_right - (fx_width - fx_xoffset) * fx_scale,
                grid_left + (fx_width - fx_xoffset) * fx_scale,
                grid_right - (fx_width - fx_xoffset) * fx_scale
            ];
            var corner_y = [
                grid_top + fx_yoffset * fx_scale + grid_effect_offset_y,
                grid_top + fx_yoffset * fx_scale + grid_effect_offset_y,
                grid_bottom - fx_yoffset * fx_scale + grid_effect_offset_y,
                grid_bottom - fx_yoffset * fx_scale + grid_effect_offset_y
            ];
            var scale_x = [-fx_scale, fx_scale, -fx_scale, fx_scale];
            var scale_y = [fx_scale, fx_scale, -fx_scale, -fx_scale];
            for (var i = 0; i < 4; i++)
            {
                var corner_fx = instance_create_depth(corner_x[i], corner_y[i], -3000, obj_haiyang_god_effect);
                corner_fx.sprite_index = spr_haiyang_god_effect_4;
                corner_fx.image_xscale = scale_x[i];
                corner_fx.image_yscale = scale_y[i];
                corner_fx.image_index = 0;
                array_push(ocean_corner_effects, corner_fx);
            }
        }
        else
        {
            for (var i = 0; i < array_length(ocean_corner_effects); i++)
            {
                if (instance_exists(ocean_corner_effects[i]))
                    instance_destroy(ocean_corner_effects[i]);
            }
            ocean_corner_effects = [];
            if (global.ocean_corner_effect_owner == id)
                global.ocean_corner_effect_owner = noone;
        }

        refresh_ocean_buff_cells();
        global.ocean_buff_dirty = true;
    }
}

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;
