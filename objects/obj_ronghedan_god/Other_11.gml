// 用户事件1 - 发射子弹
// shape 0/1/2: 本行双蛋
// shape 3: 三行各双蛋（共6发）

var _rows = [];
if (shape == 3) {
    // 灵魂融合：三行攻击（上一行、本行、下一行）
    _rows = [grid_row - 1, grid_row, grid_row + 1];
} else {
    _rows = [grid_row];
}

for (var _r = 0; _r < array_length(_rows); _r++) {
    var _row = _rows[_r];
    // 边界检查
    if (_row < 0 || _row >= global.grid_rows) continue;

    // 每行发射两枚鸡蛋
    for (var _n = 0; _n < 2; _n++) {
        var inst = instance_create_depth(x - 40 + (_n * 20 - 10), y - 125, depth - 500, obj_ronghedan_god_bullet)

        // 设置子弹精灵
        if (shape == 0) {
            inst.sprite_index = spr_ronghedan_god_bullet;
        } else if (shape == 1) {
            inst.sprite_index = spr_ronghedan_god_bullet_1;
        } else {
            inst.sprite_index = spr_ronghedan_god_bullet_2;
        }

        // 基本属性
        inst.damage = atk
        inst.original_damage = atk
        inst.row = _row
        inst.thrower_y = y
        inst.shape = shape

        // 如果有目标敌人，计算预测落点
        if (target_instance != noone && instance_exists(target_instance)) {
            var enemy_x = target_instance.x
            var enemy_y = target_instance.y
            var enemy_speed = target_instance.move_speed

            var distance_x = enemy_x - inst.x
            var flight_time = clamp(30 + (distance_x / 1000) * 45, 30, 75)

            var _spread = (_n == 0) ? -30 : 30;
            var predicted_x = enemy_x - enemy_speed * flight_time - 50 + _spread
            if predicted_x < x predicted_x = x

            var total_distance_x = predicted_x - inst.x
            var total_distance_y = 600

            inst.move_speed = total_distance_x / flight_time
            inst.cgravity = (2 * total_distance_y) / (flight_time * flight_time)
            inst.cvspeed = (total_distance_y - 0 * inst.cgravity * flight_time * flight_time) / flight_time

            inst.target_enemy = target_instance
            inst.has_target = true
        } else {
            inst.move_speed = 8 + (_n * 1 - 0.5)
            inst.cvspeed = 6
            inst.cgravity = 0.2
            inst.has_target = false
            inst.target_enemy = noone
        }

        inst.hit_enemy = false
        inst.splashed = false
    }
}
