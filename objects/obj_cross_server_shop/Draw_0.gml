// Match the shop's outer UI colour before drawing the custom SWF background.
draw_set_color(make_color_rgb(37, 105, 170));
draw_rectangle(0, 0, room_width, room_height, true);
draw_sprite_ext(spr_mod_cs_shop_bg, 0, x, y, 1.8, 1.8, 0, c_white, 1);

// Clear the SWF's unused medal slots and floating panels.
draw_set_color(make_color_rgb(37, 105, 170));
draw_rectangle(x + 205, y - 470, x + 805, y - 405, true);
draw_set_color(make_color_rgb(0, 44, 81));
draw_rectangle(x + 190, y - 395, x + 850, y - 255, true);

// Silver tab on the left, gold tab on the right.
draw_sprite_ext(spr_mod_cs_shop_silver_tab, shop_type == 1 ? 0 : 1, x - 740, y - 438, 1.8, 1.8, 0, c_white, 1);
draw_sprite_ext(spr_mod_cs_shop_gold_tab, shop_type == 0 ? 0 : 1, x - 545, y - 438, 1.8, 1.8, 0, c_white, 1);

draw_set_font(font_number);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_sprite_ext(spr_mod_cs_xunzhang, 0, x + 370, y - 438, 1.0, 1.0, 0, c_white, 1);
draw_text(x + 405, y - 438, string(get_material_amount("cross_server_gold_medal")));
draw_sprite_ext(spr_mod_cs_silver_medal, 0, x + 570, y - 438, 1.0, 1.0, 0, c_white, 1);
draw_text(x + 605, y - 438, string(get_material_amount("cross_server_silver_medal")));

var _cards = shop_type == 0 ? exchange_cards : silver_cards;
var _medal_sprite = shop_type == 0 ? spr_mod_cs_xunzhang : spr_mod_cs_silver_medal;
// Match the gods shop exactly: four columns, four rows, sixteen products per page.
for (var _slot = 0; _slot < 16; _slot++) {
    var _index = (current_page - 1) * 16 + _slot;
    var _col = _slot mod 4;
    var _row = _slot div 4;
    var _gx = x - 618 + 411 * _col;
    var _gy = y - 248 + 165 * _row;
    draw_sprite_ext(spr_shop_goods_bg, 0, _gx, _gy, 1.8, 1.8, 0, c_white, 1);
    if (_index >= array_length(_cards)) continue;

    var _id = _cards[_index];
    var _goods = global.goods_map[? _id];
    var _card_id = variable_struct_exists(_goods, "card_id") ? _goods.card_id : _id;
    var _card_shape = variable_struct_exists(_goods, "card_shape") ? _goods.card_shape : 0;
    var _medals = real(_goods.cost);
    var _owned = false;
    var _goods_type = _goods.type;

    // 判断是否已拥有
    if (_goods_type == "card") {
        for (var _k = 0; _k < array_length(global.save_data.unlocked_cards); _k++) {
            if (global.save_data.unlocked_cards[_k].id == _card_id && global.save_data.unlocked_cards[_k].shape >= _card_shape) { _owned = true; break; }
        }
    } else if (_goods_type == "weapon") {
        _owned = is_weapon_unlocked(_id);
    } else if (_goods_type == "gem") {
        _owned = is_gem_unlocked(_id);
    }

    // 绘制商品图标
    if (_goods_type == "card") {
        var _card = deck_get_card_data(_card_id, _card_shape);
        if (_card != noone && ds_exists(_card, ds_type_map)) {
            draw_sprite_ext(spr_slot, 0, _gx - 122, _gy, 0.33, 0.33, 0, c_white, 1);
            draw_sprite_ext(_card[? "sprite"], 0, _gx - 122, _gy + 25, 1, 1, 0, c_white, 1);
        }
    } else if (_goods_type == "weapon") {
        var _weapon_info = get_weapon_info(_id);
        if (_weapon_info != noone) {
            draw_sprite_ext(_weapon_info.icon, 0, _gx - 122, _gy - 20 + 25, 1.5, 1.5, 0, c_white, 1);
        }
    } else if (_goods_type == "gem") {
        var _gem_info = get_gem_info(_id);
        if (_gem_info != noone) {
            draw_sprite_ext(_gem_info.icon, 0, _gx - 122, _gy - 20 + 25, 0.9, 0.9, 0, c_white, 1);
        }
    }

    // 抽卡模式/欧皇模式/随机礼盒模式：购买按钮变灰
    var _gacha_disabled = is_eternal_gacha_mode() || is_random_gift_mode();

    draw_sprite_ext(spr_shop_buy_btn, 0, _gx + 77, _gy + 60, 1.8, 1.8, 0, _gacha_disabled ? c_gray : c_white, 1);
    draw_set_font(font_yuan);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(_gx + 77, _gy - 46, _goods.display_name);
    draw_set_font(font_number);
    draw_set_color(c_yellow);
    draw_text(_gx + 69, _gy + 2, string(_medals));
    draw_sprite_ext(_medal_sprite, 0, _gx + 167, _gy + 1, 0.8, 0.8, 0, c_white, 1);
    if (_owned) {
        draw_set_alpha(0.55);
        draw_set_color(c_black);
        draw_rectangle(_gx - 205, _gy - 82, _gx + 205, _gy + 82, false);
        draw_set_alpha(1);
        draw_set_font(font_yuan);
        draw_set_color(c_white);
        draw_text(_gx + 77, _gy + 60, "已兑换");
    } else if (_gacha_disabled) {
        draw_set_font(font_yuan);
        draw_set_color(c_white);
        draw_text(_gx + 77, _gy + 60, "不可购买");
    }
}

// Centered pagination controls.
draw_sprite_ext(spr_shop_page_btn, 0, x - 100, y + 435, 1.8, 1.8, 0, c_white, 1);
draw_sprite_ext(spr_shop_page_btn, 0, x + 100, y + 435, -1.8, 1.8, 0, c_white, 1);
draw_set_font(font_number);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y + 435, string(current_page) + "/" + string(total_pages));

// Close button at bottom-right.
draw_sprite_ext(spr_closemenu_btn, 0, x + 740, y + 490, 1.8, 1.8, 0, c_white, 1);
