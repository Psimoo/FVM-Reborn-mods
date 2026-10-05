if hp < max_hp && !invincible{
	obj_task_manager.card_loss ++
}

var _was_shoveled = variable_instance_exists(id, "is_shoveled") && is_shoveled;
var _no_revive_record = variable_instance_exists(id, "no_revive_record") && no_revive_record;

var should_record = false;

if (variable_instance_exists(id, "plant_id") && !_was_shoveled && !_no_revive_record)
{
    if (hp <= 0)
        should_record = true;
    else if (variable_global_exists("game_over") && !global.game_over && instance_exists(obj_battle))
        should_record = true;

    if (should_record)
    {
        var _no_record_ids = [
            "baibianshe", "anranxiaohunfan", "chongsheng_god",

            "coke_bomb", "ice_bucket_bomb", "kettle_bomb", "wine_bottle_bomb", "whisky_bomb", "skewer_bomb",
            "chili_powder", "rabbit_lantern", "delicacy_firework", "bull_firework", "aquarius_elve", "mouse_clip",
            "flour_sack", "steel_wool", "baiyang", "save_god", "hundun_god", "qingse_shishi", "panduola_god",
            "dandantu", "shuiping",

            "12yinliao", "coffee_grounds", "ice_cream", "magic_chicken", "clotho", "time_god", "heian_god",
            "zhiyumiao", "shegengbao", "wooden_cork", "baobaoji", "ventilation_fan", "xuanfengniu", "nizhuanniu",
            "wanpilong", "brahma", "mojie", "cotton_candy", "zhanqima", "dragon_fruit", "durian",
            "firework_dragon", "firework_dragon_real"
        ];

        if (array_get_index(_no_record_ids, plant_id) != -1)
            should_record = false;
    }
}

if (should_record)
{
    if (!variable_global_exists("dead_cards") || !ds_exists(global.dead_cards, ds_type_list))
    {
        global.dead_cards = ds_list_create();
    }

    var _death_cause = "mouse";
    if (hp > 0)
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
