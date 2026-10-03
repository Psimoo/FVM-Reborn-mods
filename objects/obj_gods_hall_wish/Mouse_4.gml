if (!obj_gods_hall_bg.is_submenu_opened)
{
    var cost = (mode == 2) ? 475000 : ((mode == 1) ? 47500 : 10000);

    if (global.save_data.player.gold >= cost || (global.debug && global.save_data.player.gold >= 100))
    {
        if (parent_gui.wish_completed)
        {
            audio_play_sound(snd_button, 0, 0);

            if (parent_gui.is_wishing)
            {
                parent_gui.is_wishing = false;
                parent_gui.reward_list = [];
            }

            if (!parent_gui.is_wishing)
            {
                global.save_data.player.gold -= global.debug ? 100 : cost;

                if (mode == 2)
                    parent_gui.start_wishing50 = true;
                else if (mode == 1)
                    parent_gui.start_wishing5 = true;
                else
                    parent_gui.start_wishing = true;
            }
        }
    }
    else
    {
        show_notice("金币不足", 60);
    }
}
