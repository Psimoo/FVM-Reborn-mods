if global.is_paused{
	exit
}
x += move_speed
y -= cvspeed
cvspeed -= cgravity
image_angle -= 2
if x > 2200 or y > 1200 or x < -200 or y < -200{
	instance_destroy()
	exit
}

if y >= thrower_y {
    // 击中地面，造成溅射伤害
	var grid_pos = get_grid_position_from_world(x,y)
	var inst = instance_create_depth(grid_pos.x,grid_pos.y,0,obj_panfriedbun_bullet_effect)
	inst.damage = round(damage*splash_ratio)
	inst.grid_row = grid_pos.row
	inst.shape = shape
	if shape >= 1{
		inst.sprite_index = spr_panfriedbun_bullet_effect_2
	}
    instance_destroy()
	exit
}
if !atk_modified{
	with obj_card_parent{
		if plant_id == "fruit_tart"{
			if grid_row == other.row && ((shape <= 1 && x >= other.x) || shape >= 2){
				other.damage *= atk
				other.atk_modified = true
			}
		}
	}
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
            if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                var grid_pos = get_grid_position_from_world(_e.x,_e.y)
                var inst = instance_create_depth(grid_pos.x,grid_pos.y,0,obj_panfriedbun_bullet_effect)
                inst.damage = round(damage*splash_ratio)
                inst.grid_row = grid_pos.row
                inst.shape = shape
                if shape >= 1{
                    inst.sprite_index = spr_panfriedbun_bullet_effect_2
                }
                instance_destroy()
                exit
            }
        }
    }
}
	}
}
