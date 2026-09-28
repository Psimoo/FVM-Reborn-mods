draw_sprite(global.level_data.level_sprite,map_spr_index,0,0)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(font_yuan)
draw_text(0,0,"FPS:"+string(fps))
draw_text(0,25,"加速:"+(speed_up ? "开" : "关") + "（shift）")
draw_text(0,50,"暂停（空格）\n菜单（ESC）")

if global.level_id == "test_level"{
	var _total = 0
	for (var _mouse_index = 0; _mouse_index < instance_number(obj_test_mouse); _mouse_index++) {
		var _test_mouse = instance_find(obj_test_mouse, _mouse_index)
		if variable_instance_exists(_test_mouse, "test_damage_total"){
			_total += _test_mouse.test_damage_total
		}
	}
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(font_yuan)
	draw_set_color(c_yellow)
	var _remain = test_dps_window - test_dps_timer
	var _secs = ceil(_remain / 60)
	draw_text(0, 100, "5秒内总伤害: " + string(test_dps_display))
	draw_text(0, 125, "累计总伤害: " + string(_total))
	draw_text(0, 150, "下次结算: " + string(_secs) + "秒")
	draw_set_color(c_white)
	draw_text(0, 175, "F2：打开测试老鼠选择");
}


if (global.level_id == "test_level" && global.test_mouse_picker_id != "")
{
    draw_set_color(c_yellow);
    draw_set_font(font_yuan);
    draw_text(0, 200, "已选择测试老鼠：点击场上格子创建");
    draw_set_color(c_white);
}
