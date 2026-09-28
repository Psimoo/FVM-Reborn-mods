event_inherited();

// 销毁特效对象
if (instance_exists(haiyang_effect_obj))
    instance_destroy(haiyang_effect_obj);

if (variable_instance_exists(id, "ocean_corner_effects"))
{
    for (var i = 0; i < array_length(ocean_corner_effects); i++)
    {
        if (instance_exists(ocean_corner_effects[i]))
            instance_destroy(ocean_corner_effects[i]);
    }
    ocean_corner_effects = [];
}
if (variable_global_exists("ocean_corner_effect_owner") && global.ocean_corner_effect_owner == id)
    global.ocean_corner_effect_owner = noone;

// 从全局海洋女神来源列表移除
if (variable_global_exists("ocean_god_sources"))
{
    var idx = ds_list_find_index(global.ocean_god_sources, id);
    if (idx != -1)
        ds_list_delete(global.ocean_god_sources, idx);
    
    global.ocean_buff_dirty = true;
}
