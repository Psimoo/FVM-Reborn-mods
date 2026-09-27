image_xscale = 1.6;
image_yscale = 1.6;
image_speed = 0;
parent_player = -4;
atk = 0;
cycle = 0;
grid_col = 0;
grid_row = 0;
flash_speed = 6;
attack_anim = 6;
timer = 0;
state = CARD_STATE.IDLE;
attack_timer = 0;
weapon_id = "star_wand";
weapon_info = get_weapon_info(weapon_id);
atk = weapon_info.atk;
cycle = weapon_info.cycle;
bullet_count = weapon_info.bullet_amount;
bullet_style = weapon_info.bullet_style;
splash_ratio = weapon_info.splash_ratio;
diz_chance = weapon_info.diz_chance;

if (get_gem_index("star_wand_gem_5") != -1)
{
    bullet_style = weapon_info.bullet_style_impact[get_gem_level("star_wand_gem_5")];
    splash_ratio = weapon_info.splash_ratio_impact_enhanced[get_gem_level("star_wand_gem_5")];
}
else if (get_gem_index("star_wand_gem_1") != -1)
{
    bullet_style = weapon_info.bullet_style_impact[get_gem_level("star_wand_gem_1")];
    splash_ratio = weapon_info.splash_ratio_impact[get_gem_level("star_wand_gem_1")];
}

if (get_gem_index("star_wand_gem_2") != -1)
    atk = weapon_info.atk_impact[get_gem_level("star_wand_gem_2")];

if (get_gem_index("star_wand_gem_3") != -1)
    bullet_count = weapon_info.bullet_count[get_gem_level("star_wand_gem_3")];

if (get_gem_index("star_wand_gem_4") != -1)
{
    cycle = weapon_info.cycle_impact[get_gem_level("star_wand_gem_4")];
    diz_chance = weapon_info.diz_chance_impact[get_gem_level("star_wand_gem_4")];
}

bullet_shape = spr_star_wand_bullet;

switch (bullet_style)
{
    case 1:
        bullet_shape = spr_star_wand_bullet_1;
        break
    
    case 2:
        bullet_shape = spr_star_wand_bullet_2;
        break
    
    case 3:
        bullet_shape = spr_star_wand_bullet_3;
        break
    
    case 4:
        bullet_shape = spr_star_wand_bullet_4;
        break
}

target_type = "all";
damage_type = "normal";
explode_timer = 24;
fire_interval = 2;
fire_queue = [];
fire_cd = 0;
burst_idx = 0;
pending_hits = [];
cur_hit = -4;
