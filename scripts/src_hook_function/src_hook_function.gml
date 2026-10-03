global._move_instance_pre_arr = []
global._move_instance_map = ds_map_create()
global._last_platform = -1

#macro instance_create_depth_origfunc instance_create_depth
#macro instance_create_depth          instance_create_depth_define

// 对象池：把全局的 instance_destroy 重定向到池回收逻辑（见 scripts/obj_pool）
#macro instance_destroy_origfunc instance_destroy
#macro instance_destroy          obj_pool_instance_destroy


function instance_create_depth_define(_x, _y, _depth, _obj) {

	// 子弹 / 特效 / 敌人优先复用池中实例，池空才真正新建
	if (obj_pool_is_poolable(_obj)) {
		var _inst = obj_pool_acquire(_obj, _x, _y, _depth);
		array_push(global._move_instance_pre_arr,_inst);
		if (_obj == obj_platform)
			global._last_platform = _inst;
		return _inst;
	}

	var _inst = instance_create_depth_origfunc(_x, _y, _depth, _obj);
	array_push(global._move_instance_pre_arr,_inst);
	if (_obj == obj_platform)
		global._last_platform = _inst;

	return _inst;
}
