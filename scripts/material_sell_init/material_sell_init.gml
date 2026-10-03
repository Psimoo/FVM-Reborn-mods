function material_sell_init(){
	global.material_sell_prices = {}
	global.material_sell_prices[$ "clover_1"] = 2000
	global.material_sell_prices[$ "clover_2"] = 3000
	global.material_sell_prices[$ "clover_3"] = 4000
	global.material_sell_prices[$ "natural_spices"] = 30
	global.material_sell_prices[$ "secret_spices"] = 60
	global.material_sell_prices[$ "royal_spices"] = 90
	global.material_sell_prices[$ "less_crystal"] = 75
	global.material_sell_prices[$ "middle_crystal"] = 150
	global.material_sell_prices[$ "cross_server_gold_medal"] = 200
	global.material_sell_prices[$ "cross_server_silver_medal"] = 100
}

function get_material_sell_price(material_id){
	if variable_global_exists("material_sell_prices") && variable_struct_exists(global.material_sell_prices, material_id){
		return global.material_sell_prices[$ material_id]
	}
	return 0
}
