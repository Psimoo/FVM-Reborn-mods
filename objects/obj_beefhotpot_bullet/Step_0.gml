if global.is_paused{
    exit
}
attack_timer ++
if attack_timer >= 120{
    instance_destroy()
    exit
}

// 类型过滤碰撞检测
hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (attack_timer mod 12 == 1 && variable_global_exists("enemy_by_type"))
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
            if (_e.hp > 0 && row == _e.grid_row
                && ((shape <= 1 && _e.x - x <= 4.5*global.grid_cell_size_x) || (shape >= 1 && _e.x - x <= 5.5*global.grid_cell_size_x))
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    if hp > other.damage{
                        audio_play_sound(snd_fire_hit,0,0)
                        damage_amount = other.damage
                        damage_type = other.damage_type
                        event_user(0)
                    }
                    else{
                        if special_ash{
                            var inst = instance_create_depth(x,y-20,depth,obj_mouse_ash_death)
                            inst.special_ash = true
                            inst.sprite_index = sprite_index
                            inst.image_index = image_index
                        }
                        else{
                            instance_create_depth(x,y-20,depth,obj_mouse_ash_death)
                        }
                        instance_destroy()
                    }
                }
            }
        }
    }
}
	}
}
