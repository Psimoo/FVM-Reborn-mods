if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

timer++;

if (timer > max_life || x > 2200 || y > 1200 || x < 0 || y < 0)
{
    instance_destroy();
    exit;
}

if (!has_hit)
{
    if (instance_exists(target_id) && target_id.hp > 0)
    {
        // 瞄准点抬高：敌人精灵原点在脚底，瞄到身体；和 obj_hongliukaochuan/Other_11.gml 的 _aim_h 保持一致
        var _aim_h = 37;
        var _dx = target_id.x - x;
        var _dy = (target_id.y - _aim_h) - y;
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

                // 魂系 = 幽灵类老鼠（invisible）或带 is_soul 标记的敌人，1.3 倍伤害
                var _is_soul = (_key == "invisible");
                if (variable_instance_exists(_e, "is_soul") && _e.is_soul)
                    _is_soul = true;

                var _dmg = damage;
                if (_is_soul)
                    _dmg = floor(damage * 1.3);

                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = _dmg;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                ds_list_add(hitted_enemy, _e.id);

                // 命中特效：位置取子弹当前位置（=命中点），朝向与子弹一致；
                // 不想要这个特效就把下面 3 行注掉即可
               // var _fx = instance_create_depth(x, y, depth, obj_hongliukaochuan_bullet_effect);
               // _fx.image_angle = image_angle;
           }
        }
    }
}
