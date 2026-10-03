if (global.is_paused) exit;
event_inherited();

depth = calculate_plant_depth(grid_col, grid_row, plant_type) - 400;
if (zhanqima_buff_value != atk / 100)
{
    zhanqima_buff_value = atk / 100;
    if (variable_global_exists("buff_apply_id")) global.buff_apply_id++;
}
if (shape < 2 && instance_exists(zhanqima_effect_obj))
{
    zhanqima_effect_obj.x = x;
    zhanqima_effect_obj.y = y;
}

// 二转：全屏四角特效（对齐海洋女神模式）
// 全局只有一个"所有者"负责管理四角特效，避免重复创建
if (shape >= 2)
{
    var should_fullscreen = (hp > 0);

    if (should_fullscreen != zhanqima_fullscreen
        || (should_fullscreen && (!variable_global_exists("zhanqima_corner_effect_owner")
            || !instance_exists(global.zhanqima_corner_effect_owner))))
    {
        zhanqima_fullscreen = should_fullscreen;

        // 激活全屏时，将四角特效定位在地图网格四角
        if (zhanqima_fullscreen && (!variable_global_exists("zhanqima_corner_effect_owner") || !instance_exists(global.zhanqima_corner_effect_owner)))
        {
            global.zhanqima_corner_effect_owner = id;
            var fx_scale = 1.8;
            var fx_width = sprite_get_width(spr_zhanqima_effect_3);
            var fx_height = sprite_get_height(spr_zhanqima_effect_3);
            var fx_xoffset = sprite_get_xoffset(spr_zhanqima_effect_3);
            var fx_yoffset = sprite_get_yoffset(spr_zhanqima_effect_3);
            var grid_left = global.grid_offset_x;
            var grid_top = global.grid_offset_y;
            var grid_right = grid_left + global.grid_cols * global.grid_cell_size_x;
            var grid_bottom = grid_top + global.grid_rows * global.grid_cell_size_y;
            var grid_effect_offset_y = -20;
            var expand_x = global.grid_cell_size_x;  // 往外扩大一格
            var expand_y = global.grid_cell_size_y;
            // spr_zhanqima_effect_3 原图是左下角方向，通过翻转得到四个角：
            // 索引0=左上(垂直翻转)  索引1=右上(水平+垂直翻转)
            // 索引2=左下(正常)      索引3=右下(水平翻转)
            var corner_x = [
                grid_left + fx_xoffset * fx_scale - expand_x,
                grid_right - fx_xoffset * fx_scale + expand_x,
                grid_left + fx_xoffset * fx_scale - expand_x,
                grid_right - fx_xoffset * fx_scale + expand_x
            ];
            var corner_y = [
                grid_top + (fx_height - fx_yoffset) * fx_scale + grid_effect_offset_y - expand_y,
                grid_top + (fx_height - fx_yoffset) * fx_scale + grid_effect_offset_y - expand_y,
                grid_bottom - (fx_height - fx_yoffset) * fx_scale + grid_effect_offset_y + expand_y,
                grid_bottom - (fx_height - fx_yoffset) * fx_scale + grid_effect_offset_y + expand_y
            ];
            var scale_x = [fx_scale, -fx_scale, fx_scale, -fx_scale];
            var scale_y = [-fx_scale, -fx_scale, fx_scale, fx_scale];
            for (var i = 0; i < 4; i++)
            {
                var corner_fx = instance_create_depth(corner_x[i], corner_y[i], -3000, obj_zhanqima_effect);
                corner_fx.sprite_index = spr_zhanqima_effect_3;
                corner_fx.image_xscale = scale_x[i];
                corner_fx.image_yscale = scale_y[i];
                corner_fx.image_index = 0;
                array_push(zhanqima_corner_effects, corner_fx);
            }
        }
        else
        {
            // 关闭全屏时销毁四角特效
            for (var i = 0; i < array_length(zhanqima_corner_effects); i++)
            {
                if (instance_exists(zhanqima_corner_effects[i]))
                    instance_destroy(zhanqima_corner_effects[i]);
            }
            zhanqima_corner_effects = [];
            if (global.zhanqima_corner_effect_owner == id)
                global.zhanqima_corner_effect_owner = noone;
        }

        if (variable_global_exists("buff_apply_id")) global.buff_apply_id++;
    }
}
