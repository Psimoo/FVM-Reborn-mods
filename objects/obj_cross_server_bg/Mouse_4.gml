if (is_submenu_opened) exit;

// 打开跨服商店；商店实例会拦截后续点击，避免点击穿透到远征关卡。
var _shop_x = x + 700;
var _shop_y = y - 420;
if (point_in_rectangle(mouse_x, mouse_y, _shop_x - 84, _shop_y - 30, _shop_x + 84, _shop_y + 30)) {
    audio_play_sound(snd_button, 0, 0);
    instance_create_depth(room_width / 2, room_height / 2, depth - 5, obj_cross_server_shop);
    // Hide the underlying hit targets while the shop modal is open.
    with (obj_cross_server_level_create) visible = false;
    is_submenu_opened = true;
    exit;
}

// 点击顶部页签切换远征章节。
for (var _page = 0; _page < 8; _page++) {
    var _tab_x = x - 700 + _page * 200;
    var _tab_y = y - 420;
    if (point_in_rectangle(mouse_x, mouse_y, _tab_x - 76, _tab_y - 26, _tab_x + 76, _tab_y + 26)) {
        if (selected_page != _page) {
            selected_page = _page;
            refresh_level_buttons();
            audio_play_sound(snd_button, 0, 0);
        }
        exit;
    }
}

if (global.debug == 1)
    show_debug_message("鼠标位置： " + string(mouse_x) + "，" + string(mouse_y));
