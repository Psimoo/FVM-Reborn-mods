/// @function load_custom_deck(deck_data)
/// @desc 加载自定义卡组（未来从存档/菜单读取）
/// @param {real} deck_index 卡组ID
function load_custom_deck(deck_index) {
    // 清空当前卡组并按槽位重建
    ds_list_clear(global.selected_deck);
    deck_ensure_size();

    // 添加新卡牌（保留存档槽位；旧紧凑档顺次填前 N 槽自动兼容）
    var card_ids = global.save_data.saved_decks[deck_index].card_id;
    var len = array_length(card_ids);
    for(var i = 0; i < len; i++) {
        var cid = card_ids[i];
        if (cid == "" || is_undefined(cid) || cid == noone) continue; // 跳过空槽
        if (cid == "lihe" && !is_random_gift_mode()) continue;
        var info = get_card_info(cid);
        if (info != false) {
            add_to_deck(cid, info.shape, i);
        }
    }

    // 重新创建卡槽（需在战斗房间调用）
    if (instance_exists(obj_battle)) {
        // 先删除旧卡槽
        with (obj_card_slot) instance_destroy();
        // 创建新卡槽
        create_battle_slots();
    }
}

function save_to_custom_deck(deck_index,deck_name){
	var _max = deck_slot_max()
	var card_arr = array_create(_max, "")
	for(var i = 0; i < _max;i++){
		if (!deck_slot_is_empty(i)){
			card_arr[i] = global.selected_deck[| i][? "card_id"]
		}
	}
	global.save_data.saved_decks[deck_index].card_id = card_arr
	save_file(global.save_slot)
}
