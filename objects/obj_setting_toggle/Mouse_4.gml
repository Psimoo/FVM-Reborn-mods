// 切换状态
state = !state;
audio_play_sound(snd_button,0,0)

// 抽卡版和欧皇版互斥，并统一保存为 play_mode。
if (config_key == "play_mode_gacha" && state) {
    with (obj_setting_toggle) {
        if (config_key == "play_mode_lucky" || config_key == "play_mode_gift") state = false;
    }
}
if (config_key == "play_mode_lucky" && state) {
    with (obj_setting_toggle) {
        if (config_key == "play_mode_gacha" || config_key == "play_mode_gift") state = false;
    }
}
if (config_key == "play_mode_gift" && state) {
    with (obj_setting_toggle) {
        if (config_key == "play_mode_gacha" || config_key == "play_mode_lucky") state = false;
    }
}
// 保存到配置文件
if (config_key != "") {
    ini_open("config.ini");
    if (config_key == "play_mode_gacha" || config_key == "play_mode_lucky" || config_key == "play_mode_gift") {
        ini_write_real("settings", "play_mode", state ? (config_key == "play_mode_gacha" ? 1 : (config_key == "play_mode_lucky" ? 2 : 3)) : 0);
    } else {
        ini_write_real("settings", config_key, state);
    }
    ini_close();
}

// 应用设置（如果需要立即生效）
if (config_key == "screen_shake") {
    global.screen_shake = state;
} else if (config_key == "screen_flash") {
    global.screen_flash = state;
}
else if (config_key == "fullscreen") {
    global.fullscreen = state;
	window_set_fullscreen(global.fullscreen)
}
else if (config_key == "replace_placement"){
	global.replace_placement = state
}
else if (config_key == "quick_placement"){
	global.quick_placement = state
}
else if (config_key == "card_hpbar"){
	global.card_hpbar = state
}
else if (config_key == "enemy_hpbar"){
	global.enemy_hpbar = state
}
else if (config_key == "tex_fliter"){
	global.tex_fliter = state
	gpu_set_tex_filter(global.tex_fliter)
}
else if (config_key == "difficulty"){
	global.difficulty = state
}
else if (config_key == "play_mode_gacha"){
    global.play_mode = state ? 1 : 0;
}
else if (config_key == "play_mode_lucky"){
    global.play_mode = state ? 2 : 0;
}
else if (config_key == "play_mode_gift"){
    global.play_mode = state ? 3 : 0;
}
if (config_key == "play_mode_gift" || config_key == "play_mode_gacha" || config_key == "play_mode_lucky") {
    random_gift_sync_unlock();
    // 切换玩法模式后同步整理卡组（确保礼盒卡的增减立即生效）
    if (variable_global_exists("selected_deck") && ds_exists(global.selected_deck, ds_type_list)) {
        random_gift_prepare_selected_deck();
    }
}
else if (config_key == "borderless_window"){
	global.borderless_window = state
	window_enable_borderless_fullscreen(global.borderless_window)
}
else if (config_key == "lose_focus_pause"){
	global.lose_focus_pause = state
}
