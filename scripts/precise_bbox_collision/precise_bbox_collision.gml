/// @function precise_bbox_collision(inst_a, inst_b)
/// @param {instance} inst_a - 子弹实例（使用精确未缩放的碰撞遮罩）
/// @param {instance} inst_b - 目标实例（使用其内置 bbox）
/// @return {bool} 是否发生碰撞
/// @description 检测 inst_a 的精确碰撞遮罩（1:1 原始尺寸，不受 image_xscale/image_yscale 影响）是否与 inst_b 的 bbox 重叠。
///              考虑 image_angle 旋转。适用于保持视觉缩放但碰撞使用精确遮罩的场景。
///              同一帧内一颗子弹会与大量敌人比对，子弹自身的旋转包围盒是固定的，这里做缓存，
///              避免每个敌人重复调用 cos/sin 与 sprite_get_bbox_*（性能优化，结果不变）。
function precise_bbox_collision(_inst_a, _inst_b) {
    if (is_undefined(_inst_a) || is_undefined(_inst_b)) return false;
    if (_inst_a == noone || _inst_b == noone) return false;
    if (!instance_exists(_inst_a) || !instance_exists(_inst_b)) return false;

    var _spr = _inst_a.sprite_index;
    if (_spr < 0) return false;

    var _ax = _inst_a.x;
    var _ay = _inst_a.y;
    var _ang = _inst_a.image_angle;

    if (!variable_global_exists("_pbc_cache")) {
        global._pbc_cache = { id: -1, x: 0, y: 0, ang: 0, spr: -1, l: 0, r: 0, t: 0, b: 0 };
    }
    var _c = global._pbc_cache;

    var _a_left, _a_right, _a_top, _a_bottom;
    if (_c.id == _inst_a && _c.x == _ax && _c.y == _ay && _c.ang == _ang && _c.spr == _spr) {
        _a_left = _c.l; _a_right = _c.r; _a_top = _c.t; _a_bottom = _c.b;
    } else {
        var _bl = sprite_get_bbox_left(_spr);
        var _br = sprite_get_bbox_right(_spr);
        var _bt = sprite_get_bbox_top(_spr);
        var _bb = sprite_get_bbox_bottom(_spr);
        var _xo = sprite_get_xoffset(_spr);
        var _yo = sprite_get_yoffset(_spr);

        var _rad = _ang * pi / 180;
        var _cs = cos(_rad);
        var _sn = sin(_rad);

        var _lx1 = _bl - _xo;
        var _lx2 = _br - _xo;
        var _ly1 = _bt - _yo;
        var _ly2 = _bb - _yo;

        var _x1 = _lx1 * _cs - _ly1 * _sn + _ax;
        var _y1 = _lx1 * _sn + _ly1 * _cs + _ay;

        var _x2 = _lx2 * _cs - _ly1 * _sn + _ax;
        var _y2 = _lx2 * _sn + _ly1 * _cs + _ay;

        var _x3 = _lx2 * _cs - _ly2 * _sn + _ax;
        var _y3 = _lx2 * _sn + _ly2 * _cs + _ay;

        var _x4 = _lx1 * _cs - _ly2 * _sn + _ax;
        var _y4 = _lx1 * _sn + _ly2 * _cs + _ay;

        _a_left = min(min(_x1, _x2), min(_x3, _x4));
        _a_right = max(max(_x1, _x2), max(_x3, _x4));
        _a_top = min(min(_y1, _y2), min(_y3, _y4));
        _a_bottom = max(max(_y1, _y2), max(_y3, _y4));

        _c.id = _inst_a; _c.x = _ax; _c.y = _ay; _c.ang = _ang; _c.spr = _spr;
        _c.l = _a_left; _c.r = _a_right; _c.t = _a_top; _c.b = _a_bottom;
    }

    var _b_left = _inst_b.bbox_left;
    var _b_right = _inst_b.bbox_right;
    var _b_top = _inst_b.bbox_top;
    var _b_bottom = _inst_b.bbox_bottom;

    return _a_right >= _b_left && _a_left <= _b_right
        && _a_bottom >= _b_top && _a_top <= _b_bottom;
}

/// @function precise_bbox_prepare(inst_a)
/// @description 计算并缓存 inst_a（子弹）的旋转包围盒，结果写入 global._pbc_l / _pbc_r / _pbc_t / _pbc_b。
///              返回 false 表示实例无效或没有 sprite（不可能碰撞）。
///              给"子弹一帧内要扫描大量敌人"的 Step 用：先把自身包围盒算一次，之后在循环里
///              直接内联比较 _e.bbox_*，避免对每只敌人都调用一次 precise_bbox_collision。
function precise_bbox_prepare(_inst_a) {
    if (is_undefined(_inst_a) || _inst_a == noone) return false;
    if (!instance_exists(_inst_a)) return false;

    var _spr = _inst_a.sprite_index;
    if (_spr < 0) return false;

    var _ax = _inst_a.x;
    var _ay = _inst_a.y;
    var _ang = _inst_a.image_angle;

    if (!variable_global_exists("_pbc_cache")) {
        global._pbc_cache = { id: -1, x: 0, y: 0, ang: 0, spr: -1, l: 0, r: 0, t: 0, b: 0 };
    }
    var _c = global._pbc_cache;

    var _a_left, _a_right, _a_top, _a_bottom;
    if (_c.id == _inst_a && _c.x == _ax && _c.y == _ay && _c.ang == _ang && _c.spr == _spr) {
        _a_left = _c.l; _a_right = _c.r; _a_top = _c.t; _a_bottom = _c.b;
    } else {
        var _bl = sprite_get_bbox_left(_spr);
        var _br = sprite_get_bbox_right(_spr);
        var _bt = sprite_get_bbox_top(_spr);
        var _bb = sprite_get_bbox_bottom(_spr);
        var _xo = sprite_get_xoffset(_spr);
        var _yo = sprite_get_yoffset(_spr);

        var _rad = _ang * pi / 180;
        var _cs = cos(_rad);
        var _sn = sin(_rad);

        var _lx1 = _bl - _xo;
        var _lx2 = _br - _xo;
        var _ly1 = _bt - _yo;
        var _ly2 = _bb - _yo;

        var _x1 = _lx1 * _cs - _ly1 * _sn + _ax;
        var _y1 = _lx1 * _sn + _ly1 * _cs + _ay;

        var _x2 = _lx2 * _cs - _ly1 * _sn + _ax;
        var _y2 = _lx2 * _sn + _ly1 * _cs + _ay;

        var _x3 = _lx2 * _cs - _ly2 * _sn + _ax;
        var _y3 = _lx2 * _sn + _ly2 * _cs + _ay;

        var _x4 = _lx1 * _cs - _ly2 * _sn + _ax;
        var _y4 = _lx1 * _sn + _ly2 * _cs + _ay;

        _a_left = min(min(_x1, _x2), min(_x3, _x4));
        _a_right = max(max(_x1, _x2), max(_x3, _x4));
        _a_top = min(min(_y1, _y2), min(_y3, _y4));
        _a_bottom = max(max(_y1, _y2), max(_y3, _y4));

        _c.id = _inst_a; _c.x = _ax; _c.y = _ay; _c.ang = _ang; _c.spr = _spr;
        _c.l = _a_left; _c.r = _a_right; _c.t = _a_top; _c.b = _a_bottom;
    }

    global._pbc_l = _a_left;
    global._pbc_r = _a_right;
    global._pbc_t = _a_top;
    global._pbc_b = _a_bottom;
    return true;
}
