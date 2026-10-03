if (obj_player_info_ui.menu_type == 0)
{
    if (global.save_data.player.level < 20)
    {
        show_notice("角色等级不足20级，无法进入跨服远征", 60);
        exit;
    }
    audio_play_sound(snd_button, 0, 0);
    instance_create_depth((room_width / 2) - 5, room_height / 2, -100, obj_cross_server_bg);
    obj_player_info_ui.menu_type = 4;
    obj_world_map_button.world_map = 2;
}
