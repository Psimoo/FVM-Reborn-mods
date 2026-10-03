if (global.is_paused)
    exit;

event_inherited();

if (is_frozen)
    exit;

var current_flash_speed = flash_speed;

if (is_slowdown)
    current_flash_speed *= 2;

// 红柳烤串机：攻击陆、空、幽灵（魂系）鼠军
var _hittable = ["normal", "air", "invisible"];

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
        if (has_enemy) break;
    }
}

if (has_enemy)
{
    attack_timer++;

    // 开火时序（以动画帧为单位，flash_speed 帧 = 1 张动画帧）
    // _attack_lead：提前多少帧进入攻击动画，让动画先播到"吐子弹"的样子
    // _fire_delay ：再往后延多少帧才真正出弹，越大出弹越晚
    var _attack_lead = 4;
    var _fire_delay = 1;

    if (attack_timer == (cycle - (_attack_lead + _fire_delay) * current_flash_speed))
        state = 1;

    if (attack_timer == (cycle - _fire_delay * current_flash_speed))
        event_user(1);

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
