image_xscale = 1.6;
image_yscale = 1.6;
image_speed = 0;
image_alpha = 0;
parent_player = noone;
atk = 0;
cycle = 0;
grid_col = 0;
grid_row = 0;
flash_speed = 6;
attack_anim = 6;
timer = 0;
state = CARD_STATE.IDLE;
attack_timer = 0;
weapon_id = "shield";
var _shield_wid = global.save_data.equipped_items.secondary_weapon.id;

if (_shield_wid != "")
{
    var _shield_info = get_weapon_info(_shield_wid);
    
    if (!is_undefined(_shield_info))
        sprite_index = _shield_info.sprite;
}

is_gods_shield = _shield_wid == "gods_shield";
is_master_shield = _shield_wid == "master_shield";
is_rose_shield = _shield_wid == "rose_shield";
produce_gem = false;
slow_down_gem = false;
bleed_gem = false;
guard_gem = false;
strength_gem = false;
hp_modified_card_list = [];
atk_modified_card_list = [];
blacklist = ["loki", "aurora", "player", "cherry_pudding", "brazier"];
origin_x = x;
origin_y = y;
player_x = 0;
player_y = 0;
t = 0;
t_speed = 0.5;
t_dir = 1;
anim_timer = 0;

if (get_gem_index("produce_gem") != -1)
{
    var gem_info = get_gem_info("produce_gem");
    var gem_level = get_gem_level("produce_gem");
    cycle = gem_info.cycle[gem_level] * 60;
    flame_produce = gem_info.flame_value[gem_level];
    first_produce_delay = gem_info.first_produce_delay * 60;
    first_produce = false;
    produce_gem = true;
}

if (get_gem_index("slow_down_gem") != -1)
{
    slow_down_gem = true;
    var gem_info = get_gem_info("slow_down_gem");
    var gem_level = get_gem_level("slow_down_gem");
    
    if (gem_level > 10)
        gem_level = 10;
    
    slow_down_cycle = gem_info.cooldown[gem_level] * 60;
}

if (get_gem_index("bleed_gem") != -1)
{
    bleed_gem = true;
    var gem_info = get_gem_info("bleed_gem");
    var gem_level = get_gem_level("bleed_gem");
    
    if (gem_level > 10)
        gem_level = 10;
    
    bleed_damage = gem_info.atk[gem_level];
}

if (get_gem_index("guard_gem") != -1)
{
    guard_gem = true;
    var gem_info = get_gem_info("guard_gem");
    var gem_level = get_gem_level("guard_gem");
    
    if (gem_level > 10)
        gem_level = 10;
    
    max_hp_increase = gem_info.max_hp_increase[gem_level];
}

if (get_gem_index("strength_gem") != -1)
{
    strength_gem = true;
    var gem_info = get_gem_info("strength_gem");
    var gem_level = get_gem_level("strength_gem");
    
    if (gem_level > 10)
        gem_level = 10;
    
    atk_ratio = gem_info.atk_ratio[gem_level];
}

gods_flame_gem = false;
gods_flame_value = 0;
gods_flame_cycle = 0;
gods_flame_first_delay = 0;
gods_flame_first = false;
var _fid = "";

if (get_gem_index("gods_shield_gem_1") != -1)
{
    _fid = "gods_shield_gem_1";
    gods_flame_gem = true;
}
else if (get_gem_index("master_shield_gem_1") != -1)
{
    _fid = "master_shield_gem_1";
    gods_flame_gem = true;
}
else if (get_gem_index("divine_blessing_gem") != -1)
{
    _fid = "divine_blessing_gem";
    gods_flame_gem = true;
}

if (gods_flame_gem)
{
    var _gi = get_gem_info(_fid);
    var _gl = get_gem_level(_fid);
    gods_flame_cycle = _gi.cycle[_gl] * 60;
    gods_flame_value = _gi.flame_value[_gl];
    gods_flame_first_delay = _gi.first_produce_delay * 60;
}

gods_damage_gem = false;
gods_damage_atk = 0;
gods_damage_rate = 0;
gods_damage_max = 0;
gods_damage_range = 1;
var _did = "";

if (get_gem_index("gods_shield_gem_2") != -1)
{
    _did = "gods_shield_gem_2";
    gods_damage_gem = true;
    gods_damage_range = 1;
}
else if (get_gem_index("master_shield_gem_2") != -1)
{
    _did = "master_shield_gem_2";
    gods_damage_gem = true;
    gods_damage_range = 2;
}

if (gods_damage_gem)
{
    var _gi = get_gem_info(_did);
    var _gl = get_gem_level(_did);
    gods_damage_atk = _gi.atk[_gl];
    gods_damage_rate = _gi.rate[_gl];
    gods_damage_max = _gi.max_damage[_gl];
}

gods_buff_gem = false;
gods_buff_inner = 0;
gods_buff_outer = 0;
gods_buff_card_list = [];
var _bid = "";

if (get_gem_index("gods_shield_gem_3") != -1)
{
    _bid = "gods_shield_gem_3";
    gods_buff_gem = true;
}
else if (get_gem_index("master_shield_gem_3") != -1)
{
    _bid = "master_shield_gem_3";
    gods_buff_gem = true;
}

if (gods_buff_gem)
{
    var _gi = get_gem_info(_bid);
    var _gl = get_gem_level(_bid);
    gods_buff_inner = _gi.ratio_inner[_gl];
    gods_buff_outer = _gi.ratio_outer[_gl];
}

divine_protect_gem = false;
divine_protect_ratio = 0;

if (get_gem_index("divine_protect_gem") != -1)
{
    divine_protect_gem = true;
    var _gi = get_gem_info("divine_protect_gem");
    var _gl = get_gem_level("divine_protect_gem");

    if (_gl > 15)
        _gl = 15;

    divine_protect_ratio = _gi.atk_ratio[_gl];
}

divine_holy_gem = false;
divine_holy_atk = 0;
divine_holy_ice_timer = 0;

if (get_gem_index("divine_holy_gem") != -1)
{
    divine_holy_gem = true;
    var _gi = get_gem_info("divine_holy_gem");
    var _gl = get_gem_level("divine_holy_gem");

    if (_gl > 15)
        _gl = 15;

    divine_holy_atk = _gi.atk[_gl];
    divine_holy_ice_timer = _gi.ice_timer[_gl];
}

gods_hp_gem = false;
gods_hp_rate = 0;
gods_hp_card_list = [];

if (get_gem_index("gods_shield_gem_4") != -1)
{
    gods_hp_gem = true;
    var _gi = get_gem_info("gods_shield_gem_4");
    var _gl = get_gem_level("gods_shield_gem_4");
    gods_hp_rate = _gi.max_hp_increase_rate[_gl];
}

master_eye_gem = false;
master_eye_atk = 0;
master_eye_slow = 0;
master_eye_hit_map = ds_map_create();
rose_flame_gem = false;
rose_flame_value = 0;
rose_flame_cycle = 0;
rose_flame_first_delay = 0;
rose_flame_first = false;

if (get_gem_index("rose_shield_gem_1") != -1)
{
    rose_flame_gem = true;
    var _gi = get_gem_info("rose_shield_gem_1");
    var _gl = get_gem_level("rose_shield_gem_1");
    rose_flame_cycle = _gi.cycle[_gl] * 60;
    rose_flame_value = _gi.flame_value[_gl];
    rose_flame_first_delay = _gi.first_produce_delay * 60;
}

rose_needle_gem = false;
rose_needle_atk = 0;
rose_needle_count = 0;
rose_needle_cycle = 0;

if (get_gem_index("rose_shield_gem_2") != -1)
{
    rose_needle_gem = true;
    var _gi = get_gem_info("rose_shield_gem_2");
    var _gl = get_gem_level("rose_shield_gem_2");
    rose_needle_atk = _gi.atk[_gl];
    rose_needle_count = _gi.bullet_count[_gl];
    rose_needle_cycle = _gi.cycle[_gl] * 60;
    rose_needle_wave = 0;
    rose_needle_cd = 0;
}

rose_buff_gem = false;
rose_buff_ratio = 0;
rose_buff_inner = 0;
rose_buff_outer = 0;
rose_buff_type = "";
rose_buff_card_list = [];

if (get_gem_index("rose_shield_gem_5") != -1)
{
    rose_buff_gem = true;
    rose_buff_type = "5x7";
    var _gi = get_gem_info("rose_shield_gem_5");
    var _gl = get_gem_level("rose_shield_gem_5");
    rose_buff_ratio = _gi.ratio[_gl];
}
else if (get_gem_index("rose_shield_gem_3") != -1)
{
    rose_buff_gem = true;
    rose_buff_type = "5x5";
    var _gi = get_gem_info("rose_shield_gem_3");
    var _gl = get_gem_level("rose_shield_gem_3");
    rose_buff_inner = _gi.ratio_inner[_gl];
    rose_buff_outer = _gi.ratio_outer[_gl];
}

rose_dmg_gem = false;
rose_dmg_atk_f = 0;
rose_dmg_atk = 0;
rose_dmg_rate = 0;
rose_dmg_max = 0;
rose_dmg_fhit_map = ds_map_create();

if (get_gem_index("rose_shield_gem_4") != -1)
{
    rose_dmg_gem = true;
    var _gi = get_gem_info("rose_shield_gem_4");
    var _gl = get_gem_level("rose_shield_gem_4");
    rose_dmg_atk_f = _gi.atk_f[_gl];
    rose_dmg_atk = _gi.atk[_gl];
    rose_dmg_rate = _gi.rate[_gl];
    rose_dmg_max = _gi.max_damage[_gl];
}

spawn_x = x;
spawn_y = y;
aura_created = false;
shield_vfx_insts = [];

if (get_gem_index("master_shield_gem_4") != -1)
{
    master_eye_gem = true;
    var _gi = get_gem_info("master_shield_gem_4");
    var _gl = get_gem_level("master_shield_gem_4");
    master_eye_atk = _gi.atk[_gl];
    master_eye_slow = _gi.ice_timer[_gl] * 60;
}
