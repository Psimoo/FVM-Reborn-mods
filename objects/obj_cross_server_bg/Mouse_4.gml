if (is_submenu_opened) exit;

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
