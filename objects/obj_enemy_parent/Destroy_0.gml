// 从全局类型注册表注销
if (enemy_registered && variable_global_exists("enemy_by_type")) {
	var _list = global.enemy_by_type[$ enemy_registered_type];
	var _idx = array_get_index(_list, id);
	if (_idx != -1) array_delete(_list, _idx, 1);
	enemy_registered = false;
}

// 吹走移除时不产生金币奖励（如旋风牛的吹走效果）
var _blown_away = false;
if (variable_instance_exists(id, "is_blown_away")) {
    _blown_away = is_blown_away;
}

if !global.laboretory_room && !_blown_away{
	var is_drop = random_range(0,100)
	if is_drop < 10{
		instance_create_depth(x,y-50,depth-200,obj_coin)
	}
}
