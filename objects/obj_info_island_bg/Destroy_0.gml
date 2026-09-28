instance_destroy(obj_closeinfo_btn)
instance_destroy(obj_info_island_select_btn)
instance_destroy(obj_info_island_edit_menu)
instance_destroy(obj_info_island_edit_btn)
if instance_exists(obj_package_bg){
	obj_package_bg.is_submenu_opened = false
}
if (instance_exists(obj_player_info_ui))
    obj_player_info_ui.menu_type = 0
if (instance_exists(obj_world_map_button))
    obj_world_map_button.world_map = 0
