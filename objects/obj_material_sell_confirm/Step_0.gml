// ===== 输入框文字处理 =====
var _raw = keyboard_string
var _filtered = ""

// 过滤非数字字符
for (var i = 1; i <= string_length(_raw); i++) {
    var _ch = string_char_at(_raw, i)
    if (string_ord_at(_ch, 1) >= 48 && string_ord_at(_ch, 1) <= 57) {
        _filtered += _ch
    }
}

// 处理空输入
if (_filtered == "") {
    input_quantity = 0
} else {
    // 去除前导零（保留单个"0"的情况）
    while (string_length(_filtered) > 1 && string_char_at(_filtered, 1) == "0") {
        _filtered = string_delete(_filtered, 1, 1)
    }
    input_quantity = real(_filtered)
}

// 限制数量上限
if (input_quantity > max_amount) {
    input_quantity = max_amount
    _filtered = string(max_amount)
}

// 确保最小数量为1（当有输入内容时）
if (_filtered != "" && input_quantity < 1) {
    input_quantity = 1
    _filtered = "1"
}

// 同步 keyboard_string
if (_filtered != _raw) {
    keyboard_string = _filtered
}

// 光标闪烁
cursor_blink += 1
if (cursor_blink > 60) cursor_blink = 0

// ===== 按钮交互 =====
selected_button = -1
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

for (var i = 0; i < array_length(buttons); i++) {
    var btn = buttons[i]
    var btn_x = x + btn[0]
    var btn_y = y + layout_btn_y
    var btn_width = btn[2]
    var btn_height = btn[3]

    if (point_in_rectangle(mx, my,
        btn_x - btn_width/2, btn_y - btn_height/2,
        btn_x + btn_width/2, btn_y + btn_height/2))
    {
        selected_button = i

        if (mouse_check_button_released(mb_left)) {
            audio_play_sound(snd_button, 0, 0)
            switch (i) {
                case 0:
                    // 最大数量
                    input_quantity = max_amount
                    keyboard_string = string(max_amount)
                    break
                case 1:
                    // 确定出售
                    if (input_quantity > 0 && input_quantity <= max_amount && max_amount > 0) {
                        var _total = input_quantity * unit_price
                        global.save_data.player.gold += _total
                        add_material_amount(sell_material_id, -input_quantity)
                        if (instance_exists(obj_package_bg)) {
                            obj_package_bg.is_submenu_opened = false
                        }
                        instance_destroy()
                    }
                    break
                case 2:
                    // 取消
                    if (instance_exists(obj_package_bg)) {
                        obj_package_bg.is_submenu_opened = false
                    }
                    instance_destroy()
                    break
            }
        }
        break
    }
}

// ===== 键盘快捷键 =====
// 回车键确认出售
if (keyboard_check_pressed(vk_enter)) {
    if (input_quantity > 0 && input_quantity <= max_amount && max_amount > 0) {
        audio_play_sound(snd_button, 0, 0)
        var _total = input_quantity * unit_price
        global.save_data.player.gold += _total
        add_material_amount(sell_material_id, -input_quantity)
        if (instance_exists(obj_package_bg)) {
            obj_package_bg.is_submenu_opened = false
        }
        instance_destroy()
    }
}

// ESC键取消
if (keyboard_check_pressed(vk_escape)) {
        if (instance_exists(obj_package_bg)) {
            obj_package_bg.is_submenu_opened = false
        }
        instance_destroy()
    }
