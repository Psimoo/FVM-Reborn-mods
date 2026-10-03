var _x = x;
var _y = y;
var _range = 320
var _row_range = 2

with (obj_enemy_parent) {
	if (abs(x - other.x) < _range && abs(grid_row-other.grid_row) <= _row_range){
		damage_amount = other.atk;
		damage_type = "normal";
		event_user(0)
	}
}
