if global.is_paused{
	image_speed = 0
	exit
}

// 动画控制
if (!has_hit_anim) {
	// 未命中阶段：保持指定帧范围
	if (shape == 0 || shape == 1) {
		// shape0/1：保持第一帧
		image_speed = 0
		image_index = 0
	} else {
		// shape2及以上：循环播放1-8帧（索引0-7）
		image_speed = 1
		var _frames = sprite_get_number(sprite_index)
		if (_frames > 8) {
			if (image_index >= 8) image_index = 0
		}
	}
} else {
	// 命中后：播放剩余帧，播完销毁
	image_speed = 1
	hit_anim_timer++
	var _total_frames = sprite_get_number(sprite_index)
	if (image_index >= _total_frames - 1) {
		instance_destroy()
		exit
	}
}

// 命中动画播放中不移动也不碰撞
if (has_hit_anim) {
	exit
}

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
                // 命中后切换到命中动画
                has_hit_anim = true
                move_speed = 0
                y_move_speed = 0
                // 跳到剩余帧的起始帧
                if (shape == 0 || shape == 1) {
                    image_index = 1
                } else {
                    image_index = 8
                }
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
