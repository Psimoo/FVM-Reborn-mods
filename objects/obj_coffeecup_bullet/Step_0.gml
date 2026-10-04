if global.is_paused{
	exit
}
if state_timer < 20{
	state_timer++
}
else{
	state = 1
	state_timer++
}
col = get_grid_position_from_world(x,y).col
if (col >= start_col + 4)&& shape != 2{
	disabled = true
}
if timer < 4{
	timer++
}

else{
	if state == 0{
		image_index = state_timer / 5
		x -= move_speed
	}
	else{
		image_index = 4+floor(state_timer / 5) mod 3
	}
	timer = 0
}
x += move_speed

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
            if (_e.hp > 0 && row == _e.grid_row && !disabled
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(hit_sound,0,0)
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    event_user(0)
                }
                instance_create_depth(x,y,depth,obj_coffeecup_bullet_effect)
                instance_destroy()
                exit
            }
        }
    }
}

if x > 2200 or y > 1200 or x < 0 or y < 0{
    instance_destroy()
    exit
}
if disabled{
	image_alpha -= 0.1
	if image_alpha <= 0{
		instance_destroy()
	}
}