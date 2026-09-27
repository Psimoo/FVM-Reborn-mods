event_inherited();

var _exp_range = explosion_range;
var _center_x = x + global.grid_cell_size_x;
if (shape >= 3)
	_exp_range = 2.5 * global.grid_cell_size_x;

var _effect_spr = spr_hundun_god_effect;
if (shape == 1)
	_effect_spr = spr_hundun_god_effect_1;
else if (shape >= 2)
	_effect_spr = spr_hundun_god_effect_2;

var _effect_inst = instance_create_depth(_center_x, y, depth - 1, obj_hundun_god_effect);
if (instance_exists(_effect_inst))
{
	_effect_inst.sprite_index = _effect_spr;
	_effect_inst.is_one_shot = true;
	_effect_inst.frame_counter = 0;
	_effect_inst.flash_speed = 1.5;
	_effect_inst.image_xscale = 1;
	_effect_inst.image_yscale = 1;
}

with (obj_enemy_parent)
{
	if (hp > 0)
	{
		var dx = x - _center_x;
		var dy = y - other.y;
		if (abs(dx) <= _exp_range && abs(dy) <= _exp_range)
		{
			if (!immune_to_ash)
			{
				if ((is_boss || string_pos("infected_", mouse_id) == 1) && special_ash)
				{
					var _ash = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
					_ash.special_ash = true;
					_ash.sprite_index = sprite_index;
					_ash.image_index = image_index;
				}
				else
				{
					instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
				}
				instance_destroy();
			}
			else
			{
				damage_amount = other.elite_damage;
				damage_type = "pierce";
				event_user(0);
			}
		}
	}
}
