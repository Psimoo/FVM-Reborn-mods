// 池内对象不执行逻辑（移动、碰撞、音效、绘制全部跳过）
if (!active || pooled){
	exit
}
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

hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = bullet_sap_type_list(id, _key);
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
                var _fx = pool_acquire(obj_coffeecup_bullet_effect, x, y, depth);
                _fx.pooled_managed = true;
                _fx.timer = 0;
                _fx.image_index = 0;
                pool_release_bullet(id, "hit")
                exit
            }
        }
    }
}
	}
}

if x > 2200 or y > 1200 or x < 0 or y < 0{
    pool_release_bullet(id, "out")
    exit
}
if disabled{
    image_alpha -= 0.1
    if image_alpha <= 0{
        pool_release_bullet(id, "fade")
    }
}