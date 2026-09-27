function mod_maps_init()
{
    register_map("cross_server",
    {
        map_name: "跨服远征",
        map_sprite: spr_mod_cs_bg,
        levels_data: [
        {
            id: "ancient_castle_0",
            name: "古堡初探",
            level_file: "cross/castle-0.json",
            hard_level_file: "cross/castle-0.json",
            level_sprite: spr_mod_ancient_castle_0,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "none",
            rewards: []
        },
        {
            id: "ancient_castle_1",
            name: "古堡一障",
            level_file: "cross/castle-1.json",
            hard_level_file: "cross/castle-1.json",
            level_sprite: spr_mod_ancient_castle_1,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_0",
            rewards: []
        },
        {
            id: "ancient_castle_2",
            name: "古堡二子",
            level_file: "cross/castle-2.json",
            hard_level_file: "cross/castle-2.json",
            level_sprite: spr_mod_ancient_castle_2,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_1",
            rewards: []
        },
        {
            id: "ancient_castle_3",
            name: "古堡三轮",
            level_file: "cross/castle-3.json",
            hard_level_file: "cross/castle-3.json",
            level_sprite: spr_mod_ancient_castle_3,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_2",
            rewards: []
        },
        {
            id: "ancient_castle_4",
            name: "古堡四影",
            level_file: "cross/castle-4.json",
            hard_level_file: "cross/castle-4.json",
            level_sprite: spr_mod_ancient_castle_4,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_3",
            rewards: []
        },
        {
            id: "ancient_castle_5",
            name: "古堡五崩",
            level_file: "cross/castle-5.json",
            hard_level_file: "cross/castle-5.json",
            level_sprite: spr_mod_ancient_castle_5,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_4",
            rewards: []
        },
        {
            id: "ancient_castle_6",
            name: "古堡六阶",
            level_file: "cross/castle-6.json",
            hard_level_file: "cross/castle-6.json",
            level_sprite: spr_mod_ancient_castle_6,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_5",
            rewards: []
        },
        {
            id: "ancient_castle_7",
            name: "古堡终破",
            level_file: "cross/castle-7.json",
            hard_level_file: "cross/castle-7.json",
            level_sprite: spr_mod_ancient_castle_7,
            pre_music: mus_cross_server_night,
            elite_music: mus_cross_server_night,
            boss_music: mus_cross_server_night_boss,
            pre_level: "ancient_castle_6",
            rewards: []
        }]
    });
}
