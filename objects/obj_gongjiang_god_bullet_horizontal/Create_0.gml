// 工匠神水平子弹 - 创建事件
// 路径状态机：OUTBOUND_POINT_1(1) -> OUTBOUND_POINT_2(2) -> RETURN(3) -> DONE(4)
// 记录起点快照，卡片移动或死亡后仍按快照返回（不依赖卡片存在）
event_inherited();
damage = 0;
move_speed = 8;
damage_type = "normal";
target_type = "normal";
hittable_types = get_hittable_enemy_types(target_type);
hit_tick = 0;

// 已命中敌人去重列表，避免同一发子弹重复伤害同一目标
hitted_enemy = ds_list_create();

// 属主与起点快照
origin_card_id = noone;
start_x = 0;
start_y = 0;

// 路径点
wp1_x = 0;
wp1_y = 0;
wp2_x = 0;
wp2_y = 0;

// 路径状态
phase = 1;

// 形态与定身（三转+）
shape = 0;
pin_chance = 0;
pin_duration = 90;

// 河豚毒素（三转+）
poison_chance = 0;
poison_spr = -1;

// 兜底寿命
max_life_frames = 900;
life_frames = 0;

// 视觉 1.8 倍，碰撞遮罩由父对象 BeginStep 重置为未缩放
image_xscale = 1.8;
image_yscale = 1.8;
