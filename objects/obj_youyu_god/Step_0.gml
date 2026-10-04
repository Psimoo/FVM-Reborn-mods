event_inherited();
var _frames = sprite_get_number(sprite_index);
if (_frames > 1) image_index = (image_index + 0.25) mod _frames;

attack_timer++;
if (attack_timer >= max(1, cycle) && variable_global_exists("enemy_by_type")) {
    var _target = noone; var _best = 1000000000; var _types = ["normal", "air", "invisible"];
    for (var _t = 0; _t < array_length(_types); _t++) {
        if (!variable_struct_exists(global.enemy_by_type, _types[_t])) continue;
        var _list = global.enemy_by_type[$ _types[_t]];
        for (var _i = 0; _i < array_length(_list); _i++) {
            var _e = _list[_i];
            if (instance_exists(_e) && _e.hp > 0 && point_distance(x,y,_e.x,_e.y) < _best) {
                _target = _e;
                _best = point_distance(x,y,_e.x,_e.y);
            }
        }
    }
    if (instance_exists(_target)) {
        var _bullet_spr = spr_youyu_god_bullet;
        if (shape == 1) _bullet_spr = spr_youyu_god_bullet_1;
        else if (shape >= 2) _bullet_spr = spr_youyu_god_bullet_2;

        var _my_row = 0;
        if (variable_instance_exists(self, "grid_row")) _my_row = grid_row;

        // ========== shape0 / shape1: 八方向各一发子弹 ==========
        // shape0: 需章鱼烧底座，8方向射击，无反弹
        // shape1: 无需底座，8方向射击，无反弹
        for (var _n = 0; _n < 8; _n++) {
            var _angle = _n * 45;
            var _b = instance_create_depth(x + 35, y - 5, depth - 20, obj_youyu_god_bullet);
            _b.damage = atk;
            _b.base_atk = atk;
            _b.target_id = noone;
            _b.hittable_types = _types;
            _b.move_x = lengthdir_x(_b.move_speed, _angle);
            _b.move_y = lengthdir_y(_b.move_speed, _angle);
            _b.image_angle = _angle;
            _b.sprite_index = _bullet_spr;
            _b.row = _my_row;
            // shape2：中路水平方向子弹（0° 和 180°）可经过火盆/火神/金牛增幅
            if (shape >= 2 && (_n == 0 || _n == 4)) {
                _b.can_fire_buff = true;
            } else {
                _b.can_fire_buff = false;
            }
        }

        // ========== shape2: 前后路各增加一发水平子弹 ==========
        if (shape >= 2) {
            var _grid_size_y = 64;
            if (variable_global_exists("grid_cell_size_y")) _grid_size_y = global.grid_cell_size_y;

            // 前路（上一行）向右发射
            var _b_front_r = instance_create_depth(x + 35, y - 5 - _grid_size_y, depth - 20, obj_youyu_god_bullet);
            _b_front_r.damage = atk;
            _b_front_r.base_atk = atk;
            _b_front_r.target_id = noone;
            _b_front_r.hittable_types = _types;
            _b_front_r.move_x = _b_front_r.move_speed;
            _b_front_r.move_y = 0;
            _b_front_r.image_angle = 0;
            _b_front_r.sprite_index = _bullet_spr;
            _b_front_r.row = _my_row - 1;
            _b_front_r.can_fire_buff = false;

            // 后路（下一行）向右发射
            var _b_back_r = instance_create_depth(x + 35, y - 5 + _grid_size_y, depth - 20, obj_youyu_god_bullet);
            _b_back_r.damage = atk;
            _b_back_r.base_atk = atk;
            _b_back_r.target_id = noone;
            _b_back_r.hittable_types = _types;
            _b_back_r.move_x = _b_back_r.move_speed;
            _b_back_r.move_y = 0;
            _b_back_r.image_angle = 0;
            _b_back_r.sprite_index = _bullet_spr;
            _b_back_r.row = _my_row + 1;
            _b_back_r.can_fire_buff = false;

            // 前路（上一行）向左发射
            var _b_front_l = instance_create_depth(x + 35, y - 5 - _grid_size_y, depth - 20, obj_youyu_god_bullet);
            _b_front_l.damage = atk;
            _b_front_l.base_atk = atk;
            _b_front_l.target_id = noone;
            _b_front_l.hittable_types = _types;
            _b_front_l.move_x = -_b_front_l.move_speed;
            _b_front_l.move_y = 0;
            _b_front_l.image_angle = 180;
            _b_front_l.sprite_index = _bullet_spr;
            _b_front_l.row = _my_row - 1;
            _b_front_l.can_fire_buff = false;

            // 后路（下一行）向左发射
            var _b_back_l = instance_create_depth(x + 35, y - 5 + _grid_size_y, depth - 20, obj_youyu_god_bullet);
            _b_back_l.damage = atk;
            _b_back_l.base_atk = atk;
            _b_back_l.target_id = noone;
            _b_back_l.hittable_types = _types;
            _b_back_l.move_x = -_b_back_l.move_speed;
            _b_back_l.move_y = 0;
            _b_back_l.image_angle = 180;
            _b_back_l.sprite_index = _bullet_spr;
            _b_back_l.row = _my_row + 1;
            _b_back_l.can_fire_buff = false;
        }
    }
    attack_timer = 0;
}
