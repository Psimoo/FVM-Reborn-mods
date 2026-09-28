if (global.is_paused)
	exit;

event_inherited();

if (is_frozen || state == CARD_STATE.SLEEP)
	exit;

var current_flash_speed = flash_speed;
if (is_slowdown)
	current_flash_speed *= 2;

var _check_col_range = grid_range_col;
var _check_row_range = grid_range_row;
var _check_row = grid_row;
var _check_col = grid_col;
if (shape >= 3)
    _check_col = grid_col + 1;

var has_enemy = false;
if (state == CARD_STATE.IDLE)
{
	with (obj_enemy_parent)
	{
		if (hp > 0)
		{
			var _rd = abs(grid_row - _check_row);
			var _cd = abs(grid_col - _check_col);
			if (_rd <= _check_row_range && _cd <= _check_col_range && can_target_on(other.target_type, target_type))
			{
				has_enemy = true;
				other.enemy_encounted = true;
				if (array_get_index(other.target_enemy, id) == -1)
					array_push(other.target_enemy, id);
			}
		}
	}
}

if (state == CARD_STATE.IDLE)
{
	anim_frame += 1;
	if (anim_frame > (f_idle_end + 1) * current_flash_speed)
		anim_frame = 0;
	image_index = floor(anim_frame / current_flash_speed);
	if (image_index > f_idle_end)
		image_index = f_idle_end;

	attack_timer += 1;
	if (has_enemy && attack_timer >= cycle)
	{
		state = CARD_STATE.ATTACK;
		enemy_hitted = false;
		is_digesting = false;
		attack_timer = 0;
		if (f_suction_start >= 0)
			anim_frame = f_suction_start * current_flash_speed;
		else
			anim_frame = f_attack_start * current_flash_speed;
	}
}
else if (state == CARD_STATE.ATTACK)
{
	if (is_digesting)
	{
		digest_timer -= 1;
		var _digest_range = f_digest_end - f_eat;
		if (_digest_range > 0)
		{
			var _elapsed = digest_timer_max - digest_timer;
		var _frame_offset = floor(_elapsed / current_flash_speed) mod _digest_range;
		image_index = f_eat + _frame_offset;
		}
		else
		{
			image_index = f_eat;
		}

		if (digest_timer <= 0)
		{
			is_digesting = false;
			anim_frame = f_digest_end * current_flash_speed;
			image_index = f_digest_end;
		}
	}
	else
	{
		anim_frame += 1;
		image_index = floor(anim_frame / current_flash_speed);
	}

	var _frame = image_index;

	if (!is_digesting && f_suction_start >= 0 && _frame >= f_suction_start && _frame <= f_suction_end)
	{
		var _front_x = x + global.grid_cell_size_x;
		var _front_y = y;
		var _pull_step = 4;
		with (obj_enemy_parent)
		{
			if (hp > 0 && !is_boss)
			{
				var _rd = abs(grid_row - _check_row);
				var _cd = abs(grid_col - _check_col);
				if (_rd <= _check_row_range && _cd <= _check_col_range && can_target_on(other.target_type, target_type))
				{
					var _dx = _front_x - x;
					var _dy = _front_y - y;
					if (abs(_dx) > _pull_step) x += sign(_dx) * _pull_step;
					else x = _front_x;
					if (abs(_dy) > _pull_step) y += sign(_dy) * _pull_step;
					else y = _front_y;
				}
			}
		}
	}

	if (_frame >= f_eat && !enemy_hitted)
	{
		event_user(1);
	}

	if (enemy_hitted && !is_digesting && _frame >= f_eat && _frame < f_digest_end)
	{
		is_digesting = true;
		var _base_digest = origin_digest_time;
		if (is_slowdown)
			_base_digest *= 2;
		digest_timer = _base_digest;
		digest_timer_max = _base_digest;
	}

	var _max_frame = sprite_get_number(sprite_index) - 1;
	if (!is_digesting && (_frame >= f_recover_end || _frame >= _max_frame))
	{
		state = CARD_STATE.IDLE;
		timer = 0;
		attack_timer = 0;
		anim_frame = 0;
		image_index = 0;
		enemy_hitted = false;
		enemy_encounted = false;
		target_enemy = [];
	}
}
else if (state != CARD_STATE.SLEEP)
{
	state = CARD_STATE.IDLE;
	timer = 0;
	anim_frame = 0;
	image_index = 0;
}
