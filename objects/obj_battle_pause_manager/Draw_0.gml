// obj_battle_pause_manager - Draw Event
if (global.is_paused)
{
    // 1. 绘制半透明遮罩
    
    
    // 2. 根据状态显示不同内容
    if (global.show_menu)
    {
        // 绘制菜单 (示例：居中菜单框)
        var menu_x = room_width / 2;
        var menu_y = room_height / 2;
        
        // 菜单背景
        //draw_set_color(c_white);
        //draw_rectangle(menu_x - 100, menu_y - 100, menu_x + 100, menu_y + 100, false);
        
        // 菜单选项 (示例)
		//draw_set_color(c_black);
        //draw_set_halign(fa_center);
        //draw_text(menu_x, menu_y - 30, "继续游戏");
        //draw_text(menu_x, menu_y + 10, "退出关卡");
        // 这里可以添加菜单交互逻辑
    }
    else
    {
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
        // 只显示"暂停中"文字
		draw_set_font(font_yuan)
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
		draw_set_color(c_white)
		if entry_pause{
			draw_sprite_ext(spr_place_player_tip,0,room_width / 2, room_height / 2,1.8,1.8,0,c_white,1)
		}
		else if not global.game_over{
			draw_text(room_width / 2, room_height / 2, "暂停中");
		}
		else{
			// 抽卡模式结算页面
			if (is_eternal_gacha_mode() && instance_exists(obj_gacha_drop) && obj_gacha_drop.state == 2) {
				draw_set_font(font_yuan);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				
				var cx = room_width / 2;
				var cy = room_height / 2;
				
				// 判断是否精英首次通关
				var is_elite = false;
				if (instance_exists(obj_battle)) {
				    if (global.save_data.unlocked_items.elite_unlocked && obj_battle.current_wave >= global.level_file.elite_wave) {
				        is_elite = true;
				    }
				}
				
				var is_first_normal = array_get_index(global.save_data.completed_levels, global.level_data.id) == -1;
				var is_first_elite = false;
				if (variable_struct_exists(global.save_data, "completed_elite_levels")) {
				    is_first_elite = is_elite && array_get_index(global.save_data.completed_elite_levels, global.level_data.id) == -1;
				} else {
				    is_first_elite = is_elite;
				}
				
				var is_warrior_level = (string_pos("_warrior", global.level_data.id) > 0);
				var is_first = is_first_normal || is_first_elite;
				
				// 标题
				draw_set_color(c_yellow);
				draw_text(cx, cy - 180, "通关成功！");
				
				if (is_first || is_warrior_level) {
					draw_set_color(c_white);
					
					// 获取抽卡奖励数据
					var reward_id = global.gacha_reward.id;
					var reward_shape = global.gacha_reward.shape;
					var reward_type = "card";
					if (variable_struct_exists(global.gacha_reward, "reward_type")) {
						reward_type = global.gacha_reward.reward_type;
					}
					
					// 标题文字
					var title_text = "随机获得卡片";
					if (reward_type == "weapon") {
						title_text = "随机获得武器";
					} else if (reward_type == "gem") {
						title_text = "随机获得宝石";
					}
					draw_text(cx, cy - 140, title_text);
					
					// 卡槽外框
					var slot_spr = spr_slot;
					var slot_scale = 1.2;
					draw_sprite_ext(slot_spr, 0, cx, cy - 20, slot_scale, slot_scale, 0, c_white, 1);
					
					if (reward_type == "card") {
						// === 卡片奖励 ===
						var card_shape_data = get_plant_shape_data(reward_id, reward_shape);
						var card_deck_data = deck_get_card_data(reward_id, reward_shape);
						
						// 卡片贴图（放大约一倍）
						if (card_deck_data != noone) {
							var card_spr = card_deck_data[? "sprite"];
							if (card_spr != undefined) {
								draw_sprite_ext(card_spr, 0, cx, cy - 20, 1.8, 1.8, 0, c_white, 1);
							}
						}
						
						// 卡片名称
						var name_color = c_blue;
						if (gacha_is_gold_card(reward_id)) {
							name_color = c_yellow;
						} else if (gacha_is_zodiac_card(reward_id)) {
							name_color = c_purple;
						}
						draw_set_color(name_color);
						var card_name = "未知卡片";
						if (card_shape_data != undefined) {
							card_name = card_shape_data[? "name"];
						}
						draw_text(cx, cy + 120, card_name);
						
						// 形态
						draw_set_color(c_lime);
						draw_text(cx, cy + 150, "形态：" + string(reward_shape));
					} else if (reward_type == "weapon") {
						// === 武器奖励 ===
						var weapon_icon = gacha_get_weapon_icon(reward_id);
						var weapon_name = gacha_get_weapon_name(reward_id);
						
						// 武器图标（放大约一倍）
						if (weapon_icon != -1) {
							draw_sprite_ext(weapon_icon, 0, cx, cy - 20, 2.0, 2.0, 0, c_white, 1);
						}
						
						// 武器名称（金色）
						draw_set_color(c_yellow);
						draw_text(cx, cy + 120, weapon_name);
						
						// 类型标签
						draw_set_color(c_lime);
						draw_text(cx, cy + 150, "MOD武器");
					} else if (reward_type == "gem") {
						// === 宝石奖励 ===
						var gem_icon = gacha_get_gem_icon(reward_id);
						var gem_name = gacha_get_gem_name(reward_id);
						
						// 宝石图标（放大约一倍）
						if (gem_icon != -1) {
							draw_sprite_ext(gem_icon, 0, cx, cy - 20, 2.5, 2.5, 0, c_white, 1);
						}
						
						// 宝石名称（紫色）
						draw_set_color(c_purple);
						draw_text(cx, cy + 120, gem_name);
						
						// 类型标签
						draw_set_color(c_lime);
						draw_text(cx, cy + 150, "MOD宝石");
					}
				} else {
					draw_set_color(c_gray);
					draw_text(cx, cy - 80, "重复通关");
					draw_text(cx, cy - 40, "无抽卡奖励");
				}
				
				// 确定按钮
				var btn_x = cx;
				var btn_y = cy + 220;
				var btn_w = 160;
				var btn_h = 50;
				
				// 按钮背景
				draw_set_color(c_gray);
				draw_rectangle(btn_x - btn_w/2, btn_y - btn_h/2, btn_x + btn_w/2, btn_y + btn_h/2, false);
				draw_set_color(c_white);
				draw_rectangle(btn_x - btn_w/2, btn_y - btn_h/2, btn_x + btn_w/2, btn_y + btn_h/2, true);
				
				// 按钮文字
				draw_set_color(c_black);
				draw_text(btn_x, btn_y, "确 定");
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
			}
			else if !settlement{
				draw_text(room_width / 2, room_height / 2 + 150, "左键点击或按空格键继续……");
			}
			else{
				draw_text(room_width / 2, room_height / 2 + 450, "左键点击或按空格键继续……");
				//绘制结算界面
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				draw_text(630,225, "通关统计");
				var minute = floor(obj_battle.battle_time/3600)
				var second = obj_battle.battle_time/60 - minute * 60
				draw_text(630,260, "通关时间："+string(minute)+":"+string(second));
				draw_text(630,285,"卡片损失："+string(obj_task_manager.card_loss))
				draw_text(630,310,"猫损失："+string(obj_task_manager.cat_loss))
				var _diff_text = difficulty_get_display_name()
				draw_text(630,335,"难度："+_diff_text)
				if global.level_file.version != "1.0.0" && !global.laboretory_room{
					if first_complete{
						var item_string = ""
						var item_list = global.level_file.rewards[1].items
						for(var i = 0 ; i < array_length(item_list) ; i++){
							var item_id = item_list[i].id
							var item_data = get_material_info(item_id)
							item_string += (item_data.name + "（"+string(item_list[i].amount)+"） ")
						}
						//draw_text(100,900,item_string)
						//draw_text(100,940,"等级："+string(global.level_file.rewards[1].player_level)+"级")
						var card_string = ""
						var card_unlock_id_list = global.level_file.rewards[1].card_unlock
						for(var i = 0 ; i < array_length(card_unlock_id_list) ; i++){
							var card_id = card_unlock_id_list[i]
							var card_data = get_plant_shape_data(card_id,0)
							card_string += (card_data[? "name"] + " ")
						}
						//draw_text(100,980,"卡片解锁："+card_string)
						var weapon_string = ""
						var weapon_unlock_id_list = global.level_file.rewards[1].weapon_unlock
						for(var i = 0 ; i < array_length(weapon_unlock_id_list) ; i++){
							var weapon_id = weapon_unlock_id_list[i]
							var weapon_data = get_weapon_info(weapon_id)
							weapon_string += (weapon_data.name + " ")
						}
						//draw_text(100,1020,"武器解锁："+weapon_string)
						var gem_string = ""
						var gem_unlock_id_list = global.level_file.rewards[1].gem_unlock
						for(var i = 0 ; i < array_length(gem_unlock_id_list) ; i++){
							var gem_id = gem_unlock_id_list[i]
							var gem_data = get_gem_info(gem_id)
							gem_string += (gem_data.name + " ")
						}
						//draw_text(100,1060,"宝石解锁："+gem_string)
						draw_text(1200,225, "关卡奖励");
						var _is_cs_draw = (string_pos("ancient_castle_", global.level_data.id) == 1);
						if (_is_cs_draw) {
							var _cs_silver_arr = [60, 84, 104, 129, 140, 160, 190, 220];
							var _cs_lv_idx = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
							var _cs_silver_val = _cs_silver_arr[min(_cs_lv_idx, array_length(_cs_silver_arr) - 1)];
							var _cs_gold_medal_val = 5 * (_cs_lv_idx + 1);
							draw_text(1200,260,"白银徽章（"+string(_cs_silver_val)+"）");
							draw_text(1200,285,"黄金徽章（"+string(_cs_gold_medal_val)+"）");
						} else {
							draw_text(1200,260,"金币（"+string(global.level_file.rewards[1].gold)+"）")
							draw_text(1200,285,"技能："+string(global.level_file.rewards[1].skill_level)+"级")
							draw_text(1200,310,item_string)
							draw_text(1200,335,"等级："+string(global.level_file.rewards[1].player_level)+"级")
							draw_text(1200,360,"卡片解锁："+card_string)
							draw_text(1200,385,"武器解锁："+weapon_string)
							draw_text(1200,410,"宝石解锁："+gem_string)
							if global.level_data.id == "champagne_island_water"{
								draw_set_colour(c_yellow)
								draw_text(1200,435,"你已解锁精英段，击败洞君和阿诺各一次以解锁神殿")
							}
							if global.level_data.id == "abyss"{
								draw_set_colour(c_yellow)
								draw_text(1200,435,"你的铲子已升级为铜铲")
							}
							if global.level_data.id == "macchiato_port"{
								draw_set_colour(c_yellow)
								draw_text(1200,435,"你的铲子已升级为银铲")
							}
							if global.level_data.id == "snowcap_volcano"{
								draw_set_colour(c_yellow)
								draw_text(1200,435,"你的铲子已升级为金铲")
							}
							if global.level_data.id == "tower_cake_35_3"{
								draw_set_colour(c_yellow)
								draw_text(1200,435,"你已在背包内的“冒险战绩”中获得勋章")
							}
						}
						
					}
					else{
						draw_text(1200,225, "关卡奖励");
						var item_string = ""
						var item_list = global.level_file.rewards[0].items
						for(var i = 0 ; i < array_length(item_list) ; i++){
							var item_id = item_list[i].id
							var item_data = get_material_info(item_id)
							item_string += (item_data.name + "（"+string(item_list[i].amount)+"） ")
						}
						var _is_cs_draw_r = (string_pos("ancient_castle_", global.level_data.id) == 1);
						if (_is_cs_draw_r) {
							var _cs_silver_arr_r = [60, 84, 104, 129, 140, 160, 190, 220];
							var _cs_lv_idx_r = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
							var _cs_first_sv = _cs_silver_arr_r[min(_cs_lv_idx_r, array_length(_cs_silver_arr_r) - 1)];
							var _cs_silver_val_r = floor(_cs_first_sv / 3);
							var _cs_gold_val_r = 2 * (_cs_lv_idx_r + 1);
							draw_text(1200,260,"白银徽章（"+string(_cs_silver_val_r)+"）");
							draw_text(1200,285,"黄金徽章（"+string(_cs_gold_val_r)+"）");
						} else {
							draw_text(1200,260,"金币（"+string(global.level_file.rewards[0].gold)+"）")
							draw_text(1200,285,item_string)
						}
					}
				}
			}
			if instance_exists(obj_game_over) && obj_game_over.sprite_index == spr_lose{
				draw_text(room_width / 2, room_height / 2 + 175, "按R重新开始")
			}
		}
    }
}
