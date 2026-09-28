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

// 边路补偿机制：越界的子弹改为中路（自身行），确保始终2发/3发
// 基础：上路(-1) + 中路(0)，上路越界则改为中路 → 2发中路
// >7只：增加下路(+1)，下路越界则改为中路 → 中路多1发
var bullet_rows = [];

// 第一行：上路，越界则中路
if (grid_row - 1 >= 0)
    bullet_rows[0] = -1;
else
    bullet_rows[0] = 0;

// 第二行：中路（自身所在行）
bullet_rows[1] = 0;

// 场上炎帝>7只时，增加第三行
var shennong_count = instance_number(obj_shennong_god);
if (shennong_count > 7)
{
    // 下路，越界则中路
    if (grid_row + 1 < global.grid_rows)
        bullet_rows[2] = 1;
    else
        bullet_rows[2] = 0;
}

for (var i = 0; i < array_length(bullet_rows); i++)
{
    var row_off = bullet_rows[i];
    var target_row = grid_row + row_off;

    var start_x = col0_x - 40;
    if (row_off == 0 && i != 1) {
        if (i == 0)
            start_x -= 20;
        else
            start_x -= 40;
    }
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
