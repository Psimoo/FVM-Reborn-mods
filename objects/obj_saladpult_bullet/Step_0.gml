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

if target_enemy != noone && instance_exists(target_enemy) && target_enemy.hp > 0{
    if hit_enemy {

        var splash_x = target_enemy.x + global.grid_cell_size_x
        var splash_y = target_enemy.y

        var dist = point_distance(x, y, splash_x, splash_y)

        if dist <= 10 or y >= thrower_y {

            instance_create_depth(x,y,depth,obj_saladpult_bullet_effect)
            instance_destroy()
            exit
        }
    }
} else if target_enemy != noone && (!instance_exists(target_enemy) or target_enemy.hp <= 0){

    if y >= thrower_y {

        instance_create_depth(x,y,depth,obj_saladpult_bullet_effect)
        instance_destroy()
        exit
    }
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

hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (!hit_enemy && variable_global_exists("enemy_by_type"))
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
                    audio_play_sound(hit_sound,0,0)
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    event_user(0)
                }
                instance_create_depth(x,y,depth,obj_saladpult_bullet_effect)
                hit_enemy = true
                hitted_enemy = _e.id

                var distance_x = _e.x + global.grid_cell_size_x
                var flight_time = 30

                var total_distance_x = distance_x - x
                var total_distance_y = 300

                move_speed = total_distance_x / flight_time
                cgravity = (2 * total_distance_y) / (flight_time * flight_time)
                cvspeed = (total_distance_y - 0 * cgravity * flight_time * flight_time) / flight_time
                exit
            }
        }
    }
}
	}
}
