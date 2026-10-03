random_gift_prepare_selected_deck();
create_battle_slots();

// 提前加载本关贴图分组（和开始按钮同样的逻辑，但任何入口进关都会执行）。
// 否则第一次画出某张贴图时才加载纹理页，表现为"第一次开火/第一次出怪顿一下"。
texture_prefetch("bullet");
texture_prefetch("effects");
if global.map_id == "tower_cake"{
	texture_prefetch("enemy_tower")
}
else if global.map_id == "undersea_vortex"{
	texture_prefetch("pack_undersea_vortex")
}
texture_prefetch("time_god");

// 按本关卡组预热子弹/特效空壳（见 scripts/obj_pool_deck）
obj_pool_prewarm_deck();
