if (!obj_cross_server_bg.is_submenu_opened)
{
    audio_play_sound(snd_button, 0, 0);
    instance_destroy(obj_cross_server_bg);
}
