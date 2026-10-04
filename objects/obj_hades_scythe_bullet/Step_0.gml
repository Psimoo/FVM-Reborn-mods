if (global.is_paused)
{
    image_speed = 0;
    speed = 0;
    exit;
}

image_speed = 2;
speed = 4.8;
t += (speed * dir);

if (t >= 950)
{
    t = 950;
    dir = -1;
}

if (t <= 0 && dir == -1)
{
    disabled = true;
    instance_destroy();
    exit;
}

if (t <= 40)
    image_alpha = 0;
else
    image_alpha = 1;

var px = t;
var py = -14 * sqrt(px) * sin(0.006613879270715354 * px);

if (dir == -1)
    py = -py;

x = start_x + px;
y = start_y + py;

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
            if (ds_list_find_index(hitted_enemy, _e.id) == -1 && !disabled
                && _e.hp > 0
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }
                ds_list_add(hitted_enemy, _e.id);
            }
        }
    }
}
	}
}
