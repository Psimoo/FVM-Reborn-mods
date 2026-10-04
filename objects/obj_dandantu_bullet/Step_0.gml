if (global.is_paused)
    exit;

if (pooled)
    exit;

x += move_speed;

if (!ds_exists(hitted_enemy, ds_type_list))
    exit;

if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
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
        if (!variable_struct_exists(global.enemy_by_type, _key))
            continue;

        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e))
                continue;
            if (_e.hp > 0 && _e.grid_row == row && precise_bbox_collision(id, _e))
            {
                if (ds_list_find_index(hitted_enemy, _e.id) == -1)
                {
                    with (_e)
                    {
                        damage_amount = other.damage;
                        damage_type = other.damage_type;
                        event_user(0);
                    }

                    if (!ds_exists(hitted_enemy, ds_type_list))
                        break;

                    ds_list_add(hitted_enemy, _e.id);
                }
            }
        }

        if (!ds_exists(hitted_enemy, ds_type_list))
            break;
    }
}
	}
}


if (x > 2200)
    instance_destroy();
