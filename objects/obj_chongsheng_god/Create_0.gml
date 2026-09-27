event_inherited();
plant_id = "chongsheng_god";
obj_type = object_index;
event_user(0);

if (shape == 0)
    sprite_index = spr_chongsheng_god;
else if (shape == 1)
    sprite_index = spr_chongsheng_god_1;
else if (shape == 2)
    sprite_index = spr_chongsheng_god_2;
else if (shape == 3)
    sprite_index = spr_chongsheng_god_3;

flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
image_speed = 0;

idle_anim = 16;
attack_anim = 17;

revive_count = 0;
revive_triggered = false;
buff_applied = false;

grid_range_col = 2;
grid_range_row = 2;
if (shape == 3) {
    grid_range_col = 3;
    grid_range_row = 2;
}

revive_limit = 4;
if (shape == 1) revive_limit = 6;
else if (shape == 2) revive_limit = 6;
else if (shape == 3) revive_limit = 9;

chongsheng_reduction = 0.3;
var _ud = get_plant_data_with_skill(plant_id, shape, current_level, skill);
if (_ud != undefined && ds_map_exists(_ud, "chongsheng_reduction")) {
    chongsheng_reduction = _ud[? "chongsheng_reduction"];
}

buff_duration = cycle;

// 种下时释放 effect_2 特效
var _eff2_spr = spr_chongsheng_god_effect_0_2;
if (shape == 1) _eff2_spr = spr_chongsheng_god_effect_1_2;
else if (shape == 2) _eff2_spr = spr_chongsheng_god_effect_2_2;
else if (shape == 3) _eff2_spr = spr_chongsheng_god_effect_3_2;

var _eff2 = instance_create_depth(x, y, depth - 100, obj_card_heal_effect);
_eff2.sprite_index = _eff2_spr;
