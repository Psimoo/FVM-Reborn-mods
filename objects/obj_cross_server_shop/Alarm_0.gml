if (instance_exists(obj_cross_server_bg))
    obj_cross_server_bg.is_submenu_opened = false;

with (obj_cross_server_level_create) {
    visible = true;
    is_submenu_opened = false;
}

instance_destroy();
