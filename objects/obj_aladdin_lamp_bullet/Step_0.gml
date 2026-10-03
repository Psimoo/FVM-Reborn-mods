if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;
var _cy = global.grid_offset_y + ((global.grid_rows * global.grid_cell_size_y) / 2);
var _max_dist = ((global.grid_rows * global.grid_cell_size_y) / 2) + 100;
var _dist = abs(y - _cy);
var _spd = 6 + (8 * (1 - (_dist / max(_max_dist, 1))));
_spd = clamp(_spd, 4, 12);

if (direction == 270)
    y += _spd;
else
    y -= _spd;

var _top = global.grid_offset_y - 81;
var _bot = global.grid_offset_y + (global.grid_rows * global.grid_cell_size_y) + 81;

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
            if (ds_list_find_index(hitted_enemy, _e.id) == -1 && _e.hp > 0
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                    audio_play_sound(snd_fire_hit, 0, 0);
                }

                ds_list_add(hitted_enemy, _e.id);

                if (splash_ratio > 0)
                {
                    hit_row = _e.grid_row;
                    hit_col = _e.grid_col;
                    var _sd = round(damage * splash_ratio);

                    for (var _st = 0; _st < array_length(hittable_types); _st++)
                    {
                        var _skey = hittable_types[_st];
                        if (!variable_struct_exists(global.enemy_by_type, _skey)) continue;
                        var _slist = global.enemy_by_type[$ _skey];
                        for (var _si = 0; _si < array_length(_slist); _si++)
                        {
                            var _se = _slist[_si];
                            if (!instance_exists(_se)) continue;
                            with (_se)
                            {
                                if (hp > 0 && ds_list_find_index(other.hitted_enemy, id) == -1 && grid_row >= (other.hit_row - 1) && grid_row <= (other.hit_row + 1) && grid_col >= (other.hit_col - 1) && grid_col <= (other.hit_col + 1))
                                {
                                    damage_amount = _sd;
                                    damage_type = other.damage_type;
                                    event_user(0);
                                    audio_play_sound(snd_fire_hit, 0, 0);
                                    ds_list_add(other.hitted_enemy, id);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
}


if (y < _top || y > _bot)
    instance_destroy();
