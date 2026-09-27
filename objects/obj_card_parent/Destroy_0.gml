// 从网格数据中移除
if hp < max_hp && !invincible{
	obj_task_manager.card_loss ++
}

// 记录死亡卡片（用于复活类技能）
var should_record = hp <= 0;
if (variable_instance_exists(id, "is_shoveled") && is_shoveled)
    should_record = true;

if (should_record && variable_instance_exists(id, "plant_id") && plant_id != "baibianshe" && plant_id != "anranxiaohunfan")
{
    if (!variable_global_exists("dead_cards"))
    {
        global.dead_cards = ds_list_create();
    }

    var _death_cause = "mouse";
    if (variable_instance_exists(id, "is_shoveled") && is_shoveled)
        _death_cause = "shovel";

    var dead_data = ds_map_create();
    ds_map_add(dead_data, "plant_id", plant_id);
    ds_map_add(dead_data, "shape", shape);
    ds_map_add(dead_data, "level", current_level);
    ds_map_add(dead_data, "skill", skill);
    ds_map_add(dead_data, "grid_col", grid_col);
    ds_map_add(dead_data, "grid_row", grid_row);
    ds_map_add(dead_data, "death_cause", _death_cause);
    ds_list_add(global.dead_cards, dead_data);
}

card_destroyed(id);