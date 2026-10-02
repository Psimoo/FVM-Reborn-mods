// Close button at bottom-right.
if (is_closing) exit;

if (point_in_rectangle(mouse_x, mouse_y, x + 680, y + 430, x + 800, y + 550)) {
    audio_play_sound(snd_button, 0, 0);
    // Defer teardown until this mouse event has finished dispatching. This
    // prevents the same click from reaching the underlying expedition button.
    is_closing = true;
    visible = false;
    alarm[0] = 1;
    exit;
}

// Silver tab on the left, gold tab on the right.
if (point_in_rectangle(mouse_x, mouse_y, x - 835, y - 470, x - 645, y - 405)) {
    if (shop_type != 1) { shop_type = 1; current_page = 1; total_pages = max(1, ceil(array_length(silver_cards) / 16)); audio_play_sound(snd_button, 0, 0); }
    exit;
}
if (point_in_rectangle(mouse_x, mouse_y, x - 640, y - 470, x - 450, y - 405)) {
    if (shop_type != 0) { shop_type = 0; current_page = 1; total_pages = max(1, ceil(array_length(exchange_cards) / 16)); audio_play_sound(snd_button, 0, 0); }
    exit;
}

// 扩大翻页按钮点击区域，匹配按钮精灵的实际显示大小（缩放1.8倍后约100x100）
if (point_in_rectangle(mouse_x, mouse_y, x - 160, y + 385, x - 40, y + 485)) {
    current_page = max(1, current_page - 1);
    audio_play_sound(snd_button, 0, 0);
    exit;
}
if (point_in_rectangle(mouse_x, mouse_y, x + 40, y + 385, x + 160, y + 485)) {
    current_page = min(total_pages, current_page + 1);
    audio_play_sound(snd_button, 0, 0);
    exit;
}

    var _cards = shop_type == 0 ? exchange_cards : silver_cards;
for (var _slot = 0; _slot < 16; _slot++) {
    var _index = (current_page - 1) * 16 + _slot;
    if (_index >= array_length(_cards)) continue;
    var _col = _slot mod 4;
    var _row = _slot div 4;
    var _gx = x - 618 + 411 * _col;
    var _gy = y - 248 + 165 * _row;
    if (!point_in_rectangle(mouse_x, mouse_y, _gx - 5, _gy + 35, _gx + 175, _gy + 92)) continue;

    var _id = _cards[_index];
    var _goods = global.goods_map[? _id];
    var _medals = ceil(real(_goods.cost) / 1000);
    var _goods_type = _goods.type;
    var _owned = false;

    // 抽卡模式/欧皇模式/随机礼盒模式：禁止购买跨服商店商品
    if (is_eternal_gacha_mode() || is_random_gift_mode()) {
        if (is_random_gift_mode()) {
            show_notice("随机礼盒模式无法使用跨服商店", 60);
        } else {
            show_notice("抽卡模式无法使用跨服商店", 60);
        }
        exit;
    }

    // 判断是否已拥有
    if (_goods_type == "card") {
        for (var _k = 0; _k < array_length(global.save_data.unlocked_cards); _k++) {
            if (global.save_data.unlocked_cards[_k].id == _id) { _owned = true; break; }
        }
    } else if (_goods_type == "weapon") {
        _owned = is_weapon_unlocked(_id);
    } else if (_goods_type == "gem") {
        _owned = is_gem_unlocked(_id);
    }

    var _balance = shop_type == 0 ? global.save_data.cross_server_gold_medal : global.save_data.cross_server_silver_medal;
    if (_owned) show_notice("该商品已兑换", 60);
    else if (_balance < _medals && !global.debug) show_notice(shop_type == 0 ? "金色勋章不足" : "白银勋章不足", 60);
    else {
        if (shop_type == 0) global.save_data.cross_server_gold_medal -= _medals;
        else global.save_data.cross_server_silver_medal -= _medals;

        if (_goods_type == "card") {
            unlock_card(_id, 0, 0, global.save_data.unlocked_items.max_skill_level);
        } else if (_goods_type == "weapon") {
            unlock_weapon(_id);
        } else if (_goods_type == "gem") {
            unlock_gem(_id);
        }

        save_file(global.save_slot);
        audio_play_sound(snd_button, 0, 0);
    }
    exit;
}
