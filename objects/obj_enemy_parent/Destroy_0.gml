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

// 池化回收 / 清局销毁时不再重复掉落（死亡掉落已在回收前结算）
var _rewarded = variable_instance_exists(id, "death_reward_processed") && death_reward_processed;
var _cleanup = variable_instance_exists(id, "pool_cleanup") && pool_cleanup;
if !global.laboretory_room && !_blown_away && !_rewarded && !_cleanup{
    var is_drop = random_range(0,100)
    if is_drop < 10{
        instance_create_depth(x,y-50,depth-200,obj_coin)
    }
}
