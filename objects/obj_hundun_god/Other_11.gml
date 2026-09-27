var _elite_damage = elite_damage
var _double_hit = double_hit
var _grid_range_col = grid_range_col
var _grid_range_row = grid_range_row
var _center_row = grid_row
var _center_col = grid_col
if (shape >= 3)
	_center_col += 1

if shape == 0{
	if array_length(target_enemy) > 0{
		var target_inst = target_enemy[0]
		if instance_exists(target_inst){
			with target_inst{
				if can_hit(other.target_type, target_type){
					if !immune_to_ash && hp > 0{
						instance_destroy()
						other.enemy_hitted = true
					}
					else if hp > 0{
						var _dmg = _elite_damage
						if _double_hit
							_dmg = _elite_damage * 2
						damage_amount = _dmg
						damage_type = "pierce"
						event_user(0)
						other.enemy_hitted = true
					}
				}
			}
		}
	}
}
else{
	var _kill_list = []
	var _dmg_list = []

	with obj_enemy_parent{
		if hp > 0{
			var _rd = abs(grid_row - _center_row)
			var _cd = abs(grid_col - _center_col)
			if _rd <= _grid_range_row && _cd <= _grid_range_col && can_hit(other.target_type, target_type){
				if !immune_to_ash
					array_push(_kill_list, id)
				else
					array_push(_dmg_list, id)
			}
		}
	}

	for (var i = 0; i < array_length(_kill_list); i++){
		if instance_exists(_kill_list[i])
			instance_destroy(_kill_list[i])
	}

	var _dmg = _elite_damage
	if _double_hit
		_dmg = _elite_damage * 2
	for (var i = 0; i < array_length(_dmg_list); i++){
		if instance_exists(_dmg_list[i]){
			with _dmg_list[i]{
				damage_amount = _dmg
				damage_type = "pierce"
				event_user(0)
			}
		}
	}

	if array_length(_kill_list) > 0 || array_length(_dmg_list) > 0
		enemy_hitted = true
}

array_delete(target_enemy, 0, array_length(target_enemy))
