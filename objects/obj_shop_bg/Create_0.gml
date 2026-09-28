image_xscale = 0.9
image_yscale = 0.9

is_submenu_opened = false
shop_button_select = 1
shop_screen_select = 1
current_page = 1
current_max_page = 10

goods_list = ds_list_create()

instance_create_depth(x+800,y-430,depth-1,obj_closeshop_btn)

//创建商店栏位选择按钮
var btn1 = instance_create_depth(x-743,y-363,depth-1,obj_shop_select_btn)
btn1.button_index = 1
btn1.sprite_index = spr_shop_select_btn_1
var btn2 = instance_create_depth(x-560,y-363,depth-1,obj_shop_select_btn)
btn2.button_index = 2
btn2.sprite_index = spr_shop_select_btn_2
var btn3 = instance_create_depth(x-377,y-363,depth-1,obj_shop_select_btn)
btn3.button_index = 3
btn3.sprite_index = spr_shop_select_btn_3
var btn4 = instance_create_depth(x-194,y-363,depth-1,obj_shop_select_btn)
btn4.button_index = 4
btn4.sprite_index = spr_shop_select_btn_4
var btn5 = instance_create_depth(x-11,y-363,depth-1,obj_shop_select_btn)
btn5.button_index = 5
btn5.sprite_index = spr_shop_select_btn_5

var prev_btn = instance_create_depth(x+285,y+435,depth-1,obj_shop_page_btn)
prev_btn.btn_type = "prev"
var next_btn = instance_create_depth(x+485,y+435,depth-1,obj_shop_page_btn)
next_btn.btn_type = "next"

shop_list_recharge()

//刷新商品列表的函数
function shop_list_recharge(){
	ds_list_clear(goods_list)
	
	var map_array = []

	ds_map_keys_to_array(global.goods_map,map_array)

	var goods_array_size = array_length(map_array)

	//武器和宝石分类：先显示武器，再显示宝石，同一个武器的宝石排在一起
	if shop_button_select == 2{
		//先添加所有武器，并记录武器顺序
		var weapon_id_list = ds_list_create()
		for(var i = 0; i < goods_array_size;i++){
			if global.goods_map[? map_array[i]].type == "weapon"{
				ds_list_add(goods_list,map_array[i])
				ds_list_add(weapon_id_list, global.goods_map[? map_array[i]].unlock_item_id)
			}
		}
		//按武器分组添加宝石：同一个武器的宝石排在一起
		var added_gems = ds_list_create()
		//遍历武器列表，按顺序添加每个武器的专属宝石
		for(var w = 0; w < ds_list_size(weapon_id_list); w++){
			var weapon_id = ds_list_find_value(weapon_id_list, w)
			for(var i = 0; i < goods_array_size;i++){
				if global.goods_map[? map_array[i]].type == "gem"{
					var gem_id = global.goods_map[? map_array[i]].unlock_item_id
					//检查是否已添加
					var already_added = false
					for(var a = 0; a < ds_list_size(added_gems); a++){
						if ds_list_find_value(added_gems, a) == map_array[i]{
							already_added = true
							break
						}
					}
					if !already_added{
						var gem_info = get_gem_info(gem_id)
						if (gem_info != noone) && variable_struct_exists(gem_info, "allowed_weapons"){
							//检查宝石是否属于当前武器
							for(var aw = 0; aw < array_length(gem_info.allowed_weapons); aw++){
								if gem_info.allowed_weapons[aw] == weapon_id{
									ds_list_add(goods_list,map_array[i])
									ds_list_add(added_gems,map_array[i])
									break
								}
							}
						}
					}
				}
			}
		}
		//最后添加通用宝石（没有专属武器的宝石）
		for(var i = 0; i < goods_array_size;i++){
			if global.goods_map[? map_array[i]].type == "gem"{
				var already_added = false
				for(var a = 0; a < ds_list_size(added_gems); a++){
					if ds_list_find_value(added_gems, a) == map_array[i]{
						already_added = true
						break
					}
				}
				if !already_added{
					ds_list_add(goods_list,map_array[i])
				}
			}
		}
		ds_list_destroy(weapon_id_list)
		ds_list_destroy(added_gems)
	}
	else{
		for(var i = 0; i < goods_array_size;i++){
			//获取卡片类型商品
			if shop_button_select == 1{
				if global.goods_map[? map_array[i]].type == "card"{
					//将商品id添加到商品列表中
					//var card_data = deck_get_card_data(global.goods_map[? map_array[i]].unlock_item_id,0)
					ds_list_add(goods_list,map_array[i])
				}
			}
			//获取道具类型商品
			else if shop_button_select == 3{
				if global.goods_map[? map_array[i]].type == "item"{
					// 神秘礼盒仅在抽卡模式下显示
					var _item_id = global.goods_map[? map_array[i]].unlock_item_id
					if (_item_id == "gacha_box" && !is_eternal_gacha_mode()){
						// 跳过，不添加到列表
					}
					else{
						//将商品id添加到商品列表中
						//var card_data = deck_get_card_data(global.goods_map[? map_array[i]].unlock_item_id,0)
						ds_list_add(goods_list,map_array[i])
					}
				}
			}
			//获取卡片皮肤
			else if shop_button_select == 4{
				if global.goods_map[? map_array[i]].type == "card_attire"{
					//将商品id添加到商品列表中
					ds_list_add(goods_list,map_array[i])
				}
			}
			//获取角色皮肤
			else if shop_button_select == 5{
				if global.goods_map[? map_array[i]].type == "player_attire"{
					//将商品id添加到商品列表中
					ds_list_add(goods_list,map_array[i])
				}
			}
		}
	}
	//按类型创建购买按钮
	instance_destroy(obj_shop_buy_btn)
	for(var i = 0 ; i< 4; i++){
		for(var j = 0; j < 4; j++){
			//绘制卡片类型商品
			if shop_button_select == 1{
				if ds_list_find_value(goods_list,i*4+j+(current_page-1)*16) != undefined{
					// 检查卡片是否已解锁
		            var is_unlocked = false;
		            for(var k = 0; k < array_length(global.save_data.unlocked_cards); k++) {
		                if (global.save_data.unlocked_cards[k].id == global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id) {
		                    is_unlocked = true;
		                    break;
		                }
		            }
					//根据商品id获取卡片信息
					var inst = instance_create_depth(x-618+411*j+77, y-190+165*i+60,depth-1,obj_shop_buy_btn)
					inst.target_item = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id
					inst.cost = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].cost
					inst.goods_name = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].display_name
					inst.tooltip_text = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].description
					inst.btn_type = "card"
					if is_unlocked{
						inst.is_disabled = true
					}
				}
			}
			else if shop_button_select == 2{
				if ds_list_find_value(goods_list,i*4+j+(current_page-1)*16) != undefined{
					// 检查商品类型
		            var is_unlocked = false
					var goods_type = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].type
					if goods_type == "weapon"{
						is_unlocked = is_weapon_unlocked(global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id)
					}
					else if goods_type == "gem"{
						is_unlocked = is_gem_unlocked(global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id)
					}
					//根据商品id获取宝石或武器信息
					var inst = instance_create_depth(x-618+411*j+77, y-190+165*i+60,depth-1,obj_shop_buy_btn)
					inst.target_item = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id
					inst.cost = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].cost
					inst.goods_name = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].display_name
					inst.tooltip_text = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].description
					inst.btn_type = goods_type
					if is_unlocked{
						inst.is_disabled = true
					}
				}
			}
			else if shop_button_select == 3{
				if ds_list_find_value(goods_list,i*4+j+(current_page-1)*16) != undefined{
					
					//根据商品id获取商品信息
					var inst = instance_create_depth(x-618+411*j+77, y-190+165*i+60,depth-1,obj_shop_buy_btn)
					var _item_id = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id
					inst.target_item = _item_id
					// 神秘礼盒价格动态计算：50000 + 购买次数 * 50000
					if (_item_id == "gacha_box"){
						var _buy_count = 0;
						if (variable_struct_exists(global.save_data, "gacha_box_buy_count")) {
							_buy_count = global.save_data.gacha_box_buy_count;
						}
						inst.cost = 50000 + _buy_count * 50000
					}
					else{
						inst.cost = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].cost
					}
					inst.goods_name = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].display_name
					inst.tooltip_text = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].description
					inst.btn_type = "item"
					
				}
			}
			else if shop_button_select == 4 || shop_button_select == 5{
				if ds_list_find_value(goods_list,i*4+j+(current_page-1)*16) != undefined{
					
					//根据商品id获取商品信息
					var inst = instance_create_depth(x-618+411*j+77, y-190+165*i+60,depth-1,obj_shop_buy_btn)
					inst.target_item = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id
					inst.cost = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].cost
					inst.goods_name = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].display_name
					inst.tooltip_text = global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].description
					inst.btn_type = "attire"
					if is_attire_unlocked(global.goods_map[? ds_list_find_value(goods_list,i*4+j+(current_page-1)*16)].unlock_item_id){
						inst.is_disabled = true
					}
					
				}
			}
		}
	}
}
