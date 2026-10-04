if global.is_paused{
	exit
}
x += move_speed
y -= cvspeed
cvspeed -= cgravity
image_angle -= 5

// 类型过滤碰撞检测
if (!hit_enemy && variable_global_exists("enemy_by_type"))
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
            if (_e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(snd_egg_bullet,0,0)
                    damage_amount = other.damage
                    damage_type = other.damage_type
                    event_user(0)
                    // 定身效果
                    var _chance = 20;
                    var _duration = 90;
                    if (other.shape >= 1) {
                        _chance = 40;
                        _duration = 150;
                    }
                    if (random(100) < _chance) {
                        if (stun_timer < _duration) {
                            stun_timer = _duration;
                        }
                    }
                }
                var _effect = instance_create_depth(x, y, depth, obj_ronghedan_god_bullet_effect)
                _effect.damage = damage
                _effect.shape = shape
                _effect.row = row
                _effect.hitted_enemy = _e.id
                _effect.target_type = target_type
                _effect.damage_type = damage_type
                hit_enemy = true
                hitted_enemy = _e.id
                instance_destroy()
                exit
            }
        }
    }
}

if x > 2200 or y > 1200 or x < -200 or y < -200{
    instance_destroy()
    exit
}
// 目标敌人在飞行过程中死亡，检查是否落地
if target_enemy != noone && (!instance_exists(target_enemy) or target_enemy.hp <= 0){
    // 目标敌人在飞行过程中死亡，检查是否落地
    if y >= thrower_y {
        // 击中地面，产生爆炸效果（第6帧炸开）
        var _effect = instance_create_depth(x, y, depth, obj_ronghedan_god_bullet_effect)
        _effect.damage = damage
        _effect.shape = shape
        _effect.row = row
        _effect.hitted_enemy = noone
        _effect.target_type = target_type
        _effect.damage_type = damage_type
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
