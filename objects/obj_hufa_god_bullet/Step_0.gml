if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

timer++;

if (timer > max_life || x > 2200 || y > 1200 || x < 0 || y < 0)
{
    if (ds_exists(hitted_enemy, ds_type_list))
        ds_list_destroy(hitted_enemy);
    instance_destroy();
    exit;
}

if (!has_hit)
{
    if (instance_exists(target_id) && target_id.hp > 0)
    {
        var _dx = target_id.x - x;
        var _dy = target_id.y - y;
        var _len = point_distance(0, 0, _dx, _dy);
        if (_len > 0)
        {
            move_x = (_dx / _len) * move_speed;
            move_y = (_dy / _len) * move_speed;
        }
    }
    image_angle = point_direction(0, 0, move_x, move_y);
}

x += move_x;
y += move_y;

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
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0
                && precise_bbox_collision(id, _e))
            {
                var _cannot_be_damaged = false;
                if (variable_instance_exists(_e, "invincible") && _e.invincible)
                    _cannot_be_damaged = true;

                if (_cannot_be_damaged)
                {
                    target_id = noone;
                    if (abs(move_x) < 0.001 && abs(move_y) < 0.001)
                    {
                        move_x = lengthdir_x(move_speed, image_angle);
                        move_y = lengthdir_y(move_speed, image_angle);
                    }
                    ds_list_add(hitted_enemy, _e.id);
                    continue;
                }

                has_hit = true;

                var _is_boss = variable_instance_exists(_e, "is_boss") && _e.is_boss;
                if (!_is_boss && variable_global_exists("boss_list")
                    && ds_exists(global.boss_list, ds_type_map)
                    && variable_instance_exists(_e, "mouse_id")
                    && ds_map_exists(global.boss_list, _e.mouse_id))
                {
                    _is_boss = true;
                }
                var _immune_to_ash = _e.immune_to_ash;
                var _is_soul = false;
                if (variable_instance_exists(_e, "is_soul"))
                    _is_soul = _e.is_soul;
                var _is_submarine = (string_pos("submarine", object_get_name(_e.object_index)) > 0);

                var _dmg = damage;

                if (_is_boss && shape == 3)
                {
                    // 终转对 Boss 造成护法神当前实际攻击力的 2 倍，包含所有增幅。
                    _dmg = damage * 2;
                }
                else if (_is_boss)
                {
                    _dmg = damage;
                }
                else if (_immune_to_ash)
                {
                    _dmg = damage;
                }
                else if (_is_soul)
                {
                    _dmg = floor(damage * 1.8);
                }
                else if (_is_submarine)
                {
                    _dmg = damage;
                }
                else
                {
                    _dmg = _e.hp;
                }

                var _hp_before = _e.hp;
                var _shield_before = 0;
                if (variable_instance_exists(_e, "shield_hp"))
                    _shield_before = _e.shield_hp;

                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = _dmg;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                if (instance_exists(_e)
                    && _e.hp >= _hp_before
                    && (!variable_instance_exists(_e, "shield_hp") || _e.shield_hp >= _shield_before))
                {
                    has_hit = false;
                    target_id = noone;
                    ds_list_add(hitted_enemy, _e.id);
                    continue;
                }

                ds_list_add(hitted_enemy, _e.id);

                if (random(100) < stun_chance)
                {
                    if (_e.stun_timer < stun_duration)
                        _e.stun_timer = stun_duration;
                }

                var _effect_spr = spr_hufa_god_effect;
                switch (shape)
                {
                    case 1: _effect_spr = spr_hufa_god_effect_1_1; break;
                    case 2: _effect_spr = spr_hufa_god_effect_2; break;
                    case 3: _effect_spr = spr_hufa_god_effect_3; break;
                }

                if (!_is_boss && !_immune_to_ash && !_is_soul && !_is_submarine)
                {
                    _effect_spr = spr_hufa_god_effect_death;
                    _e.ash_death = true;
                }

                var _fx = instance_create_depth(_e.x, _e.y, depth, obj_hufa_god_effect);
                _fx.sprite_index = _effect_spr;
            }
        }
    }
}
}

