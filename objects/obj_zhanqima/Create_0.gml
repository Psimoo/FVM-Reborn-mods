event_inherited();
plant_id = "zhanqima";
obj_type = object_index;
event_user(0);

attack_anim = 0;
flash_speed = 5;
plant_type = (shape >= 1) ? "gridless" : "normal";
is_slowdown = false;

if (shape == 0) sprite_index = spr_zhanqima;
else if (shape == 1) sprite_index = spr_zhanqima_1;
else sprite_index = spr_zhanqima_2;
idle_anim = sprite_get_number(sprite_index) - 1;

// 注册表中的攻击力就是倍率百分比（例如 138 = 1.38 倍）。
zhanqima_buff_value = atk / 100;

// 0转、1转有脚底光圈特效；二转用全屏四角特效，不需要脚底特效
zhanqima_effect_obj = noone;
if (shape < 2)
{
    zhanqima_effect_obj = instance_create_depth(x, y, -3000, obj_zhanqima_effect);
    zhanqima_effect_obj.parent_plant = id;
    if (shape == 0) zhanqima_effect_obj.sprite_index = spr_zhanqima_effect;
    else zhanqima_effect_obj.sprite_index = spr_zhanqima_effect_1;
    zhanqima_effect_obj.image_xscale = 1.7;
    zhanqima_effect_obj.image_yscale = 1.7;
}

// 二转全屏四角特效（对齐海洋女神模式）
if (shape >= 2)
{
    zhanqima_fullscreen = false;
    zhanqima_corner_effects = [];
    if (!variable_global_exists("zhanqima_corner_effect_owner"))
        global.zhanqima_corner_effect_owner = noone;
}

if (!variable_global_exists("zhanqima_sources"))
    global.zhanqima_sources = ds_list_create();
ds_list_add(global.zhanqima_sources, id);
if (variable_global_exists("buff_apply_id")) global.buff_apply_id++;
