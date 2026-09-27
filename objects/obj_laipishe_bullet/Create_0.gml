// 赖皮蛇海胆子弹 - 创建事件
// 三段式弹道：卡片→右下角→沿最右列向上→右上角→返回卡片销毁
damage = 0;
move_speed = 6;
target_type = "track";
damage_type = "normal";
hittable_types = get_hittable_enemy_types(target_type);

// 已命中的敌人ID列表，避免同一发子弹重复伤害同一目标
hitted_enemy = ds_list_create();

// 属主卡片引用
owner_card = noone;
bullet_shape = 0;

// 三段式路径状态机
// phase 1: 卡片位置 → 右下角(最右列, 最后一行)
// phase 2: 右下角 → 右上角(最右列, 第一行)  沿最右列从下往上
// phase 3: 右上角 → 返回卡片位置 → 销毁
phase = 1;

// 路径起点（卡片位置）
start_x = 0;
start_y = 0;

// 路径点1：右下角
wp1_x = 0;
wp1_y = 0;
// 路径点2：右上角
wp2_x = 0;
wp2_y = 0;

// 最大存活帧数兜底
max_life_frames = 900;
life_frames = 0;

// 视觉与碰撞放大 1.8 倍（对齐披萨子弹）
image_xscale = 1.8;
image_yscale = 1.8;
