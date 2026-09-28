if not obj_info_island_bg.is_submenu_opened{
audio_play_sound(snd_button,0,0)
instance_destroy(obj_info_island_bg)
if (global.level_id == "test_level" && variable_global_exists("test_info_island_mode")
    && global.test_info_island_mode)
{
    global.test_mouse_picker_open = false;
    global.is_paused = false;
}
}
