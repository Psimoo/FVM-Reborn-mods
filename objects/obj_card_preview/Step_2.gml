// 用 Step_0 算好的逻辑位置检测能否放置，和放置逻辑一致
var card_data = noone
var _info = get_card_info_simple(card_id)
if _info != false{
    var card_shape = _info.shape
    card_data = deck_get_card_data(card_id,card_shape)
}
if card_id == "magic_chicken"{
    if global.last_placed_card_id != ""{
        var _info2 = get_card_info_simple(global.last_placed_card_id)
        if _info2 != false{
            card_data = deck_get_card_data(global.last_placed_card_id,_info2.shape)
        }
    }
}
if card_data != noone{
    is_valid = (can_place_at_position(logical_base_x, logical_base_y, card_data[? "plant_type"],card_data[? "feature_type"],card_data[? "target_card"],card_id));
}
else{
    is_valid = false
}
