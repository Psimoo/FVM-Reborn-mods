if hp < max_hp && !invincible{
	obj_task_manager.card_loss ++
}

var _was_shoveled = variable_instance_exists(id, "is_shoveled") && is_shoveled;
var _no_revive_record = variable_instance_exists(id, "no_revive_record") && no_revive_record;

var should_record = hp <= 0;
if (_was_shoveled)
    should_record = true;
else if (!should_record && !_no_revive_record
    && !is_undefined(other) && instance_exists(other) && other.id != id
    && variable_global_exists("game_over") && !global.game_over
    && instance_exists(obj_battle))
    should_record = true;

if (should_record && variable_instance_exists(id, "plant_id") && plant_id != "baibianshe" && plant_id != "anranxiaohunfan")
{
    if (!variable_global_exists("dead_cards") || !ds_exists(global.dead_cards, ds_type_list))
    {
        global.dead_cards = ds_list_create();
    }

    var _death_cause = "mouse";
    if (_was_shoveled)
        _death_cause = "shovel";
    else if (hp > 0)
        _death_cause = "destroyed";

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
