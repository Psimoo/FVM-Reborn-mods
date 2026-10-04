damage = 0;
move_speed = 0; // 向下移动速度（正值向下）
damage_type = "pierce";
target_type = "all";
timer = 0;
shape = 0;
hitted_enemy = ds_list_create();
hittable_types = get_hittable_enemy_types(target_type);
hit_tick = 0;
ash_kill = false;
image_xscale = 1.5;
image_yscale = 1.5;

// 竖向子弹的列范围和位置
start_col = 8;  // 起始列（第9列）
middle_col = 7; // 中间列（第8列，受击2次）
end_col = 6;    // 结束列（第7列）
current_col = 8;
col_hit_count = ds_map_create(); // 每列的命中计数
phase = 0; // 0: 向右->左移动, 1: 向左->右移动 (完成半振荡)
horizontal_speed = 2; // 水平移动速度
