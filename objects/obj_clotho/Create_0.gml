event_inherited();
plant_id = "clotho";
event_user(0);
sprite_index = spr_clotho;

if (shape == 1)
    sprite_index = spr_clotho_1;
else if (shape == 2)
    sprite_index = spr_clotho_2;
else if (shape == 3)
    sprite_index = spr_clotho_3;

attack_anim = 0;
idle_anim = 35;
flash_speed = 5;
plant_type = "coffee";
is_slowdown = false;
current_hp = hp;
transform_timer = idle_anim * flash_speed;
var spr = spr_clotho_effect;

if (shape == 2)
    spr = spr_clotho_effect_1;

if (shape == 3)
    spr = spr_clotho_effect_2;

clotho_effect_obj = instance_create_depth(x, y - 30, 0, obj_clotho_effect);
clotho_effect_obj.parent_plant = id;
clotho_effect_obj.sprite_index = spr;
gold_cards = ["gaia", "aurora", "zhurong", "rig", "ghost_god", "odin", "sun_god", "moon_god", "thor", "war_god", "hera", "poseidon", "love_god", "zeus", "ice_god", "fire_god", "water_god", "power_god", "sheng_huo", "ymir", "joker", "brahma", "time_god", "firework_dragon_real", "save_god", "xiangshui_god", "fengrao_god", "houyi_god", "heian_god", "guangming_god", "hundun_god", "shennong_god", "hufa_god", "haiyang_god", "chongsheng_god", "gongjiang_god"];
