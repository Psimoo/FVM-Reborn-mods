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

        // 全屏增幅时在房间四角显示统一的全屏特效。
        if (ocean_fullscreen && (!variable_global_exists("ocean_corner_effect_owner") || !instance_exists(global.ocean_corner_effect_owner)))
        {
            global.ocean_corner_effect_owner = id;
            var fx_scale = 1.8;
            var right_x = room_width - (sprite_get_width(spr_haiyang_god_effect_4) - sprite_get_xoffset(spr_haiyang_god_effect_4)) * fx_scale;
            var top_y = sprite_get_yoffset(spr_haiyang_god_effect_4) * fx_scale;
            var corner_x = [room_width - right_x, right_x, room_width - right_x, right_x];
            var corner_y = [top_y, top_y, room_height - top_y, room_height - top_y];
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
