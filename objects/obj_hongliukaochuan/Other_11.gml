// 开火：全屏索敌最近目标，发射追踪穿透的红柳肉串
// 可命中：陆（normal）/ 空（air）/ 幽灵类（invisible）
var _hittable = ["normal", "air", "invisible"];

var _target = noone;
var _best_score = -infinity;

if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(_hittable); _t++)
    {
        var _key = _hittable[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e) || _e.hp <= 0) continue;

            var _dist = point_distance(x, y, _e.x, _e.y);
            var _score = -_dist;
            if (_e.is_boss) _score += 1000000;

            if (_score > _best_score)
            {
                _best_score = _score;
                _target = _e;
            }
        }
    }
}

if (_target != noone && instance_exists(_target))
{
    // 出弹口（相对植物坐标，可调）：向右偏移贴近"嘴部"
    var _muzzle_x = x + 95;
    var _muzzle_y = y + 5;

    var inst = instance_create_depth(_muzzle_x, _muzzle_y, depth - 500, obj_hongliukaochuan_bullet);
    inst.damage = atk;
    inst.base_atk = atk;
    inst.shape = shape;
    inst.target_id = _target.id;
    inst.hittable_types = _hittable;

    // 瞄准点抬高：敌人精灵原点在脚底，往身体方向抬
    var _aim_h = 37;

    var _dx = _target.x - _muzzle_x;
    var _dy = (_target.y - _aim_h) - _muzzle_y;
    var _len = point_distance(0, 0, _dx, _dy);
    if (_len > 0)
    {
        inst.move_x = (_dx / _len) * inst.move_speed;
        inst.move_y = (_dy / _len) * inst.move_speed;
    }

    // 三形态共用同一颗红柳肉串（obj_hongliukaochuan_bullet 的默认精灵就是 spr_hongliukaochuan_bullet）
    inst.image_angle = point_direction(0, 0, inst.move_x, inst.move_y);

    audio_play_sound(snd_shot, 0, 0);
}
