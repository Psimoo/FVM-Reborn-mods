if global.is_paused{
	exit
}
timer ++
image_index = (floor(timer/3) )mod 15
if timer > 180{
	disabled = true
	image_alpha = (190-timer)/10
	if timer > 190{
		instance_destroy()
	}
}
// 每60帧造成一次毒伤
if timer mod 60 == 30 && not disabled{
	var _x = x;
	var _y = y;
	var _range = 200;
	with (obj_enemy_parent) {
		if (hp > 0 && point_distance(x, y, _x, _y) < _range && grid_row >= other.grid_row-1 && grid_row <= other.grid_row+1 and can_hit(other.target_type, target_type)) {
			// 对敌人造成毒伤
			damage_amount = other.damage;
			damage_type = other.damage_type;
			event_user(0);
		}
	}
}
