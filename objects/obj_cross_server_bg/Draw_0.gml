draw_set_alpha(1);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
// 手动绘制精灵，保持1.8x视觉缩放（image_xscale/yscale设为10是为了全屏碰撞遮罩）
draw_sprite_ext(sprite_index, image_index, x, y, 1.8, 1.8, 0, c_white, 1);
draw_set_font(font_yuan);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_transformed(302, 55, string(level_passed), 25, 1920, 1.5, 1.5, 0);

// 远征章节页签：前 8 帧为未选中，后 8 帧为选中状态。
for (var _page = 0; _page < 8; _page++) {
    var _tab_x = x - 700 + _page * 200;
    var _tab_y = y - 420;
    var _tab_frame = (_page == selected_page) ? _page + 8 : _page;
    var _tab_enabled = ds_map_exists(global.maps_map, cross_server_page_map_ids[_page]);
    draw_sprite_ext(spr_mod_cs_level_choose, _tab_frame, _tab_x, _tab_y, 1.5, 1.5, 0, _tab_enabled ? c_white : c_gray, 1);
}

if (!ds_map_exists(global.maps_map, cross_server_page_map_ids[selected_page])) {
    draw_set_font(font_yuan);
    draw_set_color(c_ltgray);
    draw_text(x, y - 255, "该章节的关卡内容尚未开放");
}

var _active_map_id = cross_server_page_map_ids[selected_page];
var _active_has_data = ds_map_exists(global.maps_map, _active_map_id);
var _active_levels = _active_has_data ? ds_map_find_value(global.maps_map, _active_map_id).levels_data : [];
var _active_level_count = array_length(_active_levels);
var level_name = [];
for (var _name_index = 0; _name_index < _active_level_count; _name_index++) {
    array_push(level_name, _active_levels[_name_index].name);
}
var k = 0;

for (var j = 0; j < 2; j++)
{
    for (var i = 0; i < 4; i++)
    {
        if (k >= _active_level_count) break;
        if (k >= level_unlocked)
        {
            draw_sprite_ext(spr_mod_cs_level, 0, (x - 608) + (405 * i), (y - 170) + (400 * j), 1.8, 1.8, 0, c_gray, 1);
            draw_sprite_ext(spr_gods_hall_reward, 0, 239 + (405 * i), 314 + (400 * j), 1.8, 1.8, 0, c_gray, 1);
            draw_set_font(font_hei);
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_ext_transformed(233 + (405 * i), 202 + (400 * j), level_name[k], 25, 1920, 1, 1, 0);
            draw_sprite_ext(spr_star_slot, 7 + k, 508 + (405 * i), 204 + (400 * j), 1.8, 1.8, 0, c_gray, 1);
            draw_sprite_ext(spr_mod_cs_level_icon, 0, 228 + (405 * i), 478 + (400 * j), 1.2, 1.2, 0, c_gray, 1);
            draw_set_alpha(1);
            draw_set_color(c_black);
            draw_roundrect((228 + (405 * i)) - 67, (478 + (400 * j)) - 67, 228 + (405 * i) + 65, 478 + (400 * j) + 65, true);
            draw_set_font(font_yuan);
            draw_set_color(c_ltgray);
            draw_text_ext_transformed(312 + (405 * i), 390 + (400 * j), "通过以下关卡后开启：", 25, 1920, 1.2, 1.2, 0);
            if (k > 0) {
                draw_set_font(font_hei);
                draw_set_color(c_black);
                draw_text_ext_transformed(412 + (405 * i), 422 + (400 * j), level_name[k - 1], 25, 1920, 1, 1, 0);
            }
        }
        else
        {
            draw_sprite_ext(spr_mod_cs_level, 0, (x - 608) + (405 * i), (y - 170) + (400 * j), 1.8, 1.8, 0, c_white, 1);
            draw_sprite_ext(spr_gods_hall_reward, 0, 239 + (405 * i), 314 + (400 * j), 1.8, 1.8, 0, c_white, 1);
            draw_set_font(font_hei);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_ext_transformed(233 + (405 * i), 202 + (400 * j), level_name[k], 25, 1920, 1, 1, 0);
            draw_sprite_ext(spr_star_slot, 7 + k, 508 + (405 * i), 204 + (400 * j), 1.8, 1.8, 0, c_white, 1);
            draw_sprite_ext(spr_mod_cs_level_icon, 0, 228 + (405 * i), 478 + (400 * j), 1.2, 1.2, 0, c_white, 1);
            draw_set_alpha(1);
            draw_set_color(c_dkgray);
            draw_roundrect((228 + (405 * i)) - 67, (478 + (400 * j)) - 67, 228 + (405 * i) + 65, 478 + (400 * j) + 65, true);
        }
        
        k++;
    }
}
