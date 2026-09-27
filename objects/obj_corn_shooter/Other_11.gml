var inst = instance_create_depth(x + 60, y - 45, depth - 500, obj_corn_shooter_bullet);

if (shape >= 1)
    inst.sprite_index = spr_corn_shooter_bullet_2;

inst.damage = atk;
inst.move_speed = 8;
inst.row = grid_row;
