/// @function is_gacha_mode()
/// @desc 当前是否为抽卡版或欧皇版
function is_gacha_mode() {
    return global.play_mode == 1 || global.play_mode == 2;
}

/// @function is_random_gift_mode()
/// @desc 当前是否为随机礼盒玩法
function is_random_gift_mode() {
    return global.play_mode == 3;
}

/// @function random_gift_sync_unlock()
/// @desc 根据当前玩法同步随机礼盒的存档解锁状态。
function random_gift_sync_unlock() {
    if (!variable_global_exists("save_data") || !is_array(global.save_data.unlocked_cards)) return;
    var _lihe_index = -1;
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == "lihe") {
            _lihe_index = i;
            break;
        }
    }
    if (is_random_gift_mode()) {
        if (_lihe_index == -1) {
            array_push(global.save_data.unlocked_cards,
                {id: "lihe", level: 0, shape: 0, skill: 0, max_level: 0, max_shape: 0});
        } else if (global.save_data.unlocked_cards[_lihe_index].level == 0
            && global.save_data.unlocked_cards[_lihe_index].max_level == 16) {
            global.save_data.unlocked_cards[_lihe_index].max_level = 0;
        }
    } else if (_lihe_index != -1) {
        array_delete(global.save_data.unlocked_cards, _lihe_index, 1);
    }
}

/// @function random_gift_is_direct_card_allowed(card_id)
/// @desc 随机礼盒模式下允许玩家直接带入卡组的卡片
function random_gift_is_direct_card_allowed(card_id) {
    if (card_id == "lihe") return true;
    return array_get_index([
        "wooden_plate", "wooden_cork", "cotton_candy", "sausage",
        "oil_lamp", "soda_bubble", "tang_hu_lu", "double_water_pipe", "wanpilong"
    ], card_id) != -1;
}

/// @function random_gift_prepare_selected_deck()
/// @desc 清理随机礼盒模式下不允许直接使用的卡，并确保至少有一张礼盒
function random_gift_prepare_selected_deck() {
    if (!is_random_gift_mode()) return;
    random_gift_sync_unlock();
    // The gift mode grants Wanpilong's third shape at battle start.
    var _wanpilong_unlocked = false;
    for (var _ui = 0; _ui < array_length(global.save_data.unlocked_cards); _ui++) {
        if (global.save_data.unlocked_cards[_ui].id == "wanpilong") {
            global.save_data.unlocked_cards[_ui].shape = 2;
            global.save_data.unlocked_cards[_ui].max_shape = max(global.save_data.unlocked_cards[_ui].max_shape, 2);
            _wanpilong_unlocked = true;
            break;
        }
    }
    if (!_wanpilong_unlocked) array_push(global.save_data.unlocked_cards,
        {id: "wanpilong", level: 0, shape: 2, skill: 0, max_level: 0, max_shape: 2});
    deck_ensure_size();
    var has_gift = false;
    var has_wanpilong = false;
    for (var i = 0; i < ds_list_size(global.selected_deck); i++) {
        if (deck_slot_is_empty(i)) continue;
        var entry = global.selected_deck[| i];
        var card_id = entry[? "card_id"];
        if (!random_gift_is_direct_card_allowed(card_id)) {
            remove_from_deck(i);
        } else if (card_id == "lihe") {
            has_gift = true;
        } else if (card_id == "wanpilong") {
            entry[? "shape"] = 2;
            entry[? "data"] = deck_get_card_data("wanpilong", 2);
            has_wanpilong = true;
        }
    }
    if (!has_gift) add_to_deck("lihe", 0);
    if (!has_wanpilong) add_to_deck("wanpilong", 2);
}

/// @function difficulty_get_reward_multiplier()
/// @desc 难度奖励倍率只由基础难度决定
function difficulty_get_reward_multiplier() {
    switch (global.difficulty) {
        case 4: return 10;
        case 5: return 15;
        default: return 1;
    }
}

/// @function difficulty_get_name()
/// @desc 返回基础难度名称
function difficulty_get_name(_difficulty) {
    var names = ["美味级", "火山级", "浮空级", "星际级", "永恒级", "不朽级"];
    _difficulty = clamp(_difficulty, 0, array_length(names) - 1);
    return names[_difficulty];
}

/// @function difficulty_get_display_name()
/// @desc 返回基础难度和玩法模式组合名称
function difficulty_get_display_name() {
    var result = difficulty_get_name(global.difficulty);
    if (global.play_mode == 1) result += "·抽卡版";
    else if (global.play_mode == 2) result += "·欧皇版";
    else if (global.play_mode == 3) result += "·随机礼盒";
    return result;
}
