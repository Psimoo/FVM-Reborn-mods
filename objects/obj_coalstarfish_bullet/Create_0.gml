damage = 0
move_speed = 0
y_move_speed = 0
row = 0
col = 0
damage_type = "normal"
target_type = "normal"
b_type = 0
burnt = 0
bounced = false
image_xscale = 1.5;
image_yscale = 1.5;
hittable_types = get_hittable_enemy_types(target_type);
// 碰撞判定降频：海星子弹单独用 3 帧一次（其它子弹用 global.bullet_hit_interval，默认 2）
hit_interval = 3;
hit_tick = 0;