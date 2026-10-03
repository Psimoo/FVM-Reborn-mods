if (shape < 2 && instance_exists(zhanqima_effect_obj)) instance_destroy(zhanqima_effect_obj);

// 二转四角特效清理（对齐海洋女神模式）
if (shape >= 2 && variable_instance_exists(id, "zhanqima_corner_effects"))
{
    // 如果当前是四角特效的所有者，先销毁自己管理的特效
    if (variable_global_exists("zhanqima_corner_effect_owner") && global.zhanqima_corner_effect_owner == id)
    {
        for (var i = 0; i < array_length(zhanqima_corner_effects); i++)
            if (instance_exists(zhanqima_corner_effects[i]))
                instance_destroy(zhanqima_corner_effects[i]);
        global.zhanqima_corner_effect_owner = noone;

        // 移交所有权：如果场上还有其他二转战旗马，让下一个接管四角特效
        var next_owner = noone;
        with (obj_zhanqima)
        {
            if (id != other.id && hp > 0 && shape >= 2
                && grid_col >= 0 && grid_col < global.grid_cols
                && grid_row >= 0 && grid_row < global.grid_rows)
            {
                next_owner = id;
            }
        }
        if (next_owner != noone)
            next_owner.zhanqima_fullscreen = false; // 触发 Step 中重新创建
    }
    else
    {
        // 非所有者只清理自己数组里的引用（不销毁实际特效）
        zhanqima_corner_effects = [];
    }
}

if (variable_global_exists("zhanqima_sources") && ds_exists(global.zhanqima_sources, ds_type_list))
{
    var idx = ds_list_find_index(global.zhanqima_sources, id);
    if (idx >= 0) ds_list_delete(global.zhanqima_sources, idx);
}
if (variable_global_exists("buff_apply_id")) global.buff_apply_id++;
event_inherited();
