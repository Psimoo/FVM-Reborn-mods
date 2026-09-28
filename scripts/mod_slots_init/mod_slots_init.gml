function mod_slots_init()
{
    // 随机礼盒：固定50火苗、10秒冷却，可兼容陆地和水面放置。
    register_card("lihe", obj_lihe, [
    {
        shape: 0,
        sprite: spr_lihe,
        cost: 50,
        cooldown: 600,
        description: "随机礼盒：随机生成一张卡片，生成卡片继承礼盒星级",
        plant_type: "normal",
        feature_type: "amphi",
        target_card: "none"
    }]);

    register_card("gaia", obj_gaia, [
    {
        shape: 0,
        sprite: spr_gaia,
        cost: 350,
        cooldown: 2100,
        description: "盖亚神使：双连发射3*3范围爆炸的毁灭巨石",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_gaia_1,
        cost: 350,
        cooldown: 2100,
        description: "盖亚圣神：双连发射3*3范围爆炸的毁灭巨石",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_gaia_2,
        cost: 350,
        cooldown: 2100,
        description: "大地女神·盖亚：三连发射3*3范围爆炸的毁灭巨石",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_gaia_3,
        cost: 350,
        cooldown: 2100,
        description: "至尊大地女神：三连发射5*5范围爆炸的毁灭巨石",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("aurora", obj_aurora, [
    {
        shape: 0,
        sprite: spr_aurora_icon,
        cost: 190,
        cooldown: 1800,
        description: "欧若拉神使：为本行投掷类卡片增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_aurora
    }, 
    {
        shape: 1,
        sprite: spr_aurora_icon_1,
        cost: 190,
        cooldown: 1800,
        description: "欧若拉圣神：为本行投掷类卡片增伤，死亡后爆炸",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_aurora_1
    }, 
    {
        shape: 2,
        sprite: spr_aurora_icon_2,
        cost: 190,
        cooldown: 1800,
        description: "曙光女神·欧若拉：为本行投掷类卡片增伤，死亡后爆炸",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_aurora_2
    }, 
    {
        shape: 3,
        sprite: spr_aurora_icon_3,
        cost: 190,
        cooldown: 1800,
        description: "至尊曙光女神：为本行及相邻行投掷类卡片增伤，死亡后爆炸",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_aurora_3
    }]);
    register_card("zhurong", obj_zhurong, [
    {
        shape: 0,
        sprite: spr_zhurong,
        cost: 245,
        cooldown: 420,
        description: "祝融神使：点燃前方3x3区域，持续灼烧敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_zhurong_1,
        cost: 245,
        cooldown: 420,
        description: "祝融圣神：点燃前方3x3区域，持续灼烧敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_zhurong_2,
        cost: 245,
        cooldown: 420,
        description: "赤帝·祝融：点燃前方5x5区域，持续灼烧敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_zhurong_3,
        cost: 245,
        cooldown: 420,
        description: "至尊赤帝：点燃前方7x5区域，持续灼烧敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("rig", obj_rig, [
    {
        shape: 0,
        sprite: spr_rig,
        cost: 185,
        cooldown: 420,
        description: "里格神使：前方5方向发射穿透子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_rig_1,
        cost: 260,
        cooldown: 420,
        description: "里格圣神：前方5方向发射穿透子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_rig_2,
        cost: 260,
        cooldown: 420,
        description: "守护神·里格：前方5方向发射穿透子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_rig_3,
        cost: 260,
        cooldown: 420,
        description: "至尊守护神：前方5方向发射穿透子弹，攻击力翻倍",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("brahma", obj_brahma, [
    {
        shape: 0,
        sprite: spr_brahma_icon,
        cost: 325,
        cooldown: 3300,
        description: "梵天神使：变身出多个上一次种下的卡片",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_brahma
    }, 
    {
        shape: 1,
        sprite: spr_brahma_icon_1,
        cost: 325,
        cooldown: 3300,
        description: "梵天圣神：变身出多个上一次种下的卡片",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_brahma_1
    }, 
    {
        shape: 2,
        sprite: spr_brahma_icon_2,
        cost: 325,
        cooldown: 3300,
        description: "创造神·梵天：变身出多个上一次种下的卡片",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_brahma_2
    }, 
    {
        shape: 3,
        sprite: spr_brahma_icon_3,
        cost: 325,
        cooldown: 3300,
        description: "至尊创造神：变身出多个上一次种下的卡片",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_brahma_3
    }]);
    register_card("baibianshe", obj_baibianshe, [
    {
        shape: 0,
        sprite: spr_baibianshe,
        cost: 375,
        cooldown: 3300,
        description: "百变蛇：变身成为范围内上一张种下的卡片",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_baibianshe
    },
    {
        shape: 1,
        sprite: spr_baibianshe_1,
        cost: 375,
        cooldown: 3300,
        description: "孪生百变蛇：变身范围扩大到全屏",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_baibianshe_1
    },
    {
        shape: 2,
        sprite: spr_baibianshe_2,
        cost: 375,
        cooldown: 3300,
        description: "双子百变蛇：变身数量+2，共3张",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_baibianshe_2
    }]);
    register_card("mozhang", obj_mozhang, [
    {
        shape: 0,
        sprite: spr_mozhang,
        cost: 310,
        cooldown: 2520,
        description: "魔杖蛇：给周围3*3范围旋转攻击卡片和本行直线喷射类卡片提高攻击力",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_mozhang
    },
    {
        shape: 1,
        sprite: spr_mozhang_1,
        cost: 310,
        cooldown: 2520,
        description: "青木魔杖蛇：旋转类卡片加成范围扩大到5*5",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_mozhang_1
    },
    {
        shape: 2,
        sprite: spr_mozhang_2,
        cost: 310,
        cooldown: 2520,
        description: "凤羽魔杖蛇：攻击力大幅提升，旋转类加成范围5*5",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_mozhang_2
    }]);
    register_card("clotho", obj_clotho, [
    {
        shape: 0,
        sprite: spr_clotho_icon,
        cost: 400,
        cooldown: 3600,
        description: "克洛托神使：随机改变范围内卡片星级，一段时间后恢复",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_clotho
    }, 
    {
        shape: 1,
        sprite: spr_clotho_icon_1,
        cost: 400,
        cooldown: 3600,
        description: "克洛托圣神：随机改变范围内卡片星级，一段时间后恢复",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_clotho_1
    }, 
    {
        shape: 2,
        sprite: spr_clotho_icon_2,
        cost: 400,
        cooldown: 3600,
        description: "命运女神·克洛托：随机改变范围内卡片星级，一段时间后恢复",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_clotho_2
    }, 
    {
        shape: 3,
        sprite: spr_clotho_icon_3,
        cost: 400,
        cooldown: 3600,
        description: "至尊命运女神：随机改变范围内卡片星级，一段时间后恢复",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_clotho_3
    }]);
    register_card("time_god", obj_time_god, [
    {
        shape: 0,
        sprite: spr_time_god,
        cost: 370,
        cooldown: 3600,
        description: "柯罗诺斯神使：持续给范围内卡片缩短冷却时间30%",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_time_god
    },
    {
        shape: 1,
        sprite: spr_time_god_1,
        cost: 370,
        cooldown: 3600,
        description: "柯罗诺斯圣神：放卡产生爆炸，持续缩减冷却30%",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_time_god_1
    },
    {
        shape: 2,
        sprite: spr_time_god_2,
        cost: 370,
        cooldown: 3600,
        description: "时间神·柯罗诺斯：范围扩大至5x5，冷却缩减50%",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_time_god_2
    },
    {
        shape: 3,
        sprite: spr_time_god_3,
        cost: 370,
        cooldown: 3600,
        description: "至尊时间神：范围扩大至全屏，冷却缩减100%",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_time_god_3
    }]);
    register_card("firework_dragon_real", obj_firework_dragon_real, [
    {
        shape: 0,
        sprite: spr_firework_dragon,
        cost: 150,
        cooldown: 420,
        description: "真·花火龙：释放产生大量火苗的烟花",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_firework_dragon_1,
        cost: 150,
        cooldown: 420,
        description: "真·灼灼花火龙：释放产生大量火苗的烟花",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_firework_dragon_icon_2,
        cost: 150,
        cooldown: 420,
        description: "真·炽焰花火龙：释放产生大量火苗的烟花",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_firework_dragon_2
    }]);
    register_card("sun_god", obj_sun_god, [
    {
        shape: 0,
        sprite: spr_sun_god,
        cost: 200,
        cooldown: 1800,
        description: "阿波罗神使：一次生产六朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_sun_god_1,
        cost: 150,
        cooldown: 1500,
        description: "阿波罗圣神：一次生产八朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_sun_god_2,
        cost: 100,
        cooldown: 1200,
        description: "太阳神·阿波罗：一次生产十朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_sun_god_3_icon,
        cost: 25,
        cooldown: 600,
        description: "至尊太阳神：一次生产十二朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_sun_god_3
    }]);
    register_card("war_god", obj_war1_god, [
    {
        shape: 0,
        sprite: spr_war_god,
        cost: 150,
        cooldown: 420,
        description: "阿瑞斯神使：向前后两个方向发射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_war_god_1,
        cost: 150,
        cooldown: 420,
        description: "阿瑞斯圣神：向前后两个方向发射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_war_god_2,
        cost: 150,
        cooldown: 420,
        description: "战神·阿瑞斯：向前后两个方向发射子弹，",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_war_god_3,
        cost: 150,
        cooldown: 420,
        description: "至尊战神：向前后两个方向发射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("love_god", obj_love_god, [
    {
        shape: 0,
        sprite: spr_love_god,
        cost: 300,
        cooldown: 420,
        description: "丘比特神使：向前方三行射出6发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_love_god_1,
        cost: 300,
        cooldown: 420,
        description: "丘比特圣神：向前方三行射出6发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_love_god_2,
        cost: 300,
        cooldown: 420,
        description: "爱神·丘比特：向前方三行射出9发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_love_god_3,
        cost: 300,
        cooldown: 420,
        description: "至尊爱神：向前方三行射出9发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("thor", obj_thor, [
    {
        shape: 0,
        sprite: spr_thor_icon,
        cost: 200,
        cooldown: 420,
        description: "索尔神使：连续发出2发冰锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_thor,
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_thor_icon_1,
        cost: 200,
        cooldown: 420,
        description: "索尔圣神：连续发出3发冰锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_thor_1,
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_thor_icon_2,
        cost: 200,
        cooldown: 420,
        description: "雷神·索尔：连续发出3发冰锤，其中1发为超级冰锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_thor_2,
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_thor_icon_3,
        cost: 200,
        cooldown: 420,
        description: "至尊雷神：连续发出3发冰锤，其中1发为超级冰锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_thor_3,
        is_gold: 1
    }]);
    register_card("moon_god", obj_moon_god, [
    {
        shape: 0,
        sprite: spr_moon_god,
        cost: 225,
        cooldown: 3000,
        description: "狄安娜神使：甩出六发追踪子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_moon_god_1,
        cost: 225,
        cooldown: 3000,
        description: "狄安娜圣神：甩出六发追踪子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_moon_god_2,
        cost: 225,
        cooldown: 3000,
        description: "月神·狄安娜：甩出六发追踪子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_moon_god_3,
        cost: 225,
        cooldown: 3000,
        description: "至尊月神：甩出六发追踪子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("poseidon", obj_poseidon, [
    {
        shape: 0,
        sprite: spr_poseidon,
        cost: 275,
        cooldown: 1800,
        description: "波塞冬神使：5*5范围穿透攻击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_poseidon_1,
        cost: 275,
        cooldown: 1800,
        description: "波塞冬圣神：5*5范围穿透攻击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_poseidon_2,
        cost: 275,
        cooldown: 1200,
        description: "海神·波塞冬：5*5范围穿透攻击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_poseidon_3,
        cost: 275,
        cooldown: 1200,
        description: "至尊海神：7*5范围穿透攻击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("odin", obj_odin, [
    {
        shape: 0,
        sprite: spr_odin,
        cost: 230,
        cooldown: 420,
        description: "奥丁神使：发射冈格尼尔穿透攻击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_odin_1,
        cost: 230,
        cooldown: 420,
        description: "奥丁圣神：发射冈格尼尔穿透攻击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_odin_2,
        cost: 230,
        cooldown: 420,
        description: "主神·奥丁：发射1发强化穿透短矛（3.75倍伤害）",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_odin_3,
        cost: 230,
        cooldown: 420,
        description: "至尊主神：发射1发强化穿透短矛（5倍伤害）",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("zeus", obj_zeus, [
    {
        shape: 0,
        sprite: spr_zeus,
        cost: 375,
        cooldown: 1200,
        description: "宙斯神使：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_zeus_1,
        cost: 375,
        cooldown: 1200,
        description: "宙斯圣神：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_zeus_2,
        cost: 375,
        cooldown: 1200,
        description: "天神·宙斯：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_zeus_3,
        cost: 375,
        cooldown: 1200,
        description: "至尊天神：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("ice_god", obj_ice_god, [
    {
        shape: 0,
        sprite: spr_ice_god,
        cost: 325,
        cooldown: 900,
        description: "典伊神使：召唤8颗冰晶轰击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_ice_god_1,
        cost: 225,
        cooldown: 900,
        description: "典伊圣神：召唤8颗冰晶轰击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_ice_god_2,
        cost: 225,
        cooldown: 900,
        description: "冰神·典伊：召唤10颗冰晶轰击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_ice_god_3,
        cost: 225,
        cooldown: 900,
        description: "至尊冰神：召唤12颗冰晶轰击敌人",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("ghost_god", obj_ghost_god, [
    {
        shape: 0,
        sprite: spr_ghost_god,
        cost: 225,
        cooldown: 3000,
        description: "哈迪斯神使：发射五向子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_ghost_god_1,
        cost: 225,
        cooldown: 3000,
        description: "哈迪斯圣神：发射五向子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_ghost_god_2,
        cost: 225,
        cooldown: 3000,
        description: "冥神·哈迪斯：次级子弹攻击力翻倍",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_ghost_god_3,
        cost: 225,
        cooldown: 3000,
        description: "至尊冥神：发射五向子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("hera", obj_hera, [
    {
        shape: 0,
        sprite: spr_hera_icon_1,
        cost: 125,
        cooldown: 1800,
        description: "赫拉神使：保护被罩住的卡片",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_hera_outer_1,
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_hera_icon_2,
        cost: 125,
        cooldown: 1800,
        description: "赫拉圣神：保护被罩住的卡片并反伤",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_hera_1_outer_1,
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_hera_icon_3,
        cost: 125,
        cooldown: 1800,
        description: "天后·赫拉：保护被罩住的卡片并反伤",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_hera_2_outer_1,
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_hera_icon_4,
        cost: 125,
        cooldown: 1800,
        description: "至尊天后：保护被罩住的卡片并反伤",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_hera_3_outer_1,
        is_gold: 1
    }]);
    register_card("fire_god", obj_fire_god, [
    {
        shape: 0,
        sprite: spr_fire_god,
        cost: 225,
        cooldown: 420,
        description: "洛基神使：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_fire_god_1,
        cost: 175,
        cooldown: 420,
        description: "洛基圣神：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_fire_god_2,
        cost: 175,
        cooldown: 420,
        description: "火神·洛基：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_fire_god_3,
        cost: 100,
        cooldown: 420,
        description: "至尊火神：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("water_god", obj_water_god, [
    {
        shape: 0,
        sprite: spr_water_god,
        cost: 150,
        cooldown: 420,
        description: "忒提丝神使：反弹子弹并附加伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
    sprite: spr_water_god_1,
    cost: 150,
        cooldown: 420,
        description: "忒提丝圣神：反弹子弹并附加伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
    sprite: spr_water_god_2_icon,
    cost: 150,
        cooldown: 420,
        description: "水神·忒提丝：反弹子弹并附加伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_water_god_2
    }, 
    {
        shape: 3,
    sprite: spr_water_god_3_icon,
    cost: 150,
        cooldown: 420,
        description: "至尊水神：反弹子弹并附加双倍伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_water_god_3
    }]);
    register_card("power_god", obj_power_god, [
    {
        shape: 0,
        sprite: spr_power_god,
        cost: 275,
        cooldown: 420,
        description: "赫丘利神使：发射两发强力子弹追踪攻击空中鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_power_god_1,
        cost: 275,
        cooldown: 420,
        description: "赫丘利圣神：发射两发强力子弹追踪攻击空中鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_power_god_2,
        cost: 275,
        cooldown: 420,
        description: "大力神·赫丘利：发射三发强力子弹追踪攻击空中鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_power_god_3,
        cost: 275,
        cooldown: 420,
        description: "至尊大力神：发射四发强力子弹追踪攻击空中鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }]);
    register_card("sheng_huo", obj_sh, [
    {
        shape: 0,
        sprite: spr_sh,
        cost: 320,
        cooldown: 420,
        description: "赫斯提亚神使：施展火焰术，向前方3行释放神圣穿透型火焰，灼烧沿途鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_sh_icon_1,
        cost: 320,
        cooldown: 420,
        description: "赫斯提亚圣神：施展火焰术，向前方3行释放神圣穿透型火焰，灼烧沿途鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_sh_1
    }, 
    {
        shape: 2,
        sprite: spr_sh_icon_2,
        cost: 320,
        cooldown: 420,
        description: "圣火女神·赫斯提亚：施展火焰术，向前方3行释放神圣穿透型火焰，灼烧沿途鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_sh_2
    }, 
    {
        shape: 3,
        sprite: spr_sh_icon_3,
        cost: 320,
        cooldown: 420,
        description: "至尊圣火女神：施展火焰术，向前方3行释放神圣穿透型火焰，灼烧沿途鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_sh_3
    }]);
    register_card("save_god", obj_save_god, [
    {
        shape: 0,
        sprite: spr_save_god_0,
        cost: 375,
        cooldown: 1800,
        description: "灵鱼摩羯神使：化身为4条灵鱼，冲撞沿途遇到的老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_save_god_1,
        cost: 375,
        cooldown: 1800,
        description: "灵鱼摩羯圣神：化身为4条灵鱼，冲撞沿途遇到的老鼠",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_save_god_2_icon,
        cost: 375,
        cooldown: 1800,
        description: "救世神·灵鱼摩羯：化身为5条灵鱼，冲撞沿途遇到的老鼠",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_save_god_2
    }, 
    {
        shape: 3,
        sprite: spr_save_god_3_icon,
        cost: 375,
        cooldown: 1800,
        description: "至尊救世神：化身为7条灵鱼，冲撞沿途遇到的老鼠",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_save_god_3
    }]);
    register_card("ymir", obj_ymir, [
    {
        shape: 0,
        sprite: spr_ymir_icon,
        cost: 380,
        cooldown: 420,
        description: "尤弥尔神使：向前方三行投出共6发巨锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_ymir,
        is_gold: 1
    }, 
    {
        shape: 1,
        sprite: spr_ymir_icon_1,
        cost: 380,
        cooldown: 420,
        description: "尤弥尔圣神：向前方三行投出共7发巨锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_ymir_1,
        is_gold: 1
    }, 
    {
        shape: 2,
        sprite: spr_ymir_icon_2,
        cost: 380,
        cooldown: 420,
        description: "巨神·尤弥尔：向前方三行投出共9发巨锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_ymir_2,
        is_gold: 1
    }, 
    {
        shape: 3,
        sprite: spr_ymir_icon_3,
        cost: 380,
        cooldown: 420,
        description: "至尊巨神：向前方三行投出共12发巨锤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_ymir_3,
        is_gold: 1
    }]);
    register_card("joker", obj_joker, [
    {
        shape: 0,
        sprite: spr_joker_icon,
        cost: 275,
        cooldown: 420,
        description: "埃罗斯神使：连续发射3发带有溅射效果的子弹，先后攻击本行空、地、水陆老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_joker_0
    }, 
    {
        shape: 1,
        sprite: spr_joker_icon_1,
        cost: 275,
        cooldown: 420,
        description: "埃罗斯圣神：连续发射3发带有溅射效果的子弹，先后攻击本行空、地、水陆老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_joker_1
    }, 
    {
        shape: 2,
        sprite: spr_joker_icon_2,
        cost: 275,
        cooldown: 420,
        description: "恶作剧神·埃罗斯：连续发射3发带有溅射效果的子弹，先后攻击本行空、地、水陆老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_joker_2
    }, 
    {
        shape: 3,
        sprite: spr_joker_icon_3,
        cost: 275,
        cooldown: 420,
        description: "至尊恶作剧神：连续发射3发带有溅射效果的子弹，先后攻击本行空、地、水陆老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_joker_3
    }]);
    register_card("athena", obj_athena, [
    {
        shape: 0,
        sprite: spr_athena,
        cost: 375,
        cooldown: 1200,
        description: "雅典娜守护：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_athena_1,
        cost: 375,
        cooldown: 1200,
        description: "雅典娜圣衣：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_athena_2,
        cost: 375,
        cooldown: 1200,
        description: "雅典娜光辉：全屏轰击，造成3×3范围伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("shuangzi", obj_shuangzi, [
    {
        shape: 0,
        sprite: spr_shuangzi,
        cost: 200,
        cooldown: 3000,
        description: "双子座精灵：一次性产出4朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_shuangzi_1,
        cost: 200,
        cooldown: 1800,
        description: "双子座战将：一次性产出4朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_shuangzi_2,
        cost: 200,
        cooldown: 1200,
        description: "双子座星宿：一次性产出6朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("sheshou", obj_sheshou, [
    {
        shape: 0,
        sprite: spr_sheshou,
        cost: 300,
        cooldown: 420,
        description: "射手座精灵：向前方三行射出4发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_sheshou_1,
        cost: 300,
        cooldown: 420,
        description: "射手座战将：向前方三行射出4发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_sheshou_2,
        cost: 300,
        cooldown: 420,
        description: "射手座星宿：向前方三行射出6发强力子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("tiancheng", obj_tiancheng, [
    {
        shape: 0,
        sprite: spr_tiancheng,
        cost: 150,
        cooldown: 420,
        description: "天秤座精灵：向前后各射出3发比较强力的子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_tiancheng_1,
        cost: 150,
        cooldown: 420,
        description: "天秤座战将：向前后各射出3发比较强力的子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_tiancheng_2,
        cost: 150,
        cooldown: 420,
        description: "天秤座星宿：向前后各射出4发比较强力的子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("shuangyu", obj_shuangyu, [
    {
        shape: 0,
        sprite: spr_shuangyu_icon,
        cost: 200,
        cooldown: 420,
        description: "双鱼座精灵：投掷两颗带有减速的冰鱼",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_shuangyu
    }, 
    {
        shape: 1,
        sprite: spr_shuangyu_1_icon,
        cost: 200,
        cooldown: 420,
        description: "双鱼座战将：投掷两颗带有减速的冰鱼",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_shuangyu_1
    }, 
    {
        shape: 2,
        sprite: spr_shuangyu_2_icon,
        cost: 200,
        cooldown: 420,
        description: "双鱼座星宿：投掷两颗带有减速的强力冰鱼",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_shuangyu_2
    }]);
    register_card("juxie", obj_juxie, [
    {
        shape: 0,
        sprite: spr_juxie,
        cost: 225,
        cooldown: 1800,
        description: "巨蟹座精灵：发射4发强力钳子，全屏跟踪，海陆两栖",
        plant_type: "normal",
        feature_type: "amphi",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_juxie_1,
        cost: 225,
        cooldown: 1200,
        description: "巨蟹座战将：发射4发强力钳子，全屏跟踪，海陆两栖",
        plant_type: "normal",
        feature_type: "amphi",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_juxie_2,
        cost: 225,
        cooldown: 900,
        description: "巨蟹座星宿：发射6发强力钳子，全屏跟踪，海陆两栖",
        plant_type: "normal",
        feature_type: "amphi",
        target_card: "none"
    }]);
    register_card("shizi", obj_shizi, [
    {
        shape: 0,
        sprite: spr_shizi,
        cost: 275,
        cooldown: 1800,
        description: "狮子座精灵：5×5范围穿透打击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_shizi_1,
        cost: 275,
        cooldown: 1200,
        description: "狮子座战将：5×5范围穿透打击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_shizi_2,
        cost: 275,
        cooldown: 900,
        description: "狮子座星宿：5×5范围两次穿透打击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("jinniu", obj_jinniu, [
    {
        shape: 0,
        sprite: spr_jinniu,
        cost: 225,
        cooldown: 420,
        description: "金牛座精灵：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_jinniu_1,
        cost: 175,
        cooldown: 420,
        description: "金牛座战将：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_jinniu_2,
        cost: 175,
        cooldown: 420,
        description: "金牛座星宿：点燃子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("chunv", obj_chunv, [
    {
        shape: 0,
        sprite: spr_chunv_0_3,
        cost: 175,
        cooldown: 1800,
        description: "处女座精灵：保护卡牌，并反弹伤害",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_chunv_1_4,
        cost: 200,
        cooldown: 1800,
        description: "处女座战将：保护卡牌，并反弹伤害",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_chunv_2_4,
        cost: 225,
        cooldown: 1800,
        description: "处女座星宿：保护卡牌，并反弹伤害",
        plant_type: "shield_outer",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("baiyang", obj_baiyang, [
    {
        shape: 0,
        sprite: spr_baiyang_icon,
        cost: 300,
        cooldown: 3000,
        description: "白羊座精灵：冲撞清除一行鼠军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_baiyang
    }, 
    {
        shape: 1,
        sprite: spr_baiyang_icon,
        cost: 200,
        cooldown: 3000,
        description: "白羊座战将：冲撞清除一行鼠军，且无需格子放置",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_baiyang
    }, 
    {
        shape: 2,
        sprite: spr_baiyang_icon,
        cost: 200,
        cooldown: 3000,
        description: "白羊座星宿：冲撞清除三行鼠军，且无需格子放置",
        plant_type: "coffee",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_baiyang
    }]);
    register_card("mojie", obj_mojie, [
    {
        shape: 0,
        sprite: spr_mojie,
        cost: 300,
        cooldown: 3000,
        description: "摩羯座精灵：3×3范围内持续伤害并减速",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_mojie_1,
        cost: 300,
        cooldown: 3000,
        description: "摩羯座战将：3×3范围内持续伤害并减速",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_mojie_2,
        cost: 300,
        cooldown: 3000,
        description: "摩羯座星宿：5×5范围内持续伤害并减速",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("corn_shooter", obj_corn_shooter, [
    {
        shape: 0,
        sprite: spr_corn_shooter,
        cost: 250,
        cooldown: 3000,
        description: "玉蜀黍：发射三颗玉米",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_corn_shooter_1,
        cost: 250,
        cooldown: 3000,
        description: "奶油玉米机枪：发射六颗玉米",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_corn_shooter_2,
        cost: 250,
        cooldown: 3000,
        description: "加农玉米机枪：发射六颗玉米",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("warm_birds", obj_warm_birds, [
    {
        shape: 0,
        sprite: spr_warm_birds,
        cost: 125,
        cooldown: 1800,
        description: "暖暖鸡：一次生产3朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_warm_birds_1,
        cost: 125,
        cooldown: 1800,
        description: "焰羽暖暖鸡：一次生产4朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_warm_birds_2,
        cost: 125,
        cooldown: 900,
        description: "日耀暖暖鸡：一次生产5朵火苗",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    // 已移除 sea_star（不需要的卡片）
    // 已移除 tanghulu（对象未创建）
    register_card("cold_drew", obj_cold_drew, [
    {
        shape: 0,
        sprite: spr_cold_drew_machine_icon,
        cost: 295,
        cooldown: 900,
        description: "冰块冷萃机：对全屏敌人发射至多4颗追踪冰块",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_cold_drew_machine
    }, 
    {
        shape: 1,
        sprite: spr_cold_drew_machine_icon_1,
        cost: 295,
        cooldown: 900,
        description: "低温冷萃机：对全屏敌人发射至多5颗追踪冰块",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_cold_drew_machine_1
    }, 
    {
        shape: 2,
        sprite: spr_cold_drew_machine_icon_2,
        cost: 295,
        cooldown: 900,
        description: "迅捷冷萃机：对全屏敌人发射6颗追踪冰块，可集火",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_cold_drew_machine_2
    }]);
    register_card("berry_dessert", obj_berry_dessert, [
    {
        shape: 0,
        sprite: spr_berry_dessert_icon,
        cost: 260,
        cooldown: 2400,
        description: "莓果点心：为3x3范围内追踪类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_berry_dessert_icon_1,
        cost: 260,
        cooldown: 2400,
        description: "薄荷莓果点心：为5x5范围内追踪类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_berry_dessert_icon_2,
        cost: 260,
        cooldown: 2400,
        description: "流心莓果点心：为5x5范围内追踪类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("grilled_lizard_pult", obj_grilled_lizard_pult, [
    {
        shape: 0,
        sprite: spr_grilled_lizard_pult,
        cost: 275,
        cooldown: 420,
        description: "烤蜥蜴投手：向前投掷配料爆弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_grilled_lizard_pult_1,
        cost: 275,
        cooldown: 420,
        description: "坚果蜥蜴投手：向前投掷配料爆弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_grilled_lizard_pult_2,
        cost: 275,
        cooldown: 420,
        description: "花椒蜥蜴投手：向前投掷2发配料爆弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("blueberry_tower", obj_blueberry_tower, [
    {
        shape: 0,
        sprite: spr_blueberry_tower,
        cost: 160,
        cooldown: 2100,
        description: "蓝莓信号塔塔：为本行投掷卡片增加攻击力",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);
    register_card("donut", obj_donut, [
    {
        shape: 0,
        sprite: spr_donut_3,
        cost: 200,
        cooldown: 420,
        description: "梦幻多拿滋：连续攻击本行鼠军，优先空军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_donut
    }, 
    {
        shape: 1,
        sprite: spr_donut_4,
        cost: 200,
        cooldown: 420,
        description: "仙女多拿滋：连续攻击本行鼠军，优先空军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_donut_1
    }, 
    {
        shape: 2,
        sprite: spr_donut_5,
        cost: 200,
        cooldown: 420,
        description: "女王多拿滋：连续攻击本行鼠军，优先空军",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_donut_2
    }]);
    register_card("spoon_rabbit", obj_spoon_rabbit, [
    {
        shape: 0,
        sprite: spr_spoon_rabbit_icon,
        cost: 300,
        cooldown: 420,
        description: "勺勺兔：向前方3行投射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_spoon_rabbit
    }, 
    {
        shape: 1,
        sprite: spr_spoon_rabbit_icon_1,
        cost: 300,
        cooldown: 420,
        description: "增强勺勺兔：向前方3行投射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_spoon_rabbit_1
    }, 
    {
        shape: 2,
        sprite: spr_spoon_rabbit_icon_2,
        cost: 300,
        cooldown: 420,
        description: "盖世勺勺兔：向前方3行投射子弹",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_spoon_rabbit_2
    }]);
    register_card("hspeed_juicer", obj_hspeed_juicer, [
    {
        shape: 0,
        sprite: spr_hspeed_juicer,
        cost: 260,
        cooldown: 2700,
        description: "加速榨汁机：为3x3范围内喷壶类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 1,
        sprite: spr_hspeed_juicer_1,
        cost: 260,
        cooldown: 2700,
        description: "苹果榨汁机：为3x3范围内喷壶类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }, 
    {
        shape: 2,
        sprite: spr_hspeed_juicer_2,
        cost: 260,
        cooldown: 2700,
        description: "大菠萝榨汁机：为5x5范围内喷壶类卡片提供增伤",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none"
    }]);

register_card("xiangshui_god", obj_xiangshui_god, [
{
    shape: 0,
    sprite: spr_xiangshui_god,
    cost: 260,
    cooldown: 2400,
    description: "塔利亚神使：为周围绿地追踪卡片提升大幅攻击力，同类卡片效果不叠加",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_xiangshui_god
},
{
    shape: 1,
    sprite: spr_xiangshui_god_1,
    cost: 260,
    cooldown: 2400,
    description: "塔利亚圣神：为周围绿地追踪卡片提升大幅攻击力，同类卡片效果不叠加",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_xiangshui_god_1
},
{
    shape: 2,
    sprite: spr_xiangshui_god_2,
    cost: 260,
    cooldown: 2400,
    description: "宴飨女神·塔利亚：攻击力提升，为周围5x5范围追踪卡片提升大幅攻击力",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_xiangshui_god_2
},
{
    shape: 3,
    sprite: spr_xiangshui_god_3,
    cost: 260,
    cooldown: 2400,
    description: "至尊宴飨女神：冰神类卡片共享增幅，为周围5x5范围追踪卡片提升大幅攻击力",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_xiangshui_god_3
}]);

register_card("fengrao_god", obj_fengrao_god, [
{
    shape: 0,
    sprite: spr_fengrao_god,
    cost: 300,
    cooldown: 2100,
    description: "弗雷神使：为5*5范围内五向类卡片增加攻击力，同类卡片效果不叠加",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_fengrao_god
},
{
    shape: 1,
    sprite: spr_fengrao_god_1,
    cost: 300,
    cooldown: 2100,
    description: "弗雷圣神：追加多向类卡片增幅，为5*5范围内五向及多向类卡片增加攻击力",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_fengrao_god_1
},
{
    shape: 2,
    sprite: spr_fengrao_god_2,
    cost: 300,
    cooldown: 2100,
    description: "丰饶神·弗雷：攻击力大幅提升，为5*5范围内五向及多向类卡片增加攻击力",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_fengrao_god_2
},
{
    shape: 3,
    sprite: spr_fengrao_god_3,
    cost: 300,
    cooldown: 2100,
    description: "至尊丰饶神：同类卡片加成可叠加2次，为5*5范围内五向及多向类卡片增加攻击力",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_fengrao_god_3
}]);

register_card("houyi_god", obj_houyi_god, [
{
    shape: 0,
    sprite: spr_houyi_god,
    cost: 385,
    cooldown: 420,
    description: "后羿神使：向前方3路发射3发穿透箭矢（3倍伤害），几率产生三昧真火灼烧鼠军",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_houyi_god
},
{
    shape: 1,
    sprite: spr_houyi_god_1,
    cost: 385,
    cooldown: 420,
    description: "后羿圣神：灼烧效果提升，中路子弹4倍伤害，边路3倍",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_houyi_god_1
},
{
    shape: 2,
    sprite: spr_houyi_god_2,
    cost: 385,
    cooldown: 420,
    description: "宗布神·后羿：全弹4倍伤害，子弹击杀化为灰烬",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_houyi_god_2
},
{
    shape: 3,
    sprite: spr_houyi_god_3,
    cost: 385,
    cooldown: 420,
    description: "至尊宗布神：全弹5倍伤害，三昧真火叠加伤害翻倍",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_houyi_god_3
}]);

register_card("gongjiang_god", obj_gongjiang_god, [
{
    shape: 0,
    sprite: spr_gongjiang_god,
    cost: 385,
    cooldown: 420,
    description: "工匠神使：发射1发河豚子弹（4倍伤害）沿固定轨迹往返，可攻击地下/陆地/飞行老鼠",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_gongjiang_god
},
{
    shape: 1,
    sprite: spr_gongjiang_god_1,
    cost: 385,
    cooldown: 420,
    description: "工匠圣神：子弹威力提升，概率附加河豚毒素",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_gongjiang_god_1
},
{
    shape: 2,
    sprite: spr_gongjiang_god_2,
    cost: 385,
    cooldown: 420,
    description: "神工天匠：子弹威力提升至5倍，概率释放河豚毒素",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_gongjiang_god_2
},
{
    shape: 3,
    sprite: spr_gongjiang_god_3,
    cost: 385,
    cooldown: 420,
    description: "至尊工匠神：第1、2列增加上下竖向子弹，子弹威力再次提升",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_gongjiang_god_3
}]);

register_card("heian_god", obj_heian_god, [
{
    shape: 0,
    sprite: spr_heian_god,
    cost: 300,
    cooldown: 1800,
    description: "黑暗神使：对周围5*5范围内的敌人造成[攻击力]伤害，15%几率冰冻3秒",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_heian_god
},
{
    shape: 1,
    sprite: spr_heian_god_1,
    cost: 300,
    cooldown: 1800,
    description: "黑暗圣神：攻击间隔缩短，对周围范围内的敌人造成伤害并冰冻",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_heian_god_1
},
{
    shape: 2,
    sprite: spr_heian_god_2,
    cost: 300,
    cooldown: 1800,
    description: "黑暗神·霍德尔：攻击范围扩大至5*7，攻击力大幅提升",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_heian_god_2
},
{
    shape: 3,
    sprite: spr_heian_god_3,
    cost: 300,
    cooldown: 1800,
    description: "至尊黑暗神：5*7范围内连续命中同一敌人伤害递增",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_heian_god_3
}]);

register_card("hundun_god", obj_hundun_god, [
{
    shape: 0,
    sprite: spr_hundun_god,
    cost: 205,
    cooldown: 1800,
    description: "混沌神使：吞噬5*5范围内的普通敌人，对精英敌人造成4500伤害，死亡时产生3*3灰烬爆炸",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hundun_god
},
{
    shape: 1,
    sprite: spr_hundun_god_1,
    cost: 205,
    cooldown: 1800,
    description: "混沌圣神：吞噬范围扩大，精英伤害提升至6000，死亡爆炸范围5*5",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hundun_god_1
},
{
    shape: 2,
    sprite: spr_hundun_god_2,
    cost: 205,
    cooldown: 1800,
    description: "上古神·混沌：纵向吞噬范围扩大，同时吞噬多个敌人",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hundun_god_2
},
{
    shape: 3,
    sprite: spr_hundun_god_3,
    cost: 205,
    cooldown: 1800,
    description: "至尊上古神：自身右侧为中心5×7范围吞噬普通鼠军，对精英鼠造成9000伤害",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hundun_god_3
}]);

register_card("guangming_god", obj_guangming_god, [
{
    shape: 0,
    sprite: spr_guangming_god,
    cost: 395,
    cooldown: 1260,
    description: "巴尔德神使：每隔一段时间在自身周围召唤5*5格圣光攻击范围内鼠军",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_guangming_god
},
{
    shape: 1,
    sprite: spr_guangming_god_1,
    cost: 395,
    cooldown: 1260,
    description: "巴尔德圣神：每放置1次黑暗神，最近的5个光明神产生3*3范围光影爆炸",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_guangming_god_1
},
{
    shape: 2,
    sprite: spr_guangming_god_2,
    cost: 395,
    cooldown: 1260,
    description: "光明神·巴德尔：黑暗神存在时光圣伤害提升至4倍，放置黑暗神触发7个光明神5*5光影爆炸",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_guangming_god_2
},
{
    shape: 3,
    sprite: spr_guangming_god_3,
    cost: 395,
    cooldown: 1260,
    description: "至尊光明神：范围扩大至7*7，黑暗神在场时伤害提升至5/8倍，放置黑暗神触发更大爆炸",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_guangming_god_3
}]);

register_card("lingrong_god", obj_lingrong_god, [
{
    shape: 0,
    sprite: spr_lingrong_god,
    cost: 25,
    cooldown: 420,
    description: "灵容神使：三合一承载卡片，可在海底、陆地、水面、岩浆上承载卡片并填补空洞",
    plant_type: "coffee",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_lingrong_god
},
{
    shape: 1,
    sprite: spr_lingrong_god_1,
    cost: 0,
    cooldown: 420,
    description: "灵容圣神：竖向生成三张，三合一承载卡片",
    plant_type: "coffee",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_lingrong_god_1
},
{
    shape: 2,
    sprite: spr_lingrong_god_2,
    cost: 0,
    cooldown: 420,
    description: "灵容天神：直接生成九张，三合一承载卡片",
    plant_type: "coffee",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_lingrong_god_2
}]);

    register_card("panduola_god", obj_panduola_god, [
{
    shape: 0,
    sprite: spr_panduola_god,
    cost: 255,
    cooldown: 2400,
    description: "潘多拉：放下立即产生3×3灰烬爆炸，本行留下3次毒气伤害",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_panduola_god
},
{
    shape: 1,
    sprite: spr_panduola_god_1,
    cost: 255,
    cooldown: 2400,
    description: "潘多拉魔盒：毒气伤害+35%",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_panduola_god_1
},
{
    shape: 2,
    sprite: spr_panduola_god_2,
    cost: 255,
    cooldown: 2400,
    description: "疫神·潘多拉：毒气范围+1列，全屏8000灰烬爆炸+鼠疫",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_panduola_god_2
},
{
    shape: 3,
    sprite: spr_panduola_god_3,
    cost: 255,
    cooldown: 2400,
    description: "终转疫神·潘多拉：全屏8000灰烬爆炸并造成三次鼠疫",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_panduola_god_3
}]);

    register_card("12yinliao", obj_12yinliao, [
    {
        shape: 0,
        sprite: spr_12yinliao,
        cost: 200,
        cooldown: 4800,
        description: "12饮料精灵：释放全屏美食，立即回满体力",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_12yinliao
    }]);

    register_card("anranxiaohunfan", obj_anranxiaohunfan, [
    {
        shape: 0,
        sprite: spr_anranxiaohunfan,
        cost: 325,
        cooldown: 3600,
        description: "黯然销魂饭：复活3*3范围内1个死亡的美食",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_anranxiaohunfan
    },
    {
        shape: 1,
        sprite: spr_anranxiaohunfan_1,
        cost: 275,
        cooldown: 3600,
        description: "培根香肠饭：耗能降低，复活3*3范围内1个死亡的美食",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_anranxiaohunfan_1
    },
    {
        shape: 2,
        sprite: spr_anranxiaohunfan_2,
        cost: 275,
        cooldown: 3600,
        description: "天妇罗盖饭：复活3*3范围内2个死亡的美食",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_anranxiaohunfan_2
    }]);
    
    register_card("dandantu", obj_dandantu, [
    {
        shape: 0,
        sprite: spr_dandantu,
        cost: 325,
        cooldown: 90 * 60,
        description: "蛋蛋兔：储存3x3范围内子弹伤害，死亡时在本行爆炸释放",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_dandantu
    },
    {
        shape: 1,
        sprite: spr_dandantu_1,
        cost: 325,
        cooldown: 90 * 60,
        description: "智能蛋蛋兔：储存3x3范围内子弹伤害，死亡时在本行爆炸释放",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_dandantu_1
    },
    {
        shape: 2,
        sprite: spr_dandantu_2,
        cost: 325,
        cooldown: 90 * 60,
        description: "外星蛋蛋兔：储存3x3范围内子弹伤害，死亡时在3行爆炸释放",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        place_preview: spr_dandantu_2
    }]);
    register_card("laipishe", obj_laipishe, [
    {
        shape: 0,
        sprite: spr_laipishe,
        cost: 365,
        cooldown: 2100,
        description: "赖皮蛇：召唤沿固定轨迹飞行的海胆子弹，伤害轨迹上的海陆空老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_laipishe
    },
    {
        shape: 1,
        sprite: spr_laipishe_1,
        cost: 365,
        cooldown: 2100,
        description: "宝石赖皮蛇：同时生成两发海胆子弹，沿固定轨迹飞行并伤害海陆空老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_laipishe_1
    },
    {
        shape: 2,
        sprite: spr_laipishe_2,
        cost: 365,
        cooldown: 2100,
        description: "大王赖皮蛇：同时生成三发海胆子弹，击杀目标后附加泡沫减速效果",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_laipishe_2
    }]);

register_card("nizhuanniu", obj_nizhuanniu, [
    {
        shape: 0,
        sprite: spr_nizhuanniu,
        cost: 150,
        cooldown: 3000,
        description: "逆转牛：将范围内普通老鼠逆转到出生位置",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_nizhuanniu
    },
    {
        shape: 1,
        sprite: spr_nizhuanniu_1,
        cost: 150,
        cooldown: 3000,
        description: "匀速逆转牛：逆转老鼠并附加伤害",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_nizhuanniu_1
    },
    {
        shape: 2,
        sprite: spr_nizhuanniu_2,
        cost: 150,
        cooldown: 3000,
        description: "光速逆转牛：逆转范围扩大到5*5",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_nizhuanniu_2
    }]);

register_card("liehuohu", obj_liehuohu, [
    {
        shape: 0,
        sprite: spr_liehuohu,
        cost: 85,
        cooldown: 3300,
        description: "烈火虎：每25~9秒生产1朵火苗（单朵价值35），储能上限1500。火苗先进入储能，收集后返还玩家；卡片消失时一次性返还剩余储能",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_liehuohu
    },
    {
        shape: 1,
        sprite: spr_liehuohu_1,
        cost: 85,
        cooldown: 3300,
        description: "煤气烈火虎：每次同时生产2朵火苗（单朵价值35），储能上限1500",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_liehuohu_1
    },
    {
        shape: 2,
        sprite: spr_liehuohu_2,
        cost: 85,
        cooldown: 3300,
        description: "燃油烈火虎：每次同时生产2朵火苗（单朵价值35），储能上限提升至3000",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_liehuohu_2
    }]);
    register_card("shegengbao", obj_shegengbao, [
    {
        shape: 0,
        sprite: spr_shegengbao,
        cost: 25,
        cooldown: 2880,
        description: "蛇羹煲：无需格子，回收目标格全部卡片的火苗能量",
        plant_type: "shegengbao",
        feature_type: "shegengbao",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shegengbao
    },
    {
        shape: 1,
        sprite: spr_shegengbao_1,
        cost: 0,
        cooldown: 2880,
        description: "厨圣蛇羹煲：无需格子，回收目标格全部卡片的火苗能量",
        plant_type: "shegengbao",
        feature_type: "shegengbao",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shegengbao_1
    },
    {
        shape: 2,
        sprite: spr_shegengbao_2,
        cost: 0,
        cooldown: 2880,
        description: "帝王蛇羹煲：无需格子，回收目标格全部卡片的火苗能量，返还翻倍",
        plant_type: "shegengbao",
        feature_type: "shegengbao",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shegengbao_2
    }]);

    // ============================================
    // 顽皮龙 - 生肖卡·龙年卡
    // 辅助型防御卡，二段选点移动卡片/角色
    // 技能强化：不支持
    // ============================================
    register_card("wanpilong", obj_wanpilong, [
    {
        shape: 0,
        sprite: spr_wanpilong,
        cost: 100,
        cooldown: 3300,
        description: "顽皮龙：选择一张己方卡片，将其移动到周围5x5范围内的空格。前摇3.1秒。该卡仅支持冷却强化，不支持技能强化。",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_wanpilong
    },
    {
        shape: 1,
        sprite: spr_wanpilong_1,
        cost: 100,
        cooldown: 3300,
        description: "捣蛋顽皮龙：选择一张己方卡片，将其移动到棋盘任意空格。前摇3.1秒。",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_wanpilong_1
    },
    {
        shape: 2,
        sprite: spr_wanpilong_2,
        cost: 100,
        cooldown: 3300,
        description: "神奇顽皮龙：选择一张己方卡片或角色，将其移动到棋盘任意空格。前摇3.1秒。",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_wanpilong_2
    }]);

    register_card("double_blade_snake", obj_double_blade_snake, [
    {
        shape: 0,
        sprite: spr_shuangrenshe,
        cost: 260,
        cooldown: 420,
        description: "双刃蛇：向前发射2发穿透剑气子弹，可斩杀生命值≤15%的普通老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shuangrenshe
    },
    {
        shape: 1,
        sprite: spr_shuangrenshe_1,
        cost: 260,
        cooldown: 420,
        description: "武士双刃蛇：向前发射3发穿透剑气子弹，可斩杀生命值≤15%的普通老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shuangrenshe_1
    },
    {
        shape: 2,
        sprite: spr_shuangrenshe_2,
        cost: 260,
        cooldown: 420,
        description: "游侠双刃蛇：向前发射4发穿透剑气子弹，可斩杀生命值≤25%的普通老鼠，精英鼠斩杀伤害提升至10倍",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_shuangrenshe_2
    }]);

    register_card("zhiyumiao", obj_zhiyumiao, [
    {
        shape: 0,
        sprite: spr_zhiyumiao,
        cost: 75,
        cooldown: 47000,
        description: "治愈喵：为5*5范围内卡片瞬间恢复5点体力",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 1,
        sprite: spr_zhiyumiao_1,
        cost: 75,
        cooldown: 47000,
        description: "武装治愈喵：为5*5范围内卡片恢复5点体力，额外增加3秒补血Buff",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 2,
        sprite: spr_zhiyumiao_2,
        cost: 75,
        cooldown: 47000,
        description: "全能治愈喵：为全屏卡片恢复5点体力，保留3秒补血Buff",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    }]);
    register_card("baobaoji", obj_baobaoji, [
    {
        shape: 0,
        sprite: spr_baobaoji,
        cost: 275,
        cooldown: 2400,
        description: "爆爆鸡：部署时清除3×3范围内的路障、梯子和鼠洞",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 1,
        sprite: spr_baobaoji_1,
        cost: 225,
        cooldown: 2400,
        description: "疯狂爆爆鸡：耗能降低，清除3×3范围内的路障、梯子和鼠洞",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 2,
        sprite: spr_baobaoji_2,
        cost: 225,
        cooldown: 2400,
        description: "酷炫爆爆鸡：清除范围扩大到5×5，清除范围内的路障、梯子和鼠洞",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    }]);

register_card("xuanfengniu", obj_xuanfengniu, [
    {
        shape: 0,
        sprite: spr_xuanfengniu,
        cost: 300,
        cooldown: 2400,
        description: "旋风牛：吹走全屏特定空中老鼠",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_xuanfengniu
    },
    {
        shape: 1,
        sprite: spr_xuanfengniu_1,
        cost: 300,
        cooldown: 2400,
        description: "强压旋风牛：额外吹走全屏老鼠产生的障碍物，并兼容C清障",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_xuanfengniu_1
    },
    {
        shape: 2,
        sprite: spr_xuanfengniu_2,
        cost: 300,
        cooldown: 2400,
        description: "极速旋风牛：不需要格子，保留全部能力",
        plant_type: "gridless",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0,
        place_preview: spr_xuanfengniu_2
    }]);

    register_card("qingse_shishi", obj_qingse_shishi, [
    {
        shape: 0,
        sprite: spr_shishi,
        cost: 140,
        cooldown: 1800,
        description: "青涩柿柿：向前方一定范围内的老鼠发起重击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 1,
        sprite: spr_shishi_1,
        cost: 140,
        cooldown: 1800,
        description: "成熟柿柿：召唤三个柿子向前方一定范围内的老鼠发起重击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    },
    {
        shape: 2,
        sprite: spr_shishi_2,
        cost: 140,
        cooldown: 1800,
        description: "柿柿如意：召唤五个柿子向前方一定范围内的老鼠发起重击",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 0
    }]);

    register_card("chongsheng_god", obj_chongsheng_god, [
    {
        shape: 0,
        sprite: spr_chongsheng_god,
        cost: 400,
        cooldown: 1800,
        description: "重生神使：5*5范围内监听卡片死亡并复活，首次触发时施加减伤BUFF",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_chongsheng_god
    },
    {
        shape: 1,
        sprite: spr_chongsheng_god_1,
        cost: 400,
        cooldown: 1800,
        description: "重生圣神：复活上限提升至6张，减伤效果增强",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_chongsheng_god_1
    },
    {
        shape: 2,
        sprite: spr_chongsheng_god_2,
        cost: 400,
        cooldown: 1800,
        description: "重生天神：复活上限6张，减伤BUFF持续时间延长",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_chongsheng_god_2
    },
    {
        shape: 3,
        sprite: spr_chongsheng_god_3,
        cost: 400,
        cooldown: 1800,
        description: "至尊重生神：范围扩大至5*7，复活上限提升至12张，减伤大幅增强",
        plant_type: "normal",
        feature_type: "normal",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_chongsheng_god_3
    }]);

    register_card("haiyang_god", obj_haiyang_god, [
    {
        shape: 0,
        sprite: spr_haiyang_god,
        cost: 360,
        cooldown: 2400,
        description: "塔拉萨神使：5x5范围喷壶类、5x1范围附加类、本行咖啡喷壶类卡片增伤",
        plant_type: "normal",
        feature_type: "haiyang_obstacle",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_haiyang_god
    },
    {
        shape: 1,
        sprite: spr_haiyang_god_1,
        cost: 360,
        cooldown: 2400,
        description: "塔拉萨圣神：5x5范围喷壶类、5x1范围附加类、本行咖啡喷壶类卡片增伤",
        plant_type: "normal",
        feature_type: "haiyang_obstacle",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_haiyang_god_1
    },
    {
        shape: 2,
        sprite: spr_haiyang_god_2,
        cost: 360,
        cooldown: 2400,
        description: "海洋女神塔拉萨：悬浮卡，5x5范围喷壶类、5x1范围附加类、本行咖啡喷壶类卡片增伤",
        plant_type: "gridless",
        feature_type: "haiyang_obstacle",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_haiyang_god_2
    },
    {
        shape: 3,
        sprite: spr_haiyang_god_3,
        cost: 360,
        cooldown: 2400,
        description: "至尊海洋女神：悬浮卡，场上满4张后全屏增幅喷壶类、附加类、咖啡喷壶类卡片",
        plant_type: "gridless",
        feature_type: "haiyang_obstacle",
        target_card: "none",
        is_gold: 1,
        place_preview: spr_haiyang_god_3
    }]);

register_card("hufa_god", obj_hufa_god, [
{
    shape: 0,
    sprite: spr_hufa_god,
    cost: 300,
    cooldown: 420,
    description: "护法神使：全屏索敌追踪穿透弹，秒杀非精英鼠，15%概率定身1.5秒",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hufa_god
},
{
    shape: 1,
    sprite: spr_hufa_god_1,
    cost: 300,
    cooldown: 420,
    description: "护法圣神：攻击力提升，魂系老鼠1.8倍伤害",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hufa_god_1
},
{
    shape: 2,
    sprite: spr_hufa_god_2,
    cost: 300,
    cooldown: 420,
    description: "护法天尊：追加地鼠目标，攻击力大幅提升",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hufa_god_2
},
{
    shape: 3,
    sprite: spr_hufa_god_3,
    cost: 300,
    cooldown: 420,
    description: "至尊护法神：终转对BOSS造成基础形态攻击力2倍伤害",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_hufa_god_3
}]);

register_card("shennong_god", obj_shennong_god, [
{
    shape: 0,
    sprite: spr_shennong_god,
    cost: 320,
    cooldown: 420,
    description: "炎帝神使：召唤固定轨迹穿透神焰攻击敌人，可攻击空中单位，击杀产生灰烬",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_shennong_god
},
{
    shape: 1,
    sprite: spr_shennong_god_1,
    cost: 320,
    cooldown: 420,
    description: "炎帝圣神：攻击力提升，召唤固定轨迹穿透神焰攻击敌人",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_shennong_god_1
},
{
    shape: 2,
    sprite: spr_shennong_god_2,
    cost: 320,
    cooldown: 420,
    description: "赤帝·炎帝：攻击力大幅提升，神焰威力增强",
    plant_type: "normal",
    feature_type: "normal",
    target_card: "none",
    is_gold: 1,
    place_preview: spr_shennong_god_2
}]);
}
