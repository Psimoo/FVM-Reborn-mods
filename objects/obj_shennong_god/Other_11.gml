// ========== 炎帝：发射水平轨迹子弹 ==========
// 基础：召唤2只子弹，沿2条固定行轨迹移动（上路、中路，从左向右飞行）
// 场上至少8张炎帝时：增加下路轨迹，变为3行攻击

var col0_x = get_world_position_from_grid(0, 0).x;
var col_last_x = get_world_position_from_grid(global.grid_cols - 1, 0).x;
var grid_cell_y = global.grid_cell_size_y;
var middle_y_offset = 30; // 子弹y偏移

// 根据shape计算伤害倍率
var dmg_mul = 1;
var ash_kill = true; // 击杀产生灰烬

switch (shape)
{
    case 0:
        dmg_mul = 1;
        break;
    case 1:
        dmg_mul = 1.3; // 三转攻击力+30%
        break;
    default:
        dmg_mul = 1.6; // 四转攻击力+60%
        break;
}

// 基础2行轨迹：上路、中路（从左向右）
var bullet_rows = [-1, 0];

// 大于7张（即至少8张）时，增加下路轨迹
var shennong_count = instance_number(obj_shennong_god);
if (shennong_count >= 8)
{
    bullet_rows[array_length(bullet_rows)] = 1;  // 下路
}

for (var i = 0; i < array_length(bullet_rows); i++)
{
    var row_off = bullet_rows[i];
    var target_row = grid_row + row_off;

    // 边界检查：如果行超出范围则跳过
    if (target_row < 0 || target_row >= global.grid_rows)
        continue;

    var start_x = col0_x - 40;
    var start_y = global.grid_offset_y + (grid_cell_y * target_row) + middle_y_offset;

    var inst = instance_create_depth(start_x, start_y, depth - 500, obj_shennong_god_bullet_h);
    inst.damage = atk * dmg_mul;
    inst.move_speed = 6;
    inst.row = target_row;
    inst.target_row = target_row;
    inst.shape = shape;
    inst.ash_kill = ash_kill;
    inst.target_type = "all"; // 可攻击所有类型

    // 设置子弹精灵
    if (shape == 0)
        inst.sprite_index = spr_shennong_god_bullet;
    else if (shape == 1)
        inst.sprite_index = spr_shennong_god_bullet_1;
    else
        inst.sprite_index = spr_shennong_god_bullet_2;
}

audio_play_sound(snd_shot, 0, 0);
