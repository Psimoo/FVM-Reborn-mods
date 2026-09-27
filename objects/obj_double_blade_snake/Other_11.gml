var bullet_count = 1;
var execute_threshold = 0.25;
var elite_multiplier = 10;
var bullet_spr = spr_shuangrenshe_bullet;
var damage_mult = 2;

if (shape == 1) {
    damage_mult = 3;
    bullet_spr = spr_shuangrenshe_bullet_1;
} else if (shape == 2) {
    damage_mult = 4;
    bullet_spr = spr_shuangrenshe_bullet_2;
}

var y_offsets = [-75];

for (var i = 0; i < bullet_count; i++) {
    var inst = instance_create_depth(x + 40, y + y_offsets[i], depth - 500, obj_double_blade_snake_bullet);
    inst.damage = atk * damage_mult;
    inst.move_speed = 8;
    inst.row = grid_row;
    inst.execute_threshold = execute_threshold;
    inst.elite_multiplier = elite_multiplier;
    inst.sprite_index = bullet_spr;
}
