// 工匠神水平子弹 - 步事件
// 沿路径点往返移动，到达每个路径点播放一次转向特效，全程对沿途敌人造成伤害
if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

life_frames++;
if (life_frames >= max_life_frames)
{
    if (ds_exists(hitted_enemy, ds_type_list)) ds_list_destroy(hitted_enemy);
    instance_destroy();
    exit;
}

// 确定当前段目标点
var _tx, _ty;
if (phase == 1)            // OUTBOUND_POINT_1
{
    _tx = wp1_x;
    _ty = wp1_y;
}
else if (phase == 2)        // OUTBOUND_POINT_2
{
    _tx = wp2_x;
    _ty = wp2_y;
}
else if (phase == 3)        // RETURN（返回起点快照）
{
    _tx = start_x;
    _ty = start_y;
}
else                       // DONE
{
    if (ds_exists(hitted_enemy, ds_type_list)) ds_list_destroy(hitted_enemy);
    instance_destroy();
    exit;
}

// 向当前段目标移动（向量归一化，避免浮点插值造成路线偏移）
var _dx = _tx - x;
var _dy = _ty - y;
var _dist = sqrt(_dx * _dx + _dy * _dy);

if (_dist <= move_speed)
{
    x = _tx;
    y = _ty;

    if (phase == 1)
    {
        var _turn_spr = spr_gongjiang_god_effect_1_1;
        if (shape == 1) _turn_spr = spr_gongjiang_god_effect_2_2;
        else if (shape == 2) _turn_spr = spr_gongjiang_god_effect_3_2;
        else if (shape == 3) _turn_spr = spr_gongjiang_god_effect_3_3;
        var _turn_fx = instance_create_depth(x, y, depth - 10, obj_gongjiang_god_effect);
        _turn_fx.sprite_index = _turn_spr;
        _turn_fx.effect_kind = "turn";
        // 若 wp1 == wp2（单段往返），跳过 phase 2 直接返回
        if (wp1_x == wp2_x && wp1_y == wp2_y)
            phase = 3;
        else
            phase = 2;
    }
    else if (phase == 2)
    {
        var _turn_spr2 = spr_gongjiang_god_effect_1_1;
        if (shape == 1) _turn_spr2 = spr_gongjiang_god_effect_2_2;
        else if (shape == 2) _turn_spr2 = spr_gongjiang_god_effect_3_2;
        else if (shape == 3) _turn_spr2 = spr_gongjiang_god_effect_3_3;
        var _turn_fx2 = instance_create_depth(x, y, depth - 10, obj_gongjiang_god_effect);
        _turn_fx2.sprite_index = _turn_spr2;
        _turn_fx2.effect_kind = "turn";
        phase = 3;
    }
    else
    {
        phase = 4;
        if (ds_exists(hitted_enemy, ds_type_list)) ds_list_destroy(hitted_enemy);
        instance_destroy();
        exit;
    }
}
else
{
    x += (_dx / _dist) * move_speed;
    y += (_dy / _dist) * move_speed;
}

// 命中检测 - 全程沿路对 bbox 相交的敌人造成伤害
if (!ds_exists(hitted_enemy, ds_type_list)) exit;

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
            if (_e.hp > 0
                && precise_bbox_collision(id, _e))
            {
                if (ds_list_find_index(hitted_enemy, _e.id) == -1)
                {
                    var _hp_before = _e.hp;

                    // 调用统一伤害接口，不直接访问敌人私有字段
                    with (_e)
                    {
                        damage_amount = other.damage;
                        damage_type = other.damage_type;
                        event_user(0);
                    }

                    if (!ds_exists(hitted_enemy, ds_type_list)) break;
                    ds_list_add(hitted_enemy, _e.id);

                    // 三转(含以上)命中后概率定身
                    if (pin_chance > 0 && instance_exists(_e) && _e.hp > 0 && random(1) < pin_chance)
                        _e.frozen_timer = max(_e.frozen_timer, pin_duration);

                    // 三转+ 概率释放河豚毒素特效
                    if (poison_chance > 0 && poison_spr != -1 && instance_exists(_e) && random(1) < poison_chance)
                    {
                        var _pfx = instance_create_depth(_e.x, _e.y, _e.depth - 10, obj_gongjiang_god_effect);
                        _pfx.sprite_index = poison_spr;
                        _pfx.effect_kind = "poison";
                    }

                    // 击杀产生泡沫效果
                    var _is_kill = (!instance_exists(_e) || _e.hp <= 0 || _hp_before <= damage);
                    if (_is_kill)
                    {
                        if (instance_exists(_e))
                            _e.ash_death = true;
                        var _fx = instance_create_depth(_e.x, _e.y, _e.depth - 10, obj_gongjiang_god_effect);
                        _fx.sprite_index = spr_gongjiang_god_effect_death;
                        _fx.effect_kind = "kill";
                    }
                }
            }
        }

        if (!ds_exists(hitted_enemy, ds_type_list)) break;
    }
}

// 越界兜底
if (x > 2200 || y > 1200 || x < -200 || y < -200)
{
    if (ds_exists(hitted_enemy, ds_type_list)) ds_list_destroy(hitted_enemy);
    instance_destroy();
}
