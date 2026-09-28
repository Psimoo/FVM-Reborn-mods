function mod_weapons_init()
{
    register_weapon("zeus_bolt", 
    {
        sprite: spr_zeus_bolt,
        icon: spr_zeus_bolt_icon,
        obj: obj_zeus_bolt,
        slot: "main_weapon",
        allowed_gems: ["zeus_shadow_gem", "zeus_power_gem", "zeus_anger_gem"],
        atk: 65,
        bullet_amount: 2,
        bullet_style: 0,
        splash_ratio: 0,
        cycle: 120,
        description: "宙斯神弩：发射两个追踪飞镖攻击敌人",
        name: "宙斯神弩",
        atk_impact: [78, 91, 104, 117, 130, 143, 156, 169, 182, 195, 227, 240, 253, 266, 279, 292],
        bullet_amount_impact: [2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7],
        bullet_style_impact: [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4],
        splash_ratio_impact: [15, 16, 18, 20, 23, 26, 29, 32, 35, 40, 45, 50, 55, 65, 75, 90]
    });
    register_weapon("hades_scythe", 
    {
        sprite: spr_hades_scythe_icon,
        icon: spr_hades_scythe_icon,
        obj: obj_hades_scythe_enter,
        slot: "super_weapon",
        allowed_gems: ["ghost_strike_gem", "ghost_spark_gem", "ghost_pact_gem"],
        atk: 230,
        cycle: 900,
        ghost_shape: 0,
        bullet_shape: 0,
        bullet_amount: 1,
        description: "冥王战镰：∞形轨迹发射旋转镰刀",
        name: "冥王战镰",
        atk_impact: [356, 414, 471, 529, 609, 690, 782, 908, 1035, 1161, 1380, 1495, 1575, 1656, 1736, 1897],
        cycle_impact: [807, 780, 753, 726, 690, 654, 618, 564, 510, 480, 390, 375, 360, 345, 330, 300],
        bullet_amount_impact: [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5],
        bullet_shape_impact: [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4],
        ghost_shape_impact: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2]
    });
    register_gem("zeus_shadow_gem", 
    {
        name: "天神之影",
        description: "天神之影：增加宙斯神弩子弹溅射\n[专属宝石]：宙斯神弩",
        icon: spr_zeus_shadow_gem_icon,
        slot: "main_weapon",
        obj: obj_zeus_shadow_gem,
        allowed_weapons: ["zeus_bolt"],
        max_level: 15
    });
    register_gem("zeus_power_gem", 
    {
        name: "天神之力",
        description: "天神之力：增加宙斯神弩子弹伤害\n[专属宝石]：宙斯神弩",
        icon: spr_zeus_power_gem_icon,
        slot: "main_weapon",
        obj: obj_zeus_power_gem,
        allowed_weapons: ["zeus_bolt"],
        max_level: 15
    });
    register_gem("zeus_anger_gem", 
    {
        name: "天神之怒",
        description: "天神之怒：增加宙斯神弩子弹数量\n[专属宝石]：宙斯神弩",
        icon: spr_zeus_anger_gem_icon,
        slot: "main_weapon",
        obj: obj_zeus_anger_gem,
        allowed_weapons: ["zeus_bolt"],
        max_level: 15
    });
    register_gem("ghost_strike_gem", 
    {
        name: "亡灵强袭",
        description: "亡灵强袭：增加冥王战镰伤害\n[专属宝石]：冥王战镰",
        icon: spr_ghost_strike_gem_icon,
        slot: "super_weapon",
        obj: obj_ghost_strike_gem,
        allowed_weapons: ["hades_scythe"],
        max_level: 15
    });
    register_gem("ghost_spark_gem", 
    {
        name: "亡灵星火",
        description: "亡灵星火：增加冥王战镰攻速\n[专属宝石]：冥王战镰",
        icon: spr_ghost_spark_gem_icon,
        slot: "super_weapon",
        obj: obj_ghost_spark_gem,
        allowed_weapons: ["hades_scythe"],
        max_level: 15
    });
    register_gem("ghost_pact_gem",
    {
        name: "亡灵契约",
        description: "亡灵契约：增加冥王战镰子弹\n[专属宝石]：冥王战镰",
        icon: spr_ghost_pact_gem_icon,
        slot: "super_weapon",
        obj: obj_ghost_pact_gem,
        allowed_weapons: ["hades_scythe"],
        max_level: 15
    });
    register_weapon("gods_shield",
    {
        sprite: spr_master_shield_icon,
        icon: spr_master_shield_icon,
        obj: obj_player_shield,
        slot: "secondary_weapon",
        allowed_gems: ["gods_shield_gem_1", "gods_shield_gem_2", "gods_shield_gem_3", "gods_shield_gem_4"],
        hp_increase: 500,
        description: "诸神之盾：增加500生命值，镶嵌宝石时提供增益效果",
        name: "诸神之盾"
    });
    register_weapon("master_shield",
    {
        sprite: spr_master_shield_icon,
        icon: spr_master_shield_icon,
        obj: obj_player_shield,
        slot: "secondary_weapon",
        allowed_gems: ["master_shield_gem_1", "master_shield_gem_2", "master_shield_gem_3", "master_shield_gem_4"],
        hp_increase: 700,
        description: "主宰之盾：增加700生命值，镶嵌宝石时提供强力增益效果",
        name: "主宰之盾"
    });
    register_gem("gods_shield_gem_1",
    {
        name: "光能之源",
        description: "光能之源：生产大量火苗\n[专属宝石]：诸神之盾",
        icon: spr_divine_blessing_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["gods_shield"],
        first_produce_delay: 1,
        cycle: [15, 15, 15, 14, 14, 14, 13, 13, 12, 11, 10, 10, 10, 10, 10, 10],
        flame_value: [6, 12, 18, 24, 30, 36, 48, 60, 72, 96, 120, 130, 140, 150, 160, 180],
        max_level: 15
    });
    register_gem("gods_shield_gem_2",
    {
        name: "撕裂之源",
        description: "撕裂之源：撕裂3x3范围内的敌人\n[专属宝石]：诸神之盾",
        icon: spr_divine_holy_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["gods_shield"],
        atk: [5, 10, 15, 20, 25, 30, 40, 50, 60, 80, 100, 110, 120, 130, 140, 150],
        rate: [0.02, 0.03, 0.03, 0.04, 0.05, 0.06, 0.08, 0.1, 0.12, 0.15, 0.18, 0.19, 0.2, 0.23, 0.24, 0.26],
        max_damage: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1600, 1800, 2000, 2200],
        max_level: 15
    });
    register_gem("gods_shield_gem_3",
    {
        name: "永恒之源",
        description: "永恒之源：为5x5范围内的卡片提升攻击力\n[专属宝石]：诸神之盾",
        icon: spr_divine_protect_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["gods_shield"],
        ratio_inner: [0.05, 0.06, 0.07, 0.09, 0.11, 0.13, 0.16, 0.19, 0.22, 0.26, 0.3, 0.32, 0.34, 0.36, 0.38, 0.4],
        ratio_outer: [0.025, 0.03, 0.035, 0.045, 0.055, 0.065, 0.08, 0.095, 0.11, 0.13, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
        max_level: 15
    });
    register_gem("gods_shield_gem_4",
    {
        name: "生命之源",
        description: "生命之源：提升5x5范围内卡片的最大生命值\n[专属宝石]：诸神之盾",
        icon: spr_divine_blessing_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["gods_shield"],
        max_hp_increase_rate: [0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 1],
        max_level: 15
    });
    register_gem("master_shield_gem_1",
    {
        name: "神佑之眼",
        description: "神佑之眼：生产巨量火苗\n[专属宝石]：主宰之盾",
        icon: spr_divine_blessing_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["master_shield"],
        first_produce_delay: 1,
        cycle: [15, 15, 15, 14, 14, 14, 13, 13, 12, 11, 10, 10, 10, 10, 10, 10],
        flame_value: [20, 30, 40, 50, 60, 75, 90, 105, 120, 135, 150, 170, 190, 210, 230, 260],
        max_level: 15
    });
    register_gem("master_shield_gem_2",
    {
        name: "神忌之眼",
        description: "神忌之眼：撕裂5x5范围内的敌人\n[专属宝石]：主宰之盾",
        icon: spr_divine_holy_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["master_shield"],
        atk: [8, 16, 24, 32, 40, 50, 60, 75, 90, 105, 120, 140, 160, 180, 200, 220],
        rate: [0.02, 0.03, 0.03, 0.04, 0.05, 0.06, 0.08, 0.1, 0.12, 0.15, 0.18, 0.19, 0.2, 0.23, 0.24, 0.26],
        max_damage: [150, 250, 350, 500, 650, 800, 950, 1100, 1300, 1500, 1700, 1950, 2200, 2500, 2800, 3200],
        max_level: 15
    });
    register_gem("master_shield_gem_3",
    {
        name: "神护之眼",
        description: "神护之眼：为5×5范围内的卡片大幅提升攻击力\n[专属宝石]：主宰之盾",
        icon: spr_divine_protect_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["master_shield"],
        ratio_inner: [0.07, 0.08, 0.09, 0.11, 0.14, 0.17, 0.2, 0.23, 0.26, 0.29, 0.32, 0.35, 0.38, 0.42, 0.46, 0.5],
        ratio_outer: [0.035, 0.04, 0.045, 0.055, 0.07, 0.085, 0.1, 0.115, 0.13, 0.145, 0.16, 0.175, 0.19, 0.21, 0.23, 0.25],
        max_level: 15
    });
    register_gem("master_shield_gem_4",
    {
        name: "神圣之眼",
        description: "神圣之眼：减速5×5范围内敌人并造成高额伤害\n[专属宝石]：主宰之盾",
        icon: spr_divine_holy_gem_icon,
        slot: "secondary_weapon",
        obj: noone,
        allowed_weapons: ["master_shield"],
        atk: [150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 1000],
        ice_timer: [3, 3, 3, 3.5, 3.5, 3.5, 4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6],
        max_level: 15
    });
    register_gem("divine_blessing_gem", 
    {
        name: "神佑之眼",
        description: "神佑之眼：生产火苗\n[专属宝石]：主宰之盾",
        icon: spr_divine_blessing_gem_icon,
        slot: "secondary_weapon",
        first_produce_delay: 1,
        cycle: [15, 15, 15, 14, 14, 14, 13, 13, 12, 11, 10, 10, 10, 10, 10, 10],
        flame_value: [20, 30, 40, 50, 60, 75, 90, 105, 120, 135, 150, 170, 190, 210, 230, 260],
        obj: obj_divine_blessing_gem,
        allowed_weapons: ["master_shield"],
        max_level: 15
    });
    register_gem("divine_protect_gem", 
    {
        name: "神护之眼",
        description: "神护之眼：为周围卡片增加攻击力\n[专属宝石]：主宰之盾",
        icon: spr_divine_protect_gem_icon,
        slot: "secondary_weapon",
        max_level: 15,
        atk_ratio: [0.07, 0.08, 0.09, 0.11, 0.14, 0.17, 0.2, 0.23, 0.26, 0.29, 0.32, 0.35, 0.38, 0.42, 0.46, 0.5],
        obj: obj_divine_protect_gem,
        allowed_weapons: ["master_shield"]
    });
    register_gem("divine_holy_gem", 
    {
        name: "神圣之眼",
        description: "神圣之眼：伤害并减速5x5范围内的敌人\n[专属宝石]：主宰之盾",
        icon: spr_divine_holy_gem_icon,
        slot: "secondary_weapon",
        max_level: 15,
        atk: [150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 1000],
        ice_timer: [180, 180, 180, 210, 210, 210, 240, 240, 240, 270, 270, 270, 300, 300, 300, 360],
        obj: obj_divine_holy_gem,
        allowed_weapons: ["master_shield"]
    });
    register_weapon("star_wand",
    {
        sprite: spr_star_wand,
        icon: spr_star_wand_icon,
        obj: obj_star_wand,
        slot: "main_weapon",
        allowed_gems: ["star_wand_gem_1", "star_wand_gem_2", "star_wand_gem_3", "star_wand_gem_4", "star_wand_gem_5"],
        atk: 125,
        bullet_amount: 3,
        bullet_style: 0,
        splash_ratio: 0,
        diz_chance: 0.1,
        cycle: 180,
        description: "星之神杖：召唤星之力全屏攻击，几率造成眩晕",
        name: "星之神杖",
        splash_ratio_impact: [0.15, 0.16, 0.17, 0.18, 0.2, 0.24, 0.28, 0.33, 0.38, 0.43, 0.48, 0.54, 0.62, 0.72, 0.85, 1],
        bullet_style_impact: [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4],
        atk_impact: [150, 175, 200, 225, 250, 275, 300, 325, 350, 375, 400, 437, 475, 512, 562, 625],
        bullet_count: [3, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9],
        diz_chance_impact: [0.15, 0.15, 0.18, 0.18, 0.2, 0.22, 0.22, 0.25, 0.28, 0.28, 0.3, 0.35, 0.35, 0.4, 0.5, 0.5],
        cycle_impact: [176, 172, 168, 164, 160, 156, 152, 148, 144, 140, 135, 130, 125, 120, 110, 100],
        splash_ratio_impact_enhanced: [0.23, 0.24, 0.26, 0.27, 0.3, 0.36, 0.42, 0.5, 0.57, 0.65, 0.72, 0.81, 0.93, 1.08, 1.28, 1.5]
    });
    register_weapon("rose_shield",
    {
        sprite: spr_rose_shield,
        icon: spr_rose_shield_icon,
        obj: obj_player_shield,
        slot: "secondary_weapon",
        allowed_gems: ["rose_shield_gem_1", "rose_shield_gem_2", "rose_shield_gem_3", "rose_shield_gem_4", "rose_shield_gem_5"],
        hp_increase: 1000,
        description: "荆棘玫瑰：增加1000生命值，镶嵌宝石时提供超强增益效果",
        name: "荆棘玫瑰"
    });
    register_weapon("aladdin_lamp",
    {
        sprite: spr_aladdin_lamp,
        icon: spr_aladdin_lamp_icon,
        obj: obj_aladdin_lamp_enter,
        slot: "super_weapon",
        allowed_gems: ["aladdin_lamp_gem_1", "aladdin_lamp_gem_2", "aladdin_lamp_gem_3", "aladdin_lamp_gem_4", "aladdin_lamp_gem_5"],
        atk: 500,
        cycle: 900,
        ghost_shape: 0,
        bullet_shape: 0,
        bullet_amount: 2,
        description: "阿拉丁神灯：驱动灯神之力朝固定轨迹飞行",
        name: "阿拉丁神灯",
        atk_impact: [700, 750, 800, 850, 900, 950, 1000, 1050, 1150, 1250, 1350, 1500, 1700, 1900, 2200, 2600],
        ghost_shape_impact: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2],
        cycle_impact: [870, 840, 810, 780, 750, 720, 690, 660, 630, 600, 570, 540, 480, 420, 360, 300],
        bullet_amount_impact: [2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4],
        bullet_trace_impact: [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3],
        bullet_shape_impact: [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4],
        splash_ratio_impact: [0.15, 0.16, 0.17, 0.18, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.27, 0.29, 0.32, 0.37, 0.45],
        atk_impact_enhanced: [1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1950, 2100, 2300, 2500, 2800, 3100, 3500, 4000]
    });
    register_gem("star_wand_gem_1",
    {
        name: "星之焕",
        description: "星之焕：增幅星之力的溅射比率\n并改变星之力的形态\n[专属宝石]：星之神杖",
        icon: spr_star_wand_gem_1,
        slot: "main_weapon",
        obj: obj_star_wand_gem_1,
        allowed_weapons: ["star_wand"],
        max_level: 15
    });
    register_gem("star_wand_gem_2",
    {
        name: "星之吻",
        description: "星之吻：增幅星之力的伤害\n[专属宝石]：星之神杖",
        icon: spr_star_wand_gem_2,
        slot: "main_weapon",
        obj: obj_star_wand_gem_2,
        allowed_weapons: ["star_wand"],
        max_level: 15
    });
    register_gem("star_wand_gem_3",
    {
        name: "星之雨",
        description: "星之雨：增幅召唤星之力的数量\n[专属宝石]：星之神杖",
        icon: spr_star_wand_gem_3,
        slot: "main_weapon",
        obj: obj_star_wand_gem_3,
        allowed_weapons: ["star_wand"],
        max_level: 15
    });
    register_gem("star_wand_gem_4",
    {
        name: "星之闪",
        description: "星之闪：增幅召唤星之力的速度\n并增加眩晕几率\n[专属宝石]：星之神杖",
        icon: spr_star_wand_gem_4,
        slot: "main_weapon",
        obj: obj_star_wand_gem_4,
        allowed_weapons: ["star_wand"],
        max_level: 15
    });
    register_gem("rose_shield_gem_1",
    {
        name: "光合作用",
        description: "光合作用：生产极限量的火苗\n[专属宝石]：荆棘玫瑰",
        icon: spr_rose_shield_gem_1,
        slot: "secondary_weapon",
        obj: obj_rose_shield_gem_1,
        first_produce_delay: 1,
        cycle: [15, 15, 15, 14, 14, 14, 13, 13, 13, 12, 12, 11, 11, 10, 9, 8],
        flame_value: [30, 45, 60, 75, 90, 105, 120, 135, 150, 170, 190, 220, 260, 310, 360, 410],
        allowed_weapons: ["rose_shield"],
        max_level: 15
    });
    register_gem("rose_shield_gem_2",
    {
        name: "玫瑰之刺",
        description: "玫瑰之刺：周期性向8个方向发射荆棘子弹\n[专属宝石]：荆棘玫瑰",
        icon: spr_rose_shield_gem_2,
        slot: "secondary_weapon",
        obj: obj_rose_shield_gem_2,
        atk: [80, 90, 100, 110, 120, 130, 150, 170, 190, 210, 230, 260, 290, 320, 350, 385],
        bullet_count: [1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3],
        cycle: [16, 15.5, 15, 14.5, 14, 13.5, 13, 12.5, 12, 11.5, 11, 10, 9, 8, 7, 5],
        allowed_weapons: ["rose_shield"],
        max_level: 15
    });
    register_gem("rose_shield_gem_3",
    {
        name: "玫瑰之护",
        description: "玫瑰之护：为5×5范围内的卡片提升攻击力(5×5外圈衰减)\n[专属宝石]：荆棘玫瑰",
        icon: spr_rose_shield_gem_3,
        slot: "secondary_weapon",
        obj: obj_rose_shield_gem_3,
        ratio_inner: [0.2, 0.23, 0.26, 0.29, 0.32, 0.36, 0.4, 0.44, 0.48, 0.52, 0.56, 0.6, 0.65, 0.69, 0.72, 0.75],
        ratio_outer: [0.15, 0.17, 0.19, 0.22, 0.24, 0.27, 0.3, 0.33, 0.36, 0.39, 0.42, 0.45, 0.49, 0.52, 0.54, 0.56],
        allowed_weapons: ["rose_shield"],
        max_level: 15
    });
    register_gem("rose_shield_gem_4",
    {
        name: "玫瑰之绞",
        description: "玫瑰之绞：为5×7范围内的敌人造成巨额伤害\n[专属宝石]：荆棘玫瑰",
        icon: spr_rose_shield_gem_4,
        slot: "secondary_weapon",
        obj: obj_rose_shield_gem_4,
        atk_f: [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1700, 1900, 2100, 2300, 2500],
        atk: [20, 25, 30, 35, 40, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 220],
        rate: [0.25, 0.26, 0.27, 0.28, 0.29, 0.3, 0.31, 0.32, 0.33, 0.34, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4],
        max_damage: [300, 500, 700, 1000, 1300, 1600, 1900, 2200, 2600, 3000, 3400, 3800, 4300, 4800, 5400, 6000],
        allowed_weapons: ["rose_shield"],
        max_level: 15
    });
    register_gem("aladdin_lamp_gem_1",
    {
        name: "灯神原力",
        description: "灯神原力：增加阿拉丁神灯的伤害\n[专属宝石]：阿拉丁神灯",
        icon: spr_aladdin_lamp_gem_1,
        slot: "super_weapon",
        obj: obj_aladdin_lamp_gem_1,
        allowed_weapons: ["aladdin_lamp"],
        max_level: 15
    });
    register_gem("aladdin_lamp_gem_2",
    {
        name: "灯神疾速",
        description: "灯神疾速：增加阿拉丁神灯的攻击速度\n[专属宝石]：阿拉丁神灯",
        icon: spr_aladdin_lamp_gem_2,
        slot: "super_weapon",
        obj: obj_aladdin_lamp_gem_2,
        allowed_weapons: ["aladdin_lamp"],
        max_level: 15
    });
    register_gem("aladdin_lamp_gem_3",
    {
        name: "灯神召唤",
        description: "灯神召唤：增加阿拉丁神灯的子弹数量\n[专属宝石]：阿拉丁神灯",
        icon: spr_aladdin_lamp_gem_3,
        slot: "super_weapon",
        obj: obj_aladdin_lamp_gem_3,
        allowed_weapons: ["aladdin_lamp"],
        max_level: 15
    });
    register_gem("aladdin_lamp_gem_4",
    {
        name: "灯神迷雾",
        description: "灯神迷雾：增加阿拉丁神灯的子弹溅射并改变子弹形态\n[专属宝石]：阿拉丁神灯",
        icon: spr_aladdin_lamp_gem_4,
        slot: "super_weapon",
        obj: obj_aladdin_lamp_gem_4,
        allowed_weapons: ["aladdin_lamp"],
        max_level: 15
    });
    register_gem("star_wand_gem_5",
    {
        name: "星之耀",
        description: "星之耀：大幅增幅星之力的溅射比率\n并改变星之力的形态\n[专属宝石]：星之神杖",
        icon: spr_star_wand_gem_5,
        slot: "main_weapon",
        obj: obj_star_wand_gem_5,
        allowed_weapons: ["star_wand"],
        max_level: 15
    });
    register_gem("rose_shield_gem_5",
    {
        name: "玫瑰之心",
        description: "玫瑰之心：为5×7范围内的卡片巨幅提升攻击力(无衰减)\n[专属宝石]：荆棘玫瑰",
        icon: spr_rose_shield_gem_5,
        slot: "secondary_weapon",
        obj: obj_rose_shield_gem_5,
        ratio: [0.3, 0.33, 0.35, 0.37, 0.39, 0.43, 0.47, 0.51, 0.55, 0.59, 0.63, 0.67, 0.71, 0.75, 0.8, 0.85],
        allowed_weapons: ["rose_shield"],
        max_level: 15
    });
    register_gem("aladdin_lamp_gem_5",
    {
        name: "灯神涅槃",
        description: "灯神涅槃：大幅增加阿拉丁神灯的伤害\n[专属宝石]：阿拉丁神灯",
        icon: spr_aladdin_lamp_gem_5,
        slot: "super_weapon",
        obj: obj_aladdin_lamp_gem_5,
        allowed_weapons: ["aladdin_lamp"],
        max_level: 15
    });
}
