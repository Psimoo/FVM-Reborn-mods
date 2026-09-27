if (global.is_paused)
    exit;

event_inherited();

if (is_frozen)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

var _hittable = (shape < 2) ? ["normal", "air"] : ["normal", "air", "underground"];

var has_enemy = false;

if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(_hittable); _t++)
    {
        var _key = _hittable[_t];
        if (variable_struct_exists(global.enemy_by_type, _key))
        {
            var _list = global.enemy_by_type[$ _key];
            for (var _i = 0; _i < array_length(_list); _i++)
            {
                var _e = _list[_i];
                if (instance_exists(_e) && _e.hp > 0)
                {
                    has_enemy = true;
                    break;
                }
            }
        }
        if (has_enemy) break;
    }
}

if (has_enemy)
{
    attack_timer++;

    if (attack_timer == (cycle - (3 * current_flash_speed)))
    {
        event_user(1);
        state = 1;
    }

    if (attack_timer > cycle)
    {
        attack_timer = 0;
        state = 0;
    }
}
else
{
    attack_timer = 0;
    state = 0;
}
