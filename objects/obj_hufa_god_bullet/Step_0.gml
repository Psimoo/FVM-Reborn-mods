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
                has_hit = true;

                var _is_boss = _e.is_boss;
                var _is_elite = false;
                if (variable_instance_exists(_e, "is_elite"))
                    _is_elite = _e.is_elite;
                var _is_soul = false;
                if (variable_instance_exists(_e, "is_soul"))
                    _is_soul = _e.is_soul;

                var _dmg = damage;

                if (_is_boss && shape == 3)
                {
                    _dmg = base_atk * 2;
                }
                else if (_is_boss)
                {
                    _dmg = damage;
                }
                else if (_is_elite)
                {
                    _dmg = damage;
                }
                else if (_is_soul)
                {
                    _dmg = floor(damage * 1.8);
                }
                else
                {
                    _dmg = _e.hp;
                }

                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = _dmg;
                    damage_type = other.damage_type;
                    event_user(0);
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

                if (!_is_boss && !_is_elite && !_is_soul)
                    _effect_spr = spr_hufa_god_effect_death;

                var _fx = instance_create_depth(_e.x, _e.y, depth, obj_hufa_god_effect);
                _fx.sprite_index = _effect_spr;
            }
        }
    }
}
