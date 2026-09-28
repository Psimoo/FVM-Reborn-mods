function mod_enemy_init()
{
    register_enemy("infected_normal_mouse", 
    {
        name: "平民僵尸鼠",
        _obj: obj_infected_normal_mouse,
        hp: 360,
        shield: 0,
        description: "平民僵尸鼠：被感染的普通老鼠，无特殊能力",
        speed: 0.3,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_normal_mouse,
        feature: "land"
    });
    register_enemy("infected_football_fan_mouse", 
    {
        name: "球迷僵尸鼠",
        _obj: obj_infected_football_fan_mouse,
        hp: 720,
        shield: 0,
        description: "球迷僵尸鼠：被感染的球迷鼠，生命值稍高",
        speed: 0.3,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_football_fan_mouse_helmet,
        feature: "land"
    });
    register_enemy("infected_iron_pan_mouse", 
    {
        name: "铁锅僵尸鼠",
        _obj: obj_infected_iron_pan_mouse,
        hp: 1800,
        shield: 0,
        description: "铁锅僵尸鼠：被感染的铁锅鼠，生命值较高",
        speed: 0.3,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_iron_pan_mouse_helmet,
        feature: "land"
    });
    register_enemy("infected_giant_mouse", 
    {
        name: "巨型僵尸鼠",
        _obj: obj_infected_giant_mouse,
        hp: 3600,
        shield: 0,
        description: "巨型僵尸鼠：被感染的巨人鼠，生命值和伤害极高",
        speed: 0.27,
        atk: 1800,
        cycle: 108,
        range: 180,
        ash_proof: true,
        spr: spr_infected_giant_mouse,
        feature: "land"
    });
    register_enemy("infected_kangaroo", 
    {
        name: "跳跳僵尸鼠",
        _obj: obj_infected_kangaroo,
        hp: 540,
        shield: 0,
        description: "跳跳僵尸鼠：被感染的跳跳鼠，能连续跳过卡片",
        speed: 0.9,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_kangaroo,
        feature: "land"
    });
    register_enemy("infected_landlady_mouse", 
    {
        name: "房东僵尸鼠",
        _obj: obj_infected_landlady_mouse,
        hp: 720,
        shield: 2280,
        description: "房东僵尸鼠：被感染的房东鼠，能抵挡直射子弹",
        speed: 0.3,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_landlady_mouse_shield,
        feature: "land"
    });
    register_enemy("infected_roller_skating_mouse", 
    {
        name: "轮滑僵尸鼠",
        _obj: obj_infected_roller_skating_mouse,
        hp: 3000,
        shield: 0,
        description: "轮滑僵尸鼠：被感染的轮滑鼠，生命值极高且速度快",
        speed: 0.6,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_roller_skating_mouse_helmet,
        feature: "land"
    });
    register_enemy("infected_skateboard_mouse", 
    {
        name: "滑板僵尸鼠",
        _obj: obj_infected_skateboard_mouse,
        hp: 720,
        shield: 0,
        description: "滑板僵尸鼠：被感染的滑板鼠，速度快且能跳过卡片",
        speed: 0.9,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_skateboard_mouse_skate,
        feature: "land"
    });
    register_enemy("infected_panda_mouse", 
    {
        name: "熊猫僵尸鼠",
        _obj: obj_infected_panda_mouse,
        hp: 3600,
        shield: 0,
        description: "熊猫鼠：被感染的熊猫鼠，会投出小熊猫僵尸鼠",
        speed: 0.27,
        atk: 1800,
        cycle: 108,
        range: 180,
        ash_proof: true,
        spr: spr_infected_panda_mouse_has_small,
        feature: "land"
    });
    register_enemy("infected_little_panda_mouse", 
    {
        name: "小熊猫僵尸鼠",
        _obj: obj_infected_little_panda_mouse,
        hp: 360,
        shield: 0,
        description: "小熊猫僵尸鼠：由熊猫僵尸鼠投掷出的小熊猫僵尸鼠",
        speed: 0.3,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: false,
        spr: spr_infected_little_panda,
        feature: "land"
    });
    register_enemy("infected_paper_boat_mouse", 
    {
        name: "纸船僵尸鼠",
        _obj: obj_infected_paper_boat_mouse,
        hp: 360,
        shield: 0,
        description: "纸船僵尸鼠：被感染的纸船鼠，无特殊能力",
        speed: 0.36,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_paper_boat_mouse_land,
        feature: "water"
    });
    register_enemy("infected_duck_mouse", 
    {
        name: "鸭子泳圈僵尸鼠",
        _obj: obj_infected_duck_mouse,
        hp: 720,
        shield: 0,
        description: "鸭子泳圈僵尸鼠：被感染的鸭子泳圈鼠，生命值稍高",
        speed: 0.36,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_duck_mouse_land_helmet,
        feature: "water"
    });
    register_enemy("infected_tropical_fish_mouse", 
    {
        name: "热带鱼泳圈僵尸鼠",
        _obj: obj_infected_tropical_fish_mouse,
        hp: 1800,
        shield: 0,
        description: "热带鱼泳圈僵尸鼠：被感染的热带鱼泳圈鼠，生命值较高",
        speed: 0.36,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_tropical_fish_mouse_land_helmet,
        feature: "water"
    });
    register_enemy("infected_diver_mouse", 
    {
        name: "潜水僵尸鼠",
        _obj: obj_infected_diver_mouse,
        hp: 360,
        shield: 0,
        description: "潜水僵尸鼠：被感染的潜水鼠，不攻击时潜在水面下",
        speed: 0.6,
        atk: 20,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_diver_mouse_up,
        feature: "water"
    });
    register_enemy("infected_frog_prince_mouse", 
    {
        name: "青蛙王子僵尸鼠",
        _obj: obj_infected_frog_prince_mouse,
        hp: 720,
        shield: 0,
        description: "青蛙王子僵尸鼠：被感染的青蛙王子鼠，可越过障碍",
        speed: 2.25,
        atk: 20,
        cycle: 36,
        range: 180,
        ash_proof: true,
        spr: spr_infected_frog_prince_mouse_land,
        feature: "water"
    });
    register_enemy("infected_submarine_mouse", 
    {
        name: "水潜艇僵尸鼠",
        _obj: obj_infected_submarine_mouse,
        hp: 1200,
        shield: 0,
        description: "水潜艇僵尸鼠：被僵尸鼠操控的水潜艇，装甲完整且不攻击时潜水",
        speed: 0.6,
        atk: 30,
        cycle: 24,
        range: 120,
        ash_proof: true,
        spr: spr_infected_submarine_mouse_land,
        feature: "water"
    });
    register_enemy("infected_mario_mouse", 
    {
        name: "变异洞君",
        _obj: obj_infected_mario_mouse,
        hp: 80000,
        shield: 0,
        description: "变异洞君：被感染后变得更加强大的洞君",
        speed: 0.3,
        atk: 10,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_mario_mouse_idle,
        feature: "land"
    });
    register_enemy("infected_arno", 
    {
        name: "变异阿诺",
        _obj: obj_infected_arno,
        hp: 100000,
        shield: 0,
        description: "变异阿诺：被感染后变得更加强大的阿诺",
        speed: 0.3,
        atk: 10,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_arno_skill_1,
        feature: "land"
    });
    register_enemy("infected_fire_residue", 
    {
        name: "感染火渣",
        _obj: obj_infected_fire_residue,
        hp: 12000,
        shield: 0,
        description: "感染火渣：被感染的火渣，掌控火焰之力",
        speed: 0.3,
        atk: 10,
        cycle: 36,
        range: 90,
        ash_proof: true,
        spr: spr_infected_bingzha_fire_skill_1,
        feature: "land"
    });
}
