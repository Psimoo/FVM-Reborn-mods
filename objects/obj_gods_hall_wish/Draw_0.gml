draw_self();

if (mode == 0)
    draw_sprite_ext(spr_gods_hall_wish_count, 0, x, y - 9, 1.35, 1.35, 0, c_white, 1);
else if (mode == 1)
    draw_sprite_ext(spr_gods_hall_wish_count, 1, x, y - 9, 1.35, 1.35, 0, c_white, 1);
else if (mode == 2)
{
    draw_set_font(font_number);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(x, y - 9, "x50");
}

image_index = 0;

if (hovered && parent_gui.wish_completed)
{
    image_index = 1;
    var tooltip_x = x - 49;
    var tooltip_y = y + 27;
    var tooltip_text;
    if (mode == 2)
        tooltip_text = "点击消耗475000G\n进行诸神宝殿抽奖50次";
    else if (mode == 1)
        tooltip_text = "点击消耗47500G\n进行诸神宝殿抽奖5次";
    else
        tooltip_text = "点击消耗10000G\n进行诸神宝殿抽奖";
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(tooltip_x - 5, tooltip_y - 5, tooltip_x + string_width(tooltip_text) + 5, tooltip_y + string_height(tooltip_text) + 5, false);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(tooltip_x, tooltip_y, tooltip_text);
}

if (!parent_gui.wish_completed)
    image_index = 2;
