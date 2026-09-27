if (!instance_exists(obj_mod_battle_manager))
{
    var battle = instance_find(obj_battle, 0);
    
    if (battle != -4)
    {
        global.mod_battle_manager = instance_create_layer(0, 0, "Instances", obj_mod_battle_manager);
        global.mod_battle_manager.battle = battle;
    }
}

if (!instance_exists(obj_gods_hall_enter))
{
    if (room == room_map || room == room_menu)
        instance_create_depth(750, 56, -3, obj_gods_hall_enter);
}

// 跨服远征入口按钮
if (!instance_exists(obj_cross_server_enter))
{
    if (room == room_map || room == room_menu)
        instance_create_depth(850, 56, -3, obj_cross_server_enter);
}

if (!noticed && global.preloaded == true)
{
    if (room == room_menu)
    {
        show_notice("MOD功能加载完毕", 90);
        noticed = true;
    }
}
