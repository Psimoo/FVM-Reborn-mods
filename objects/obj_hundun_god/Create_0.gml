event_inherited();
plant_id = "hundun_god";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
{
	var _info = get_card_info_simple(plant_id);
	if (_info != false)
	{
		shape = _info.shape;
		if (current_level == 0)
			current_level = _info.level;
		if (skill == 0)
			skill = _info.skill;
	}
}

if (shape == 0)
	sprite_index = spr_hundun_god;
else if (shape == 1)
	sprite_index = spr_hundun_god_1;
else if (shape == 2)
	sprite_index = spr_hundun_god_2;
else if (shape == 3)
	sprite_index = spr_hundun_god_3;

flash_speed = 5;
plant_type = "normal";
is_slowdown = false;
image_speed = 0;

if (shape == 0)
{
	f_idle_end = 9;
	f_attack_start = 9;
	f_attack_end = 24;
	f_eat = 25;
	f_digest_end = 45;
	f_recover_end = 55;
	f_suction_start = -1;
	f_suction_end = -1;
}
else if (shape == 1)
{
	f_idle_end = 9;
	f_suction_start = 10;
	f_suction_end = 22;
	f_attack_start = 23;
	f_attack_end = 31;
	f_eat = 31;
	f_digest_end = 56;
	f_recover_end = 56;
}
else
{
	f_idle_end = 9;
	f_suction_start = 10;
	f_suction_end = 21;
	f_attack_start = 22;
	f_attack_end = 34;
	f_eat = 34;
	f_digest_end = 57;
	f_recover_end = 57;
}

// 消化时间 (digestion time) per star level, in frames (at 60fps)
// 35,34,33,32,31,30,28,26,24,22,20,18,16,13,10,7,4,3,2 seconds
var _digest_times = [2100, 2040, 1980, 1920, 1860, 1800, 1680, 1560, 1440, 1320, 1200, 1080, 960, 780, 600, 420, 240, 180, 120];
var _level_idx = clamp(current_level, 0, 18);
digest_time = _digest_times[_level_idx];
origin_digest_time = digest_time;
digest_timer = 0;
digest_timer_max = 0;
is_digesting = false;

anim_frame = 0;
attack_timer = 0;

target_enemy = [];
enemy_encounted = false;
enemy_hitted = false;

grid_range_col = 2;
grid_range_row = 2;
if (shape >= 1)
{
	grid_range_col = 3;
	grid_range_row = 3;
}
if (shape >= 2)
{
	grid_range_col = 3;
	grid_range_row = 4;
}
if (shape >= 3)
{
	grid_range_col = 2;
	grid_range_row = 3;
}

elite_damage = 4500;
if (shape == 1)
	elite_damage = 6000;
else if (shape == 2)
	elite_damage = 6000;
else if (shape >= 3)
	elite_damage = 9000;

explosion_range = 1.5 * global.grid_cell_size_x;
if (shape >= 1)
	explosion_range = 2.5 * global.grid_cell_size_x;

double_hit = true;
