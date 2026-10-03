if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 0.5;
x += move_speed;
y -= cvspeed;
cvspeed -= cgravity;

if (x > 2200 || y > 1200 || x < -200 || y < -200)
{
    instance_destroy();
    exit;
}

if (cvspeed < 0 && y >= thrower_y)
{
    if (!hit_enemy)
    {
        var inst = instance_create_depth(x, y, depth, obj_iceeggboilerpult_bullet_effect);
        
        if (shape == 3)
            inst.sprite_index = spr_ymir_bullet_effect;
        
        if (shape == 2)
            inst.sprite_index = spr_ymir_bullet_effect_1;
        
        if (shape == 1)
            inst.sprite_index = spr_ymir_bullet_effect_2;
        
        if (shape == 0)
            inst.sprite_index = spr_ymir_bullet_effect_3;
        
        audio_play_sound(snd_egg_bullet, 0, 0);
        instance_destroy();
        exit;
    }
}

// 类型过滤碰撞检测
if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
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
            if (!hit_enemy
                && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                var inst;
                var _hit_id = _e.id;
                audio_play_sound(snd_egg_bullet, 0, 0);

                with (_e)
                {
                    if (other.shape <= 1 || hp > other.damage)
                    {
                        damage_amount = other.damage;
                        damage_type = other.damage_type;
                        event_user(0);
                    }
                    else
                    {
                        if (special_ash)
                        {
                            inst = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                            inst.special_ash = true;
                            inst.sprite_index = sprite_index;
                            inst.image_index = image_index;
                        }
                        else
                        {
                            instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                        }

                        instance_destroy();
                    }
                }

                inst = instance_create_depth(x, y, depth, obj_iceeggboilerpult_bullet_effect);

                if (shape == 3)
                    inst.sprite_index = spr_ymir_bullet_effect;

                if (shape == 2)
                    inst.sprite_index = spr_ymir_bullet_effect_1;

                if (shape == 1)
                    inst.sprite_index = spr_ymir_bullet_effect_2;

                if (shape == 0)
                    inst.sprite_index = spr_ymir_bullet_effect_3;

                hit_enemy = true;
                hitted_enemy = _hit_id;
                instance_destroy();
                exit;
            }
        }
        if (hit_enemy) break;
    }
}
}

