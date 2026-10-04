if global.is_paused{
	
	image_speed = 0
	exit
}
image_speed = 1
if burnt == 1{
	sprite_index = spr_xiaolongbao_bullet
}
else if burnt == 2{
	sprite_index = spr_fire_bullet
}
x += move_speed
if x > 2200 or y > 1200 or x < 0 or y < 0{
	instance_destroy()
	exit
}

// 类型过滤碰撞检测
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
            if (!instance_exists(id)) break;
            if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    if other.burnt == 2{
                        audio_play_sound(snd_fire_hit,0,0)
                    }
                    else{
                        audio_play_sound(hit_sound,0,0)
                    }
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    if shield_hp <= 0{
                        if ice_timer <= 600 && other.burnt == 0{
                            ice_timer = 600
                        }
                    }
                    event_user(0)
                }
                if burnt == 0{
                    instance_create_depth(x,y,depth,obj_icelongbao_bullet_effect)
                }
                else if burnt == 1{
                    instance_create_depth(x,y,depth,obj_xiaolongbao_bullet_effect)
                }
                else if burnt == 2{
                    var inst = instance_create_depth(x+25,y,depth,obj_fire_bullet_effect)
                    inst.sprite_index = spr_fire_bullet_effect
                }
                instance_destroy()
                exit
            }
        }
    }
}
	}
}
