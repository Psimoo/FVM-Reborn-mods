random_gift_prepare_selected_deck();
create_battle_slots();

texture_prefetch("bullet");
texture_prefetch("effects");
if global.map_id == "tower_cake"{
	texture_prefetch("enemy_tower")
}
else if global.map_id == "undersea_vortex"{
	texture_prefetch("pack_undersea_vortex")
}
texture_prefetch("time_god");

obj_pool_prewarm_deck();
