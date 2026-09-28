/// @function is_eternal_gacha_mode()
/// @desc 判断是否为抽卡模式难度（星际抽卡 或 欧皇抽卡）
/// @return {bool}
function is_eternal_gacha_mode() {
    return global.difficulty == 6 || global.difficulty == 7;
}

/// @function is_lucky_gacha_mode()
/// @desc 判断是否为欧皇抽卡难度
/// @return {bool}
function is_lucky_gacha_mode() {
    return global.difficulty == 7;
}

/// @function gacha_get_excluded_cards()
/// @desc 获取从抽卡奖励中排除的卡片ID列表（这些卡只通过关卡奖励获得）
/// @return {array}
function gacha_get_excluded_cards() {
    return [
        "wooden_plate",       // 木盘子
        "wooden_cork",        // 木塞子
        "cotton_candy",       // 棉花糖
        "sausage",            // 香肠
        "oil_lamp",           // 油灯
        "soda_bubble",        // 苏打气泡
        "tang_hu_lu",         // 糖葫芦炮弹
        "double_water_pipe"   // 双向水管
    ];
}

/// @function gacha_is_excluded_card(card_id)
/// @desc 判断是否为抽卡排除卡
/// @param {string} card_id
/// @return {bool}
function gacha_is_excluded_card(card_id) {
    var excluded = gacha_get_excluded_cards();
    return array_get_index(excluded, card_id) != -1;
}

/// @function gacha_is_gold_card(card_id)
/// @desc 判断是否为金卡（形态0有 is_gold 标记，或诸神商店中的卡片）
/// @param {string} card_id
/// @return {bool}
function gacha_is_gold_card(card_id) {
    // 方式1：形态0有 is_gold 标记
    var shape_data = deck_get_card_data(card_id, 0);
    if (shape_data != noone) {
        if (ds_map_exists(shape_data, "is_gold")) {
            if (shape_data[? "is_gold"] == 1) return true;
        }
    }

    // 方式2：诸神商店中的卡片
    if (ds_map_exists(global.gods_goods_map, card_id)) {
        var gods_data = global.gods_goods_map[? card_id];
        if (variable_struct_exists(gods_data, "type") && gods_data[$ "type"] == "card") {
            return true;
        }
    }

    return false;
}

/// @function gacha_is_zodiac_card(card_id)
/// @desc 判断是否为生肖卡（商店价格 >= 80000 的卡片类商品）
/// @param {string} card_id
/// @return {bool}
function gacha_is_zodiac_card(card_id) {
    // 先排除金卡
    if (gacha_is_gold_card(card_id)) return false;

    // 检查是否在商店中
    if (!ds_map_exists(global.goods_map, card_id)) return false;

    var goods_data = global.goods_map[? card_id];
    if (!variable_struct_exists(goods_data, "type")) return false;
    if (goods_data[$ "type"] != "card") return false;

    var cost = real(goods_data[$ "cost"]);
    return cost >= 80000;
}

/// @function gacha_is_mod_weapon(weapon_id)
/// @desc 判断是否为MOD武器（通过是否在mod_weapons_init中注册来判断）
/// 这里用武器是否在 weapon_pool 中且不在普通商店武器列表中来判断
/// 简化方式：检查武器是否在商店中，如果不在商店中且在weapon_pool中则为MOD武器
/// 更准确的方式：检查武器id是否为已知MOD武器
/// @param {string} weapon_id
/// @return {bool}
function gacha_is_mod_weapon(weapon_id) {
    // MOD武器列表（来自mod_weapons_init.gml）
    var mod_weapons = [
        "zeus_bolt",
        "hades_scythe",
        "gods_shield",
        "master_shield",
        "star_wand",
        "rose_shield",
        "aladdin_lamp"
    ];
    return array_get_index(mod_weapons, weapon_id) != -1;
}

/// @function gacha_is_mod_gem(gem_id)
/// @desc 判断是否为MOD宝石
/// @param {string} gem_id
/// @return {bool}
function gacha_is_mod_gem(gem_id) {
    // MOD宝石列表（来自mod_weapons_init.gml）
    // 注：master_shield_gem_1/3/4 与 divine_blessing/protect/holy_gem 同名同功能，
    // 已移除前者防止重复抽取（前者obj为noone且不在商店中）
    var mod_gems = [
        "zeus_shadow_gem",
        "zeus_power_gem",
        "zeus_anger_gem",
        "ghost_strike_gem",
        "ghost_spark_gem",
        "ghost_pact_gem",
        "gods_shield_gem_1",
        "gods_shield_gem_2",
        "gods_shield_gem_3",
        "gods_shield_gem_4",
        "master_shield_gem_2",
        "divine_blessing_gem",
        "divine_protect_gem",
        "divine_holy_gem",
        "star_wand_gem_1",
        "star_wand_gem_2",
        "star_wand_gem_3",
        "star_wand_gem_4",
        "star_wand_gem_5",
        "rose_shield_gem_1",
        "rose_shield_gem_2",
        "rose_shield_gem_3",
        "rose_shield_gem_4",
        "rose_shield_gem_5",
        "aladdin_lamp_gem_1",
        "aladdin_lamp_gem_2",
        "aladdin_lamp_gem_3",
        "aladdin_lamp_gem_4",
        "aladdin_lamp_gem_5"
    ];
    return array_get_index(mod_gems, gem_id) != -1;
}

/// @function gacha_get_weapon_icon(weapon_id)
/// @desc 获取武器图标精灵
/// @param {string} weapon_id
/// @return {sprite}
function gacha_get_weapon_icon(weapon_id) {
    if (!ds_map_exists(global.weapon_pool, weapon_id)) return -1;
    var weapon_data = global.weapon_pool[? weapon_id];
    if (variable_struct_exists(weapon_data, "icon")) return weapon_data[$ "icon"];
    return -1;
}

/// @function gacha_get_card_display_name(card_id)
/// @desc 获取卡片显示名称，优先从商店数据获取
/// @param {string} card_id
/// @return {string}
function gacha_get_card_display_name(card_id) {
    // 先从普通商店获取
    if (ds_map_exists(global.goods_map, card_id)) {
        var goods_data = global.goods_map[? card_id];
        if (variable_struct_exists(goods_data, "display_name")) {
            return goods_data.display_name;
        }
    }
    // 再从诸神商店获取
    if (ds_map_exists(global.gods_goods_map, card_id)) {
        var gods_data = global.gods_goods_map[? card_id];
        if (variable_struct_exists(gods_data, "display_name")) {
            return gods_data.display_name;
        }
    }
    // 兜底：返回卡片ID
    return card_id;
}

/// @function gacha_get_weapon_name(weapon_id)
/// @desc 获取武器名称
/// @param {string} weapon_id
/// @return {string}
function gacha_get_weapon_name(weapon_id) {
    if (!ds_map_exists(global.weapon_pool, weapon_id)) return "未知武器";
    var weapon_data = global.weapon_pool[? weapon_id];
    if (variable_struct_exists(weapon_data, "name")) return weapon_data[$ "name"];
    return "未知武器";
}

/// @function gacha_get_gem_icon(gem_id)
/// @desc 获取宝石图标精灵
/// @param {string} gem_id
/// @return {sprite}
function gacha_get_gem_icon(gem_id) {
    if (!ds_map_exists(global.gems_pool, gem_id)) return -1;
    var gem_data = global.gems_pool[? gem_id];
    if (variable_struct_exists(gem_data, "icon")) return gem_data[$ "icon"];
    return -1;
}

/// @function gacha_get_gem_name(gem_id)
/// @desc 获取宝石名称
/// @param {string} gem_id
/// @return {string}
function gacha_get_gem_name(gem_id) {
    if (!ds_map_exists(global.gems_pool, gem_id)) return "未知宝石";
    var gem_data = global.gems_pool[? gem_id];
    if (variable_struct_exists(gem_data, "name")) return gem_data[$ "name"];
    return "未知宝石";
}

/// @function gacha_get_gem_weapons(gem_id)
/// @desc 获取宝石对应的武器列表
/// @param {string} gem_id
/// @return {array}
function gacha_get_gem_weapons(gem_id) {
    if (!ds_map_exists(global.gems_pool, gem_id)) return [];
    var gem_data = global.gems_pool[? gem_id];
    if (variable_struct_exists(gem_data, "allowed_weapons")) {
        return gem_data[$ "allowed_weapons"];
    }
    return [];
}

/// @function gacha_pick_random_reward()
/// @desc 按类别权重随机抽取一个奖励（卡片/武器/宝石）
/// 类别权重：金卡 5%、生肖卡 25%、普通卡 69%、MOD武器 0.5%、宝石 0.5%
/// 抽取规则：
/// 1. 卡片：未拥有时抽0形态，已拥有时抽下一形态，满形态不进候选池
/// 2. 武器：仅MOD武器，未拥有时可抽，已拥有不进候选池
/// 3. 宝石：仅MOD宝石，拥有对应武器时可抽，已拥有不进候选池
/// @return {struct} 包含 reward_type、id、shape 的结构体
function gacha_pick_random_reward() {
    var gold_candidates = [];
    var zodiac_candidates = [];
    var normal_candidates = [];
    var weapon_candidates = [];
    var gem_candidates = [];

    // === 卡片候选池 ===
    for (var i = 0; i < ds_list_size(global.player_deck); i += 2) {
        var card_id = global.player_deck[| i];

        // 跳过抽卡排除的卡片（只能通过关卡奖励获得）
        if (gacha_is_excluded_card(card_id)) continue;

        var current_shape = -1;
        var target_shape = 0;

        if (is_card_unlocked(card_id)) {
            var info = get_card_info_simple(card_id);
            current_shape = info.shape;
            target_shape = current_shape + 1;
        }

        if (get_plant_shape_data(card_id, target_shape) == undefined) {
            continue;
        }

        var candidate = {
            reward_type: "card",
            id: card_id,
            shape: target_shape
        };

        if (gacha_is_gold_card(card_id)) {
            array_push(gold_candidates, candidate);
        } else if (gacha_is_zodiac_card(card_id)) {
            array_push(zodiac_candidates, candidate);
        } else {
            array_push(normal_candidates, candidate);
        }
    }

    // === MOD武器候选池 ===
    var weapon_keys = [];
    ds_map_keys_to_array(global.weapon_pool, weapon_keys);
    for (var wi = 0; wi < array_length(weapon_keys); wi++) {
        var weapon_id = weapon_keys[wi];
        if (!gacha_is_mod_weapon(weapon_id)) continue;
        if (is_weapon_unlocked(weapon_id)) continue; // 已拥有不进池
        array_push(weapon_candidates, {
            reward_type: "weapon",
            id: weapon_id,
            shape: 0
        });
    }

    // === MOD宝石候选池 ===
    var gem_keys = [];
    ds_map_keys_to_array(global.gems_pool, gem_keys);
    for (var gi = 0; gi < array_length(gem_keys); gi++) {
        var gem_id = gem_keys[gi];
        if (!gacha_is_mod_gem(gem_id)) continue;
        if (is_gem_unlocked(gem_id)) continue; // 已拥有不进池

        // 必须拥有对应武器才能抽
        var allowed_weapons = gacha_get_gem_weapons(gem_id);
        var has_weapon = false;
        for (var awi = 0; awi < array_length(allowed_weapons); awi++) {
            if (is_weapon_unlocked(allowed_weapons[awi])) {
                has_weapon = true;
                break;
            }
        }
        if (!has_weapon) continue;

        array_push(gem_candidates, {
            reward_type: "gem",
            id: gem_id,
            shape: 0
        });
    }

    // === 按权重选择类别 ===
    // 星际抽卡（难度6）：金卡5%、生肖20%、普通74%、武器0.5%、宝石0.5%
    // 欧皇抽卡（难度7）：金卡50%、生肖25%、普通20%、武器2.5%、宝石2.5%
    var gold_weight = 5;
    var zodiac_weight = 20;
    var normal_weight = 74;
    var weapon_weight = 0.5;
    var gem_weight = 0.5;

    if (is_lucky_gacha_mode()) {
        gold_weight = 50;
        zodiac_weight = 25;
        normal_weight = 20;
        weapon_weight = 2.5;
        gem_weight = 2.5;
    }

    // 如果某个类别候选为空，将其权重分配给其他类别（按比例）
    var total_weight = 0;
    var has_gold = array_length(gold_candidates) > 0;
    var has_zodiac = array_length(zodiac_candidates) > 0;
    var has_normal = array_length(normal_candidates) > 0;
    var has_weapon = array_length(weapon_candidates) > 0;
    var has_gem = array_length(gem_candidates) > 0;

    if (has_gold) total_weight += gold_weight;
    if (has_zodiac) total_weight += zodiac_weight;
    if (has_normal) total_weight += normal_weight;
    if (has_weapon) total_weight += weapon_weight;
    if (has_gem) total_weight += gem_weight;

    // 全部为空时走兜底
    if (total_weight <= 0) {
        return gacha_pick_fallback_reward();
    }

    var roll = random(total_weight);
    var acc = 0;
    var selected_type = "normal";

    if (has_gold) {
        acc += gold_weight;
        if (roll < acc) {
            selected_type = "gold";
        }
    }
    if (selected_type == "normal" && has_zodiac) {
        acc += zodiac_weight;
        if (roll < acc) {
            selected_type = "zodiac";
        }
    }
    if (selected_type == "normal" && has_weapon) {
        acc += weapon_weight;
        if (roll < acc) {
            selected_type = "weapon";
        }
    }
    if (selected_type == "normal" && has_gem) {
        acc += gem_weight;
        if (roll < acc) {
            selected_type = "gem";
        }
    }

    // 根据选中的类型获取候选池
    var selected_pool = normal_candidates;
    if (selected_type == "gold") selected_pool = gold_candidates;
    else if (selected_type == "zodiac") selected_pool = zodiac_candidates;
    else if (selected_type == "weapon") selected_pool = weapon_candidates;
    else if (selected_type == "gem") selected_pool = gem_candidates;

    // 从选中的池中随机抽取
    if (array_length(selected_pool) == 0) {
        return gacha_pick_fallback_reward();
    }

    return selected_pool[irandom(array_length(selected_pool) - 1)];
}

/// @function gacha_pick_fallback_reward()
/// @desc 兜底奖励：当所有卡片都达到最大形态时，随机一张卡提升等级
/// @return {struct} 包含 reward_type、id、shape 和 fallback 标记的结构体
function gacha_pick_fallback_reward() {
    var all_cards = [];
    for (var i = 0; i < ds_list_size(global.player_deck); i += 2) {
        var card_id = global.player_deck[| i];
        if (gacha_is_excluded_card(card_id)) continue;
        if (is_card_unlocked(card_id)) {
            var info = get_card_info_simple(card_id);
            array_push(all_cards, {
                reward_type: "card",
                id: card_id,
                shape: info.max_shape
            });
        }
    }

    if (array_length(all_cards) == 0) {
        // 极端情况：一张卡都没有，返回小火炉0形态
        return {
            reward_type: "card",
            id: "small_fire",
            shape: 0,
            fallback: true
        };
    }

    var result = all_cards[irandom(array_length(all_cards) - 1)];
    result.fallback = true;
    return result;
}

/// @function gacha_init_reward()
/// @desc 初始化抽卡奖励全局变量
function gacha_init_reward() {
    if (is_eternal_gacha_mode()) {
        global.gacha_reward = {
            reward_type: "card",
            id: "",
            shape: 0,
            received: false
        };
    }
}
