if global.is_paused{
	exit
}
x += move_speed
y -= cvspeed
cvspeed -= cgravity
image_angle -= 5
if x > 2200 or y > 1200 or x < -200 or y < -200{
	instance_destroy()
	exit
}

if target_enemy != noone && (!instance_exists(target_enemy) or target_enemy.hp <= 0){

    if y >= thrower_y {

        instance_create_depth(x,y,depth,obj_iceeggboilerpult_bullet_effect)
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
            if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(snd_egg_bullet,0,0)
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    event_user(0)
                    if ice_timer < 600{
                        ice_timer = 600
                    }
                }
                var effect_inst = instance_create_depth(x,y,depth,obj_iceeggboilerpult_bullet_effect)
                if sprite_index == spr_ice_egg_pisces_bullet{
                    effect_inst.sprite_index = spr_ice_egg_pisces_bullet_effect
                }
                hit_enemy = true
                hitted_enemy = _e.id
                instance_destroy()
                exit
            }
        }
    }
}
	}
}
