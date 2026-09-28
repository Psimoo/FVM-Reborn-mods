draw_self()
draw_set_color(c_white);
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
if config_key == "difficulty"{
	switch state{
		case 0:
			//draw_text(x,y,"美味级")
			tooltip_text = "初始火苗增加150\n敌人血量降低20%"
			break
		case 1:
			//draw_text(x,y,"火山级")
			tooltip_text = "标准的游戏体验"
			break
		case 2:
			//draw_text(x,y,"浮空级")
			tooltip_text = "重新设计的关卡，难度较高"
			break
		case 3:
			//draw_text(x,y,"星际级")
			tooltip_text = "在浮空级的基础上，所有敌人血量增加20%，出怪间隔减半。\n祝你好运！"
			break
		case 4:
			//draw_text(x,y,"永恒级")
			tooltip_text = "在星际级基础上，所有敌人血量再增加80%。\n而且你的空格被抠了！祝你好运？？？"
			break
		case 5:
			//draw_text(x,y,"不朽级")
			tooltip_text = "敌人生成倍率×2，胜利奖励15倍"
			break
	}
	
}
// 在绘制自身之后添加悬停提示
if (point_in_rectangle(mouse_x, mouse_y, x-hitbox_width/2, y-hitbox_height/2, x+hitbox_width/2, y+hitbox_height/2) && tooltip_text != "") ||
(b_type == "prev" && point_in_rectangle(mouse_x, mouse_y, room_width/2-180, room_height/2, room_width/2+205, room_height/2+160)){
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    var tt_width = string_width(tooltip_text) + 20;
    var tt_height = string_height(tooltip_text) + 10;
    var tt_x = mouse_x + 15;
    var tt_y = mouse_y - 15;
    
    // 确保提示框在屏幕内
    if (tt_x + tt_width > room_width) tt_x = room_width - tt_width;
    if (tt_y + tt_height > room_height) tt_y = room_height - tt_height;
    
	draw_rectangle(tt_x, tt_y - tt_height / 2, tt_x + tt_width, tt_y + tt_height/2,false);
	draw_set_alpha(1);
    draw_rectangle(tt_x, tt_y - tt_height / 2, tt_x + tt_width, tt_y + tt_height/2, true);
    draw_set_color(c_white);
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
    draw_text(tt_x + 10 , tt_y , tooltip_text);
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}
