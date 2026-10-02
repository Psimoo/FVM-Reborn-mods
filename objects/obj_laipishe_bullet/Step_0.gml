// 赖皮蛇海胆子弹 - 步事件
// 三段式弹道：卡片→右下角→沿最右列从下往上→右上角→返回卡片销毁
// 全程沿路造成伤害
if (global.is_paused)
    exit;

life_frames++;
if (life_frames >= max_life_frames)
{
    instance_destroy();
    exit;
}

// 属主卡片不存在则安全销毁
if (!instance_exists(owner_card))
{
    instance_destroy();
    exit;
}

// 确定当前段目标
var _tx, _ty;
if (phase == 1)
{
    _tx = wp1_x;
    _ty = wp1_y;
}
else if (phase == 2)
{
    _tx = wp2_x;
    _ty = wp2_y;
}
else
{
    _tx = start_x;
    _ty = start_y;
}

// 向当前段目标移动
var _dx = _tx - x;
var _dy = _ty - y;
var _dist = sqrt(_dx * _dx + _dy * _dy);

if (_dist <= move_speed)
{
    x = _tx;
    y = _ty;

    if (phase == 1)
    {
        // 到达右下角，切换到向上阶段
        phase = 2;
    }
    else if (phase == 2)
    {
        // 到达右上角，切换到返回阶段
        phase = 3;
    }
    else
    {
        // 返回卡片位置，销毁
        instance_destroy();
        exit;
    }
}
else
{
    x += (_dx / _dist) * move_speed;
    y += (_dy / _dist) * move_speed;
}

// 命中检测 - 全程沿路造成伤害
if (!ds_exists(hitted_enemy, ds_type_list))
    exit;

if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key))
            continue;

        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e))
                continue;
            if (_e.hp > 0
                && bbox_right >= _e.bbox_left && bbox_left <= _e.bbox_right
                && bbox_bottom >= _e.bbox_top && bbox_top <= _e.bbox_bottom)
            {
                if (ds_list_find_index(hitted_enemy, _e.id) == -1)
                {
                    var _hp_before = _e.hp;

                    with (_e)
                    {
                        damage_amount = other.damage;
                        damage_type = other.damage_type;
                        event_user(0);
                    }

                    if (!ds_exists(hitted_enemy, ds_type_list))
                        break;

                    ds_list_add(hitted_enemy, _e.id);

                    // 判断是否击杀
                    var _is_kill = false;
                    if (!instance_exists(_e) || _e.hp <= 0 || _hp_before <= damage)
                        _is_kill = true;

                    if (_is_kill)
                    {
                        if (instance_exists(_e))
                            _e.ash_death = true;
                        var _kill_fx = instance_create_depth(_e.x, _e.y, _e.depth - 10, obj_laipishe_effect);
                        if (bullet_shape == 0)
                            _kill_fx.sprite_index = spr_laipishe_effect;
                        else if (bullet_shape == 1)
                            _kill_fx.sprite_index = spr_laipishe_effect_1;
                        else
                            _kill_fx.sprite_index = spr_laipishe_effect_2;
                    }
                }
            }
        }

        if (!ds_exists(hitted_enemy, ds_type_list))
            break;
    }
}
