// The shop is a modal overlay. Ignore clicks on expedition buttons while it is open
// so the underlying level cannot receive the same mouse event.
if (instance_exists(obj_cross_server_shop)) exit;

if (!is_disabled)
{
    audio_play_sound(snd_button, 0, 0);
    var level_list = ds_map_find_value(global.maps_map, cross_server_map_id).levels_data;
    global.level_data = level_list[level_index];
    global.level_id = global.level_data.id;
    var _file_path = "level_data/" + global.level_data.level_file;
    
    if (global.difficulty >= 2)
        _file_path = "level_data/" + global.level_data.hard_level_file;
    
    var _buffer = buffer_load(_file_path);
    
    if (!buffer_exists(_buffer))
    {
        show_debug_message("错误：无法加载关卡文件到缓冲区: " + _file_path);
    }
    else
    {
        var _json_string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        global.level_file = json_parse(_json_string);
        
        if (global.level_file == -1)
        {
            show_debug_message("错误：JSON 解析失败！");
        }
        else
        {
            show_debug_message("关卡文件加载并解析成功！");
            show_debug_message(global.level_file);
        }
    }
    
    global.map_id = "tower_cake";
    global.map_name = "跨服远征";
    // 记录返回跨服远征界面时的页签，退出关卡后恢复
    if (instance_exists(obj_cross_server_bg)) {
        global.cross_server_return_page = obj_cross_server_bg.selected_page;
    }
    global.gui_stack.to(room_ready);
}
