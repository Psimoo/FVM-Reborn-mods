// 工匠神竖向子弹 - 步事件
// 列锁定 + 上下速度，到达边缘后反转方向返回；沿途对 bbox 相交敌人造成伤害
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

// 锁定 x 到列中心
var _col_pos = get_world_position_from_grid(col, 0);
x = _col_pos.x;

// 上下移动
y += move_speed * vertical_dir;

// 到达边缘后反转方向返回，清空命中列表以重新命中
var _grid_top = global.grid_offset_y - 40;
var _grid_bottom = global.grid_offset_y + global.grid_cell_size_y * global.grid_rows + 40;
if (vertical_dir < 0 && y <= _grid_top)
{
    y = _grid_top;
    vertical_dir = 1;
    image_angle = 270;
    if (ds_exists(hitted_enemy, ds_type_list)) ds_list_clear(hitted_enemy);
}
else if (vertical_dir > 0 && y >= _grid_bottom)
{
    y = _grid_bottom;
    vertical_dir = -1;
    image_angle = 90;
    if (ds_exists(hitted_enemy, ds_type_list)) ds_list_clear(hitted_enemy);
}

// 命中检测
if (!ds_exists(hitted_enemy, ds_type_list)) exit;

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
            if (_e.hp > 0
                && precise_bbox_collision(id, _e))
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

                    if (!ds_exists(hitted_enemy, ds_type_list)) break;
                    ds_list_add(hitted_enemy, _e.id);

                    if (pin_chance > 0 && instance_exists(_e) && _e.hp > 0 && random(1) < pin_chance)
                        _e.frozen_timer = max(_e.frozen_timer, pin_duration);

                    if (poison_chance > 0 && poison_spr != -1 && instance_exists(_e) && random(1) < poison_chance)
                    {
                        var _pfx = instance_create_depth(_e.x, _e.y, _e.depth - 10, obj_gongjiang_god_effect);
                        _pfx.sprite_index = poison_spr;
                        _pfx.effect_kind = "poison";
                    }

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
}

