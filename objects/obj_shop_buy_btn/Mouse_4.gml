if not obj_shop_bg.is_submenu_opened and not is_disabled{
	
	audio_play_sound(snd_button,0,0)
	if btn_type == "card" || btn_type == "weapon" || btn_type == "gem" || btn_type == "attire"{
		// 抽卡模式：禁用卡片购买
		if (btn_type == "card" && (is_eternal_gacha_mode() || is_random_gift_mode())) {
			show_notice(is_random_gift_mode() ? "随机礼盒模式无法购买卡片" : "抽卡模式无法购买卡片", 60);
			exit;
		}
		// 抽卡模式：禁用MOD武器购买
		if (btn_type == "weapon" && is_eternal_gacha_mode() && gacha_is_mod_weapon(target_item)) {
			show_notice("抽卡模式通过随机奖励获取MOD武器", 60);
			exit;
		}
		// 抽卡模式：禁用MOD宝石购买
		if (btn_type == "gem" && is_eternal_gacha_mode() && gacha_is_mod_gem(target_item)) {
			show_notice("抽卡模式通过随机奖励获取MOD宝石", 60);
			exit;
		}
		if global.save_data.player.gold >= cost || global.debug{
			var inst = instance_create_depth(room_width/2,room_height/2,depth-3,obj_shop_buy_confirm)
			inst.banding_buy_btn = id
			obj_shop_bg.is_submenu_opened = true
			//show_debug_message(global.save_data.player.gold)
		}
		else{
			show_notice("金币不足",60)
		}
	}
	else if btn_type == "item"{
		if global.save_data.player.gold >= cost || global.debug{
			if target_item == "card_slot_21" && global.save_data.unlocked_items.max_slot != 20{
				show_notice("请先购买第20个卡槽",60)
			}
			else if target_item == "card_slot_20" && global.save_data.unlocked_items.max_slot != 19{
				show_notice("请先购买第19个卡槽",60)
			}
			else if target_item == "card_slot_19" && global.save_data.unlocked_items.max_slot != 18{
				show_notice("请先购买前18个卡槽",60)
			}
			else{
				var inst = instance_create_depth(room_width/2,room_height/2,depth-3,obj_shop_buy_confirm)
				inst.banding_buy_btn = id
				obj_shop_bg.is_submenu_opened = true
				//show_debug_message(global.save_data.player.gold)
			}
		}
		else{
			show_notice("金币不足",60)
		}
	}
}
