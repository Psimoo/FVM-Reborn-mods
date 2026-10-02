function mod_buff_init()
{
    global.plant_buff_map = ds_map_create();
    ds_map_set(global.plant_buff_map, "takoyaki", "tracker");
    ds_map_set(global.plant_buff_map, "juxie", "tracker");
    ds_map_set(global.plant_buff_map, "moon_god", "tracker");
    ds_map_set(global.plant_buff_map, "joker", "tracker");
    ds_map_set(global.plant_buff_map, "power_god", "tracker");
    ds_map_set(global.plant_buff_map, "grilled_lizard_pult", "thrower");
    ds_map_set(global.plant_buff_map, "spoon_rabbit", "thrower");
    ds_map_set(global.plant_buff_map, "zhurong", "thrower");
    ds_map_set(global.plant_buff_map, "gaia", "tracker");
    ds_map_set(global.plant_buff_map, "athena", "xiangshui");
    ds_map_set(global.plant_buff_map, "zeus", "xiangshui");
    ds_map_set(global.plant_buff_map, "ice_god", "xiangshui");
    ds_map_set(global.plant_buff_map, "cold_drew", "tracker");
    ds_map_set(global.plant_buff_map, "chocolate_pult", "thrower");
    ds_map_set(global.plant_buff_map, "egg_boiler_pult", "thrower");
    ds_map_set(global.plant_buff_map, "ice_egg_boiler_pult", "thrower");
    ds_map_set(global.plant_buff_map, "salad_pult", "thrower");
    ds_map_set(global.plant_buff_map, "stinky_tofu_pult", "thrower");
    ds_map_set(global.plant_buff_map, "shuangyu", "thrower");
    ds_map_set(global.plant_buff_map, "thor", "thrower");
    ds_map_set(global.plant_buff_map, "ymir", "thrower");
    ds_map_set(global.plant_buff_map, "pan_fried_bun", "thrower");
    ds_map_set(global.plant_buff_map, "rotating_coffee_pot", "sprayer");
    ds_map_set(global.plant_buff_map, "coffee_pot", "sprayer");
    ds_map_set(global.plant_buff_map, "oden_pot", "sprayer");
    ds_map_set(global.plant_buff_map, "shizi", "sprayer");
    ds_map_set(global.plant_buff_map, "poseidon", "sprayer");
    ds_map_set(global.plant_buff_map, "oden_pot", "sprayer");
    ds_map_set(global.plant_buff_map, "sheng_huo", "sprayer");
    ds_map_set(global.plant_buff_map, "beef_hotpot", "sprayer");
    ds_map_set(global.plant_buff_map, "spicy_pot", "sprayer");
    ds_map_set(global.plant_buff_map, "ghost_god", "five_dir");
    ds_map_set(global.plant_buff_map, "rig", "five_dir");
    ds_map_set(global.plant_buff_map, "coal_starfish", "five_dir");
    ds_map_set(global.plant_buff_map, "love_god", "multi_dir");
    ds_map_set(global.plant_buff_map, "tiancheng", "multi_dir");
    ds_map_set(global.plant_buff_map, "war_god", "multi_dir");

    // 附加类（海洋女神5x1范围增幅目标）
    ds_map_set(global.plant_buff_map, "magic_chicken", "attach");
    ds_map_set(global.plant_buff_map, "coke_bomb", "attach");
    ds_map_set(global.plant_buff_map, "xuanfengniu", "attach");
    ds_map_set(global.plant_buff_map, "nizhuanniu", "attach");
    ds_map_set(global.plant_buff_map, "soda_bubble", "attach");
    ds_map_set(global.plant_buff_map, "firework_dragon", "attach");
    ds_map_set(global.plant_buff_map, "hufa_god", "attach");

    // 第二buff类型映射（植物可同时受益于两种buff类型，倍率相乘）
    global.plant_buff_map_2 = ds_map_create();
    ds_map_set(global.plant_buff_map_2, "cold_drew", "xiangshui");
    ds_map_set(global.plant_buff_map_2, "hufa_god", "sprayer");
    ds_map_set(global.plant_buff_map_2, "gaia", "thrower");
}
