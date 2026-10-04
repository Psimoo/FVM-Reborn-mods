if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;
x += lengthdir_x(move_speed, direction);
y += lengthdir_y(move_speed, direction);
image_angle = direction;

if (x > 2500 || x < -200 || y > 1500 || y < -200)
{
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
            if (_e.hp > 0
                && ds_exists(hit_enemies, ds_type_list)
                && ds_list_find_index(hit_enemies, _e.id) == -1
    && precise_bbox_collision(id, _e))
            {
                if (ds_exists(hit_enemies, ds_type_list))
                    ds_list_add(hit_enemies, _e.id);
                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }
            }
        }
    }
}
	}
}
