var _hittable = (shape < 2) ? ["normal", "air", "invisible"] : ["normal", "air", "underground", "invisible"];

var _target = noone;
var _best_score = -infinity;

if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(_hittable); _t++)
    {
        var _key = _hittable[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e) || _e.hp <= 0) continue;

            var _dist = point_distance(x, y, _e.x, _e.y);
            var _score = -_dist;
            if (_e.is_boss) _score += 1000000;

            if (_score > _best_score)
            {
                _best_score = _score;
                _target = _e;
            }
        }
    }
}

if (_target != noone && instance_exists(_target))
{
    // 终转对 Boss 使用基础形态攻击力的 2 倍，不能直接取终转自身的攻击力。
    var _base_upgrade = get_plant_data_with_skill(plant_id, 0, current_level, skill);
    var _base_atk = atk;
    if (_base_upgrade != undefined && ds_map_exists(_base_upgrade, "atk"))
        _base_atk = _base_upgrade[? "atk"];

    var inst = instance_create_depth(x, y - 75, depth - 500, obj_hufa_god_bullet);
    inst.damage = atk;
    inst.base_atk = _base_atk;
    inst.shape = shape;
    inst.target_id = _target.id;
    inst.hittable_types = (shape < 2) ? ["normal", "air", "invisible"] : ["normal", "air", "underground", "invisible"];

    var _dx = _target.x - x;
    var _dy = _target.y - (y - 75);
    var _len = point_distance(0, 0, _dx, _dy);
    if (_len > 0)
    {
        inst.move_x = (_dx / _len) * inst.move_speed;
        inst.move_y = (_dy / _len) * inst.move_speed;
    }

    switch (shape)
    {
        case 0: inst.sprite_index = spr_hufa_god_bullet; break;
        case 1: inst.sprite_index = spr_hufa_god_bullet_1; break;
        case 2: inst.sprite_index = spr_hufa_god_bullet_2; break;
        case 3: inst.sprite_index = spr_hufa_god_bullet_3; break;
    }

    inst.image_angle = point_direction(0, 0, inst.move_x, inst.move_y);

    audio_play_sound(snd_shot, 0, 0);
}
