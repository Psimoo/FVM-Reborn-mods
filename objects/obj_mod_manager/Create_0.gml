persistent = true;
noticed = false;
mod_slots_init();
mod_skill_init();
mod_weapons_init();
mod_info_island_init();
mod_shop_init();
cross_server_shop_init();
mod_maps_init();
mod_enemy_init();
gods_goods_registry_init();
gods_shop_init();


mod_boss_init();
mod_cards_init();
mod_buff_init();
zhiyumiao_config_init();

// 所有卡牌（原版 slots_init + mod mod_slots_init）均已注册进 player_deck 后，清理存档中已不存在的孤儿卡
cleanup_orphan_cards();

// 护法神情报岛注册（双保险）
if (variable_global_exists("info_island") && ds_exists(global.info_island, ds_type_map))
{
    if (!ds_map_exists(global.info_island, "hufa_god"))
    {
        register_card_info_island("hufa_god", "基础能力：全屏索敌追踪穿透弹，攻击陆、空鼠军，\n秒杀非精英鼠，15%概率定身1.5秒，命中后继续直线飞出。\n *星级影响[攻击力]，技能影响[攻击间隔]。\n\n三转能力：攻击力提升，魂系老鼠1.8倍伤害。\n\n四转能力：追加地鼠目标，攻击力大幅提升。\n\n终转能力：对BOSS造成基础形态攻击力2倍伤害。");
    }
}
