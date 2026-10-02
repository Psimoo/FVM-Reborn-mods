event_inherited();
plant_id = "haiyang_god";
event_user(0);

// 根据形态切换精灵
if (shape == 0)
    sprite_index = spr_haiyang_god;
else if (shape == 1)
    sprite_index = spr_haiyang_god_1;
else if (shape == 2)
    sprite_index = spr_haiyang_god_2;
else if (shape == 3)
    sprite_index = spr_haiyang_god_3;

attack_anim = 0;
idle_anim = 12;
flash_speed = 5;
is_slowdown = false;

// 三转及以上变为悬浮卡（不占格）
if (shape >= 2)
    plant_type = "gridless";
else
    plant_type = "normal";

// ===== 海洋女神增幅系统 =====
// 增幅倍率 = atk / 100
ocean_buff_value = atk / 100;

// 三类增幅范围的格子列表
ocean_buff_cells_sprayer = [];   // 喷壶类 5x5
ocean_buff_cells_attach = [];    // 附加类 5x1
ocean_buff_cells_coffee = [];    // 咖啡喷壶类 本行

// 刷新标记
ocean_buff_refreshed = false;
ocean_last_col = grid_col;
ocean_last_row = grid_row;
ocean_last_shape = shape;

// 全屏模式标记（终转且场上>=4张时激活）
ocean_fullscreen = false;
ocean_corner_effects = [];

// 初始化全局海洋女神来源列表
if (!variable_global_exists("ocean_god_sources"))
{
    global.ocean_god_sources = ds_list_create();
    global.ocean_buff_dirty = true;
}
if (!variable_global_exists("ocean_corner_effect_owner"))
    global.ocean_corner_effect_owner = noone;

// 添加到全局来源列表
ds_list_add(global.ocean_god_sources, id);
global.ocean_buff_dirty = true;

// 创建特效对象
var eff_spr = spr_haiyang_god_effect;
if (shape == 1)
    eff_spr = spr_haiyang_god_effect_1;
else if (shape == 2)
    eff_spr = spr_haiyang_god_effect_2;
else if (shape == 3)
    eff_spr = spr_haiyang_god_effect_3;

haiyang_effect_obj = instance_create_depth(x, y, 0, obj_haiyang_god_effect);
haiyang_effect_obj.parent_plant = id;
haiyang_effect_obj.sprite_index = eff_spr;
