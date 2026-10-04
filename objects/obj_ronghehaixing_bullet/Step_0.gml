if global.is_paused{
	image_speed = 0
	exit
}
image_speed = 1

// 追踪模式（终转边界反弹后）
if (has_bounced_wall) {
	if (instance_exists(target_id) && target_id.hp > 0) {
		var _aim_h = 37;
		var _dx = target_id.x - x;
		var _dy = (target_id.y - _aim_h) - y;
		var _len = point_distance(0, 0, _dx, _dy);
		if (_len > 0) {
			move_speed = (_dx / _len) * bullet_speed;
			y_move_speed = (_dy / _len) * bullet_speed;
		}
		image_angle = point_direction(0, 0, move_speed, y_move_speed);
	} else {
		// 目标丢失，重新寻找最近敌人
		target_id = noone;
		var _best = 1000000000;
		for (var _t = 0; _t < array_length(hittable_types); _t++) {
			var _key = hittable_types[_t];
			if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
			var _list = global.enemy_by_type[$ _key];
			for (var _i = 0; _i < array_length(_list); _i++) {
				var _e = _list[_i];
				if (instance_exists(_e) && _e.hp > 0) {
					var _d = point_distance(x, y, _e.x, _e.y);
					if (_d < _best) {
						target_id = _e;
						_best = _d;
					}
				}
			}
		}
	}
}

x += move_speed
y += y_move_speed

// 类型过滤碰撞检测
if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e)) continue;
            if (_e.hp > 0 && (has_bounced_wall || b_type == 0 || (b_type == 1 && row == _e.grid_row))
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(hit_sound,0,0)
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    event_user(0)
                }
                instance_destroy()
                exit
            }
        }
    }
}

// 边界检测
if x > 2200 or y > 1200 or x < 0 or y < -200{
	if (shape == 3 && !has_bounced_wall) {
		// 终转子弹：边界反弹并切换为追踪模式
		has_bounced_wall = true
		bullet_speed = sqrt(move_speed*move_speed + y_move_speed*y_move_speed)
		if (bullet_speed == 0) bullet_speed = 8
		// 反弹（位置拉回边界内）
		if (x > 2200) { x = 2200; move_speed = -abs(move_speed) }
		if (x < 0) { x = 0; move_speed = abs(move_speed) }
		if (y > 1200) { y = 1200; y_move_speed = -abs(y_move_speed) }
		if (y < -200) { y = -200; y_move_speed = abs(y_move_speed) }
		image_angle = point_direction(0, 0, move_speed, y_move_speed)
		// 寻找最近敌人作为追踪目标
		target_id = noone
		var _best = 1000000000
		for (var _t = 0; _t < array_length(hittable_types); _t++) {
			var _key = hittable_types[_t];
			if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
			var _list = global.enemy_by_type[$ _key];
			for (var _i = 0; _i < array_length(_list); _i++) {
				var _e = _list[_i];
				if (instance_exists(_e) && _e.hp > 0) {
					var _d = point_distance(x, y, _e.x, _e.y);
					if (_d < _best) {
						target_id = _e;
						_best = _d;
					}
				}
			}
		}
	} else {
		instance_destroy()
	}
}
