if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

if (burnt == 1)
    sprite_index = spr_fire_bullet;

x += move_speed;

if (target_row != -1)
{
    var target_y = global.grid_offset_y + (global.grid_cell_size_y * target_row);
    var transition_speed = 0.15;
    y = lerp(y, target_y, transition_speed);

    if (abs(y - target_y) < 30)
        row = target_row;
}

if (x > 2200 || y > 1200 || x < 0 || y < 0)
{
    if (ds_exists(hitted_enemy, ds_type_list))
        ds_list_destroy(hitted_enemy);
    instance_destroy();
    exit;
}

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
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                var _prev_hp = _e.hp;

                with (_e)
                {
                    if (other.burnt == 1)
                        audio_play_sound(snd_fire_hit, 0, 0);
                    else
                        audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                ds_list_add(hitted_enemy, _e.id);

                // 子弹击杀灰烬
                if (ash_kill && _prev_hp > 0 && _e.hp <= 0)
                {
                    if (shape >= 2)
                    {
                        var _ash = instance_create_depth(_e.x, _e.y - 20, depth, obj_mouse_ash_death);
                        _ash.special_ash = true;
                        _ash.sprite_index = _e.sprite_index;
                        _ash.image_index = _e.image_index;
                    }
                    else
                    {
                        instance_create_depth(_e.x, _e.y - 20, depth, obj_mouse_ash_death);
                    }
                }

                if (random(1) < fire_chance)
                {
                    var fire_spr = spr_houyi_god_fire;
                    if (shape == 1) fire_spr = spr_houyi_god_fire_1;
                    else if (shape == 2) fire_spr = spr_houyi_god_fire_2;
                    else if (shape == 3) fire_spr = spr_houyi_god_fire_3;

                    var inst = instance_create_depth(_e.x, _e.y, depth, obj_houyi_god_fire);
                    inst.sprite_index = fire_spr;
                    inst.damage = damage * (burn_bonus ? 1.5 : 1);
                    inst.damage_type = "pierce";
                    inst.grid_row = _e.grid_row;
                    inst.grid_col = _e.grid_col;
                    inst.shape = shape;
                    inst.target_type = target_type;
                    inst.stack_count = sanwei_stack;
                }
            }
        }
    }
}
	}
}

