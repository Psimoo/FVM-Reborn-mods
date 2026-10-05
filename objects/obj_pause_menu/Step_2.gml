// ESC 关闭菜单已统一交给 obj_battle_pause_manager 的 Step 事件处理，
// 避免同一帧内两处同时响应 ESC 造成“刚关掉又立刻打开”。
// 这里仅在暂停管理器不存在时兜底（正常情况下不会执行）。
if (!instance_exists(obj_battle_pause_manager)) {
    if (keyboard_check_pressed(vk_escape)) {
        if instance_exists(obj_config_menu){
            instance_destroy(obj_config_menu)
        }
        instance_destroy();
        global.is_paused = false;
        global.show_menu = false;
    }
}