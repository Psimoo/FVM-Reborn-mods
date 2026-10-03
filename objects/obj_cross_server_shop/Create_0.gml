image_speed = 0;
image_xscale = 10;
image_yscale = 10;
is_closing = false;
selected_item = -1;
current_page = 1;
shop_type = 1;
exchange_cards = [
    "star_wand", "rose_shield", "aladdin_lamp",
    "star_wand_gem_1", "star_wand_gem_2", "star_wand_gem_3", "star_wand_gem_4", "star_wand_gem_5",
    "rose_shield_gem_1", "rose_shield_gem_2", "rose_shield_gem_3", "rose_shield_gem_4", "rose_shield_gem_5",
    "aladdin_lamp_gem_1", "aladdin_lamp_gem_2", "aladdin_lamp_gem_3", "aladdin_lamp_gem_4", "aladdin_lamp_gem_5",
    "zhanqima_1", "zhanqima_2", "hongliukaochuan_1", "hongliukaochuan_2"
];
silver_cards = [
    "baibianshe", "double_blade_snake", "laipishe", "spoon_rabbit", "magic_chicken", "xuanfengniu",
    "zhanqima", "hongliukaochuan", "master_shield", "hades_scythe", "zeus_bolt",
    "divine_blessing_gem", "divine_protect_gem", "divine_holy_gem",
    "ghost_strike_gem", "ghost_spark_gem", "ghost_pact_gem",
    "zeus_shadow_gem", "zeus_power_gem", "zeus_anger_gem"
];

// 动态计算总页数（每页16个商品）
var _cards = shop_type == 0 ? exchange_cards : silver_cards;
total_pages = max(1, ceil(array_length(_cards) / 16));
