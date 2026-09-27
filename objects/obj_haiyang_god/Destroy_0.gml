event_inherited();

// 销毁特效对象
if (instance_exists(haiyang_effect_obj))
    instance_destroy(haiyang_effect_obj);

// 从全局海洋女神来源列表移除
if (variable_global_exists("ocean_god_sources"))
{
    var idx = ds_list_find_index(global.ocean_god_sources, id);
    if (idx != -1)
        ds_list_delete(global.ocean_god_sources, idx);
    
    global.ocean_buff_dirty = true;
}
