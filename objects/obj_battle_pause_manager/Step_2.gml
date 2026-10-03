// obj_battle_pause_manager - Step Event

// 手动暂停标记与全局冻结状态保持同步：
// 菜单“继续游戏”等外部路径会直接把 is_paused 置 false，这里顺手清掉标记。
if (!global.is_paused) {
    manual_pause = false;
}

// ===== ESC：打开 / 关闭暂停菜单（最先处理）=====
// 独立于“空格/鼠标”那一段输入，也不受进关暂停分支的 exit 影响：
// 即便已经用空格暂停（is_paused 为真但 show_menu 为假）、或正处于放置人物阶段，ESC 都能打开菜单。
if (keyboard_check_pressed(vk_escape)) {
    var _menu = instance_find(obj_pause_menu, 0);

    if (_menu == noone) {
        // 没有菜单：只要不处于结算 / 抽卡礼盒 / 测试情报岛这类模态状态，就进入手动暂停并开菜单。
        if (!global.game_over
            && !instance_exists(obj_game_over)
            && !instance_exists(obj_gacha_drop)
            && !instance_exists(obj_info_island_bg)) {
            // ESC暂停：暂停并显示菜单
            manual_pause = true;
            global.is_paused = true;
            global.show_menu = true;
            instance_create_depth(room_width / 2, room_height / 2, depth, obj_pause_menu);
        }
    }
    else if (instance_exists(obj_config_menu)) {
        // 设置子菜单打开时，ESC 只关闭子菜单
        instance_destroy(obj_config_menu);
    }
    else if (!_menu.submenu_open) {
        instance_destroy(_menu);
        manual_pause = false;
        global.is_paused = false;
        global.show_menu = false;
    }
}
// 抽卡模式：礼盒动画帧推进（每帧执行）
if (is_eternal_gacha_mode() && instance_exists(obj_gacha_drop)) {
    if (obj_gacha_drop.state == 1) {
        obj_gacha_drop.anim_frame += 1;
        obj_gacha_drop.image_index = min(obj_gacha_drop.anim_frame, obj_gacha_drop.anim_total_frames - 1);

        if (obj_gacha_drop.anim_frame >= obj_gacha_drop.anim_total_frames - 1) {
            obj_gacha_drop.state = 2;

            // 动画结束，首次通关生成随机奖励；勇士关卡每次通关都生成
            // 精英模式的首次通关单独计数，也给奖励
            var is_elite = false;
            if (instance_exists(obj_battle)) {
                // 用 current_wave >= elite_wave 判断是否进入了精英阶段（比 level_stage=="boss" 更可靠）
                if (global.save_data.unlocked_items.elite_unlocked && obj_battle.current_wave >= global.level_file.elite_wave) {
                    is_elite = true;
                }
            }
            var is_warrior_level = (string_pos("_warrior", global.level_data.id) > 0);
            var is_first = false;
            // 旧存档兼容：确保 completed_elite_levels 存在
            if (!variable_struct_exists(global.save_data, "completed_elite_levels")) {
                global.save_data.completed_elite_levels = [];
            }
            if (is_elite) {
                is_first = array_get_index(global.save_data.completed_elite_levels, global.level_data.id) == -1;
            } else {
                is_first = array_get_index(global.save_data.completed_levels, global.level_data.id) == -1;
            }
            if (is_first || is_warrior_level) {
                global.gacha_reward = gacha_pick_random_reward();
                global.gacha_reward.received = false;
            } else {
                global.gacha_reward = {
                    id: "",
                    shape: 0,
                    received: true
                };
            }
        }
    }
}

// ===== 进关暂停：等待玩家放置人物 =====
// 只负责“进关卡”这一种暂停：人物放下即解除，不响应空格，也不会每帧重新置位。
if (entry_pause) {
    if (instance_exists(obj_player_character) && obj_player_character.is_placed) {
        // 人物已放置 → 进关暂停结束，战场从下一帧开始计时
        entry_pause = false;
        manual_pause = false;
        global.is_paused = false;
        global.show_menu = false;
    } else if (!instance_exists(obj_pause_menu)) {
        // 人物还没放下 → 保持冻结，且不显示暂停菜单
        // （放置阶段按 ESC 打开了菜单时不覆盖，交给菜单自己维持暂停）
        manual_pause = false;
        global.is_paused = true;
        global.show_menu = false;
    }
    exit;
}

// 抽卡礼盒必须优先处理，不能依赖普通暂停输入条件。
// 普通条件要求 global.game_over 为 true，部分输入路径下会导致礼盒点击被跳过。
if (is_eternal_gacha_mode() && instance_exists(obj_gacha_drop)) {
    var _gacha_mouse_pressed = mouse_check_button_pressed(mb_left);
    var _gacha_key_pressed = keyboard_check_pressed(vk_space);

    if (obj_gacha_drop.state == 0 && (_gacha_mouse_pressed || _gacha_key_pressed)) {
        var _gx = obj_gacha_drop.x;
        var _gy = obj_gacha_drop.y;
        var _gw = sprite_get_width(obj_gacha_drop.sprite_index) * obj_gacha_drop.image_xscale * 0.5;
        var _gh = sprite_get_height(obj_gacha_drop.sprite_index) * obj_gacha_drop.image_yscale * 0.5;
        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);

        if (_gacha_key_pressed || point_in_rectangle(_mx, _my, _gx - _gw, _gy - _gh, _gx + _gw, _gy + _gh)) {
            obj_gacha_drop.opened = true;
            obj_gacha_drop.state = 1;
            obj_gacha_drop.anim_frame = 0;
            obj_gacha_drop.image_index = 0;
            audio_play_sound(snd_button, 0, 0);
        }
        exit;
    }

    if (obj_gacha_drop.state == 2 && !gacha_settlement_done) {
        // 确定按钮逻辑由下面原有抽卡结算分支处理。
        // 直接进入该分支，避免被普通暂停输入条件拦截。
    } else if (obj_gacha_drop.state != 2) {
        exit;
    }
}

if (keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && global.game_over)) {
    // 抽卡模式特殊处理
    if (is_eternal_gacha_mode() && instance_exists(obj_gacha_drop)) {
        if (obj_gacha_drop.state == 0) {
            // 点击礼盒：开始播放动画
            var gx = obj_gacha_drop.x;
            var gy = obj_gacha_drop.y;
            var gw = sprite_get_width(spr_lihe) * 0.8;
            var gh = sprite_get_height(spr_lihe) * 0.8;

            if (point_in_rectangle(mouse_x, mouse_y, gx - gw/2, gy - gh/2, gx + gw/2, gy + gh/2)) {
                obj_gacha_drop.state = 1;
                obj_gacha_drop.anim_frame = 0;
                obj_gacha_drop.image_index = 0;
                audio_play_sound(snd_button, 0, 0);
            }
            exit;
        }

        if (obj_gacha_drop.state == 2 && !gacha_settlement_done) {
            // 礼盒动画已结束，检测确定按钮点击
            var btn_x = room_width / 2;
            var btn_y = room_height / 2 + 220;
            var btn_w = 160;
            var btn_h = 50;
            
            if (mouse_check_button_pressed(mb_left) &&
                point_in_rectangle(mouse_x, mouse_y, btn_x - btn_w/2, btn_y - btn_h/2, btn_x + btn_w/2, btn_y + btn_h/2)) {
                
                // 执行抽卡模式结算
                // 抽卡结算的难度奖励也完全跟随基础难度。
                var reward_multiplier = difficulty_get_reward_multiplier();
                
                // 旧存档兼容：确保 completed_elite_levels 存在
                if (!variable_struct_exists(global.save_data, "completed_elite_levels")) {
                    global.save_data.completed_elite_levels = [];
                }
                
                // 判断是否精英模式（打到了精英波次）
                var is_elite = false;
                if (instance_exists(obj_battle)) {
                    if (global.save_data.unlocked_items.elite_unlocked && obj_battle.current_wave >= global.level_file.elite_wave) {
                        is_elite = true;
                    }
                }
                var is_first_normal = array_get_index(global.save_data.completed_levels, global.level_data.id) == -1;
                var is_first_elite = is_elite && array_get_index(global.save_data.completed_elite_levels, global.level_data.id) == -1;
                
                if (!global.laboretory_room) {
                    with obj_task_manager {
                        refresh_task_progress();
                    }
                    
                    if (is_first_normal) {
                        // 普通首次通关：完整首次奖励
                        complete_level(global.level_data.id);
                        first_complete = true;
                        
                        if (array_get_index(slot_unlock_level_id_list, global.level_data.id) != -1) {
                            if (global.save_data.unlocked_items.max_slot < 21) {
                                global.save_data.unlocked_items.max_slot += 1
                                show_notice("你解锁了一个新的卡槽", 60)
                            }
                        }
                        
                        if (global.level_data.id == "champagne_island_water") {
                            global.save_data.unlocked_items.elite_unlocked = true
                        }
                        if (global.level_data.id == "abyss") {
                            global.save_data.unlocked_items.shovel = "copper"
                        }
                        if (global.level_data.id == "macchiato_port") {
                            global.save_data.unlocked_items.shovel = "silver"
                        }
                        if (global.level_data.id == "snowcap_volcano") {
                            global.save_data.unlocked_items.shovel = "gold"
                        }
                        if (global.level_data.id == "tower_cake_35_3") {
                            global.save_data.player.crown_version = global.game_version
                        }
                        
                        if (global.level_file.rewards[1].player_level >= global.save_data.player.level) {
                            global.save_data.player.level = global.level_file.rewards[1].player_level
                        }
                        if (global.level_file.rewards[1].skill_level >= global.save_data.unlocked_items.max_skill_level) {
                            global.save_data.unlocked_items.max_skill_level = global.level_file.rewards[1].skill_level
                            var len = array_length(global.save_data.unlocked_cards)
                            for (var i = 0; i < len; i++) {
                                global.save_data.unlocked_cards[i].skill = global.save_data.unlocked_items.max_skill_level
                            }
                        }
                        
                        // 跨服远征关卡：特殊奖励（银币 + 金徽章，不含金币）
                        var _is_cross_server = (string_pos("ancient_castle_", global.level_data.id) == 1);
                        if (_is_cross_server) {
                            var _cs_silver_medals = [350, 400, 181, 240, 280, 395, 635, 875];
                            var _cs_level_idx = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
                            var _cs_silver = _cs_silver_medals[min(_cs_level_idx, array_length(_cs_silver_medals) - 1)];
                            var _cs_gold_medal = [90, 120, 181, 240, 280, 395, 635, 875][min(_cs_level_idx, 7)];
                            var _cs_gold = [600000, 840000, 1040000, 1290000, 1400000, 1600000, 1900000, 2200000][min(_cs_level_idx, 7)];
                            add_material_amount("cross_server_silver_medal", _cs_silver * reward_multiplier);
                            add_material_amount("cross_server_gold_medal", _cs_gold_medal * reward_multiplier);
                            global.save_data.player.gold += _cs_gold * reward_multiplier;
                        } else {
                            global.save_data.player.gold += global.level_file.rewards[1].gold * reward_multiplier;
                        }
                        var item_list = global.level_file.rewards[1].items
                        for (var i = 0; i < array_length(item_list); i++) {
                            var item_id = item_list[i].id
                            add_material_amount(item_id, real(item_list[i].amount) * reward_multiplier)
                        }
                        
                        // 两种抽卡模式仅正常发放指定八张卡片的0形态。
                        var card_unlock_id_list = global.level_file.rewards[1].card_unlock
                        for (var i = 0; i < array_length(card_unlock_id_list); i++) {
                            var card_id = card_unlock_id_list[i]
                            if (!gacha_is_excluded_card(card_id)) continue;
                            if (!is_card_unlocked(card_id)) {
                                unlock_card(card_id, 0, 0, global.save_data.unlocked_items.max_skill_level)
                            }
                        }
                        
                        var weapon_unlock_id_list = global.level_file.rewards[1].weapon_unlock
                        for (var i = 0; i < array_length(weapon_unlock_id_list); i++) {
                            var weapon_id = weapon_unlock_id_list[i]
                            unlock_weapon(weapon_id)
                        }
                        
                        var gem_unlock_id_list = global.level_file.rewards[1].gem_unlock
                        for (var i = 0; i < array_length(gem_unlock_id_list); i++) {
                            var gem_id = gem_unlock_id_list[i]
                            unlock_gem(gem_id)
                        }
                    } else {
                        // 非首次普通通关：重复通关奖励
                        var _is_cross_server_repeat = (string_pos("ancient_castle_", global.level_data.id) == 1);
                        if (_is_cross_server_repeat) {
                            var _cs_silver_medals_r = [105, 149, 169, 203, 209, 203, 157, 113];
                            var _cs_level_idx_r = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
                            var _cs_first_silver = _cs_silver_medals_r[min(_cs_level_idx_r, array_length(_cs_silver_medals_r) - 1)];
                            var _cs_silver_r = _cs_first_silver;
                            var _cs_gold_r = [27, 35, 55, 71, 83, 119, 191, 263][min(_cs_level_idx_r, 7)];
                            var _cs_gold_coins_r = [30000, 42000, 52000, 64500, 70000, 80000, 95000, 110000][min(_cs_level_idx_r, 7)];
                            add_material_amount("cross_server_silver_medal", _cs_silver_r * reward_multiplier);
                            add_material_amount("cross_server_gold_medal", _cs_gold_r * reward_multiplier);
                            global.save_data.player.gold += _cs_gold_coins_r * reward_multiplier;
                        } else {
                            global.save_data.player.gold += global.level_file.rewards[0].gold * reward_multiplier;
                        }
                        var item_list = global.level_file.rewards[0].items
                        for (var i = 0; i < array_length(item_list); i++) {
                            var item_id = item_list[i].id
                            add_material_amount(item_id, item_list[i].amount * reward_multiplier)
                        }
                    }
                    
                    // 精英模式首次通关：记录到精英通关列表
                    if (is_first_elite) {
                        array_push(global.save_data.completed_elite_levels, global.level_data.id)
                    }
                    
                    // 抽卡奖励：普通首次 或 精英首次 或 勇士关卡（每次都给）
                    var is_warrior_level2 = (string_pos("_warrior", global.level_data.id) > 0);
                    if ((is_first_normal || is_first_elite || is_warrior_level2) && global.gacha_reward.received == false) {
                        var reward_type = "card";
                        if (variable_struct_exists(global.gacha_reward, "reward_type")) {
                            reward_type = global.gacha_reward.reward_type;
                        }
                        var reward_id = global.gacha_reward.id;
                        var target_shape = global.gacha_reward.shape;
                        
                        if (reward_type == "card") {
                            if (!is_card_unlocked(reward_id)) {
                                unlock_card(reward_id, 0, target_shape, global.save_data.unlocked_items.max_skill_level);
                            } else {
                                var info = get_card_info_simple(reward_id);
                                var new_level = info.level;
                                var new_shape = max(info.shape, target_shape);
                                var new_max_shape = max(info.max_shape, target_shape);
                                
                                var is_fallback = false;
                                if (variable_struct_exists(global.gacha_reward, "fallback")) {
                                    is_fallback = global.gacha_reward.fallback;
                                }
                                if (is_fallback) {
                                    new_level = min(info.level + 1, info.max_level);
                                }
                                
                                for (var ci = 0; ci < array_length(global.save_data.unlocked_cards); ci++) {
                                    if (global.save_data.unlocked_cards[ci].id == reward_id) {
                                        global.save_data.unlocked_cards[ci].level = max(global.save_data.unlocked_cards[ci].level, new_level);
                                        global.save_data.unlocked_cards[ci].shape = new_shape;
                                        global.save_data.unlocked_cards[ci].max_shape = new_max_shape;
                                        global.save_data.unlocked_cards[ci].max_level = max(global.save_data.unlocked_cards[ci].max_level, new_level);
                                        break;
                                    }
                                }
                                save_file(global.save_slot);
                            }
                        } else if (reward_type == "weapon") {
                            unlock_weapon(reward_id);
                            show_notice("获得新武器：" + gacha_get_weapon_name(reward_id), 120);
                        } else if (reward_type == "gem") {
                            unlock_gem(reward_id);
                            show_notice("获得新宝石：" + gacha_get_gem_name(reward_id), 120);
                        }
                        
                        global.gacha_reward.received = true;
                    }
                    
                    save_file(global.save_slot);
                }
                
                gacha_settlement_done = true;
                instance_destroy(obj_gacha_drop);
                
                // 返回地图
                if (global.map_id == "tower_cake" || global.map_id == "delicious_town") {
                    global.map_id = "delicious_island";
                    global.map_name = "美味岛";
                }
                global.gui_stack.pop();
                global.gui_stack.pop();
                global.menu_screen = true;
                obj_world_map_button.world_map = 0;
                global.game_over = false;
                global.is_paused = false;
            }
        }
        exit;
    }
    
    //if global.selected_slot == noone {
        if (!global.is_paused) {
            if (global.difficulty < 4) {
                // 空格暂停：只暂停不显示菜单
                global.is_paused = true;
                global.show_menu = false;
                manual_pause = true;
            }
        }
        else if (global.is_paused && !global.show_menu) {
            // 取消暂停
			if global.game_over{
				if settlement || obj_game_over.sprite_index == spr_lose || global.level_file.version == "1.0.0"{
					if global.map_id == "tower_cake" || global.map_id == "delicious_town"{
						global.map_id = "delicious_island"
						global.map_name = "美味岛"
					}
					global.gui_stack.pop()
					if (obj_game_over.sprite_index != spr_lose) {
						global.gui_stack.pop()
					}
					global.menu_screen = true
					obj_world_map_button.world_map = 0
				}
				if global.level_file.version != "1.0.0"{
					if obj_game_over.sprite_index == spr_win && !settlement{
					var reward_multiplier = difficulty_get_reward_multiplier()
					if !global.laboretory_room{
							with obj_task_manager{
								refresh_task_progress()
							}
							if array_get_index(global.save_data.completed_levels,global.level_data.id) == -1{
								complete_level(global.level_data.id)
								first_complete = true
								if array_get_index(slot_unlock_level_id_list,global.level_data.id) != -1{
									if global.save_data.unlocked_items.max_slot < 21{
										global.save_data.unlocked_items.max_slot += 1
										show_notice("你解锁了一个新的卡槽",60)
									}
								}
								if global.level_data.id == "champagne_island_water"{
									global.save_data.unlocked_items.elite_unlocked = true
								}
								if global.level_data.id == "abyss"{
									global.save_data.unlocked_items.shovel = "copper"
								}
								if global.level_data.id == "macchiato_port"{
									global.save_data.unlocked_items.shovel = "silver"
								}
								if global.level_data.id == "snowcap_volcano"{
									global.save_data.unlocked_items.shovel = "gold"
								}
								if global.level_data.id == "tower_cake_35_3"{
									global.save_data.player.crown_version = global.game_version
								}
								if global.level_file.rewards[1].player_level >= global.save_data.player.level{
									global.save_data.player.level = global.level_file.rewards[1].player_level
								}
								if global.level_file.rewards[1].skill_level >= global.save_data.unlocked_items.max_skill_level{
									global.save_data.unlocked_items.max_skill_level = global.level_file.rewards[1].skill_level
									var length = array_length(global.save_data.unlocked_cards)
									for (var i = 0;i < length;i++){		
										global.save_data.unlocked_cards[i].skill = global.save_data.unlocked_items.max_skill_level
									}
								
								}
							// 跨服远征关卡：特殊奖励（银币 + 金徽章，不含金币）
							var _is_cross_server2 = (string_pos("ancient_castle_", global.level_data.id) == 1);
							if (_is_cross_server2) {
                                var _cs_silver_medals2 = [350, 400, 181, 240, 280, 395, 635, 875];
								var _cs_level_idx2 = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
								var _cs_silver2 = _cs_silver_medals2[min(_cs_level_idx2, array_length(_cs_silver_medals2) - 1)];
                                var _cs_gold_medal2 = [90, 120, 181, 240, 280, 395, 635, 875][min(_cs_level_idx2, 7)];
                                var _cs_gold2 = [600000, 840000, 1040000, 1290000, 1400000, 1600000, 1900000, 2200000][min(_cs_level_idx2, 7)];
                                add_material_amount("cross_server_silver_medal", _cs_silver2 * reward_multiplier);
                                add_material_amount("cross_server_gold_medal", _cs_gold_medal2 * reward_multiplier);
                                global.save_data.player.gold += _cs_gold2 * reward_multiplier;
							} else {
								global.save_data.player.gold += global.level_file.rewards[1].gold * reward_multiplier
							}
							var item_list = global.level_file.rewards[1].items
								for(var i = 0 ; i < array_length(item_list) ; i++){
									var item_id = item_list[i].id
									add_material_amount(item_id,real(item_list[i].amount) * reward_multiplier)
								}
						
								var card_unlock_id_list = global.level_file.rewards[1].card_unlock
							for(var i = 0 ; i < array_length(card_unlock_id_list) ; i++){
								var card_id = card_unlock_id_list[i]
								// 抽卡难度：仅发放排除卡（其他卡通过抽卡获得）
								if ((is_eternal_gacha_mode() || is_random_gift_mode()) && !gacha_is_excluded_card(card_id)) continue;
								if (is_eternal_gacha_mode() && is_card_unlocked(card_id)) continue;
								unlock_card(card_id,0,0,global.save_data.unlocked_items.max_skill_level)
							}
						
								var weapon_unlock_id_list = global.level_file.rewards[1].weapon_unlock
								for(var i = 0 ; i < array_length(weapon_unlock_id_list) ; i++){
									var weapon_id = weapon_unlock_id_list[i]
									unlock_weapon(weapon_id)
								}
						
								var gem_unlock_id_list = global.level_file.rewards[1].gem_unlock
								for(var i = 0 ; i < array_length(gem_unlock_id_list) ; i++){
									var gem_id = gem_unlock_id_list[i]
									unlock_gem(gem_id)
								}
								save_file(global.save_slot)
							}
							else{
								// 跨服远征关卡：重复通关特殊奖励
								var _is_cross_server_repeat2 = (string_pos("ancient_castle_", global.level_data.id) == 1);
								if (_is_cross_server_repeat2) {
									var _cs_silver_medals_r2 = [105, 149, 169, 203, 209, 203, 157, 113];
									var _cs_level_idx_r2 = real(string_delete(global.level_data.id, 1, string_length("ancient_castle_")));
									var _cs_first_silver_r2 = _cs_silver_medals_r2[min(_cs_level_idx_r2, array_length(_cs_silver_medals_r2) - 1)];
									var _cs_silver_r2 = _cs_first_silver_r2;
								var _cs_gold_r2 = [27, 35, 55, 71, 83, 119, 191, 263][min(_cs_level_idx_r2, 7)];
								var _cs_gold_coins_r2 = [30000, 42000, 52000, 64500, 70000, 80000, 95000, 110000][min(_cs_level_idx_r2, 7)];
								add_material_amount("cross_server_silver_medal", _cs_silver_r2 * reward_multiplier);
								add_material_amount("cross_server_gold_medal", _cs_gold_r2 * reward_multiplier);
								global.save_data.player.gold += _cs_gold_coins_r2 * reward_multiplier;
								} else {
									global.save_data.player.gold += global.level_file.rewards[0].gold * reward_multiplier
								}
								var item_list = global.level_file.rewards[0].items
								for(var i = 0 ; i < array_length(item_list) ; i++){
									var item_id = item_list[i].id
									add_material_amount(item_id,item_list[i].amount * reward_multiplier)
								}
								save_file(global.save_slot)
							}
						}
						settlement = true
						obj_game_over.image_alpha = 0
					}
				}
				
				
			}
			if obj_battle.battle_time != 0 && !global.game_over{
				global.is_paused = false;
				manual_pause = false;
			}
        }
    //}
}

if (keyboard_check_pressed(ord("R"))) {
	if global.game_over{
		if instance_exists(obj_game_over) && obj_game_over.sprite_index == spr_lose{
			room_restart()
		}
	}
}

// 旧代码这里用 `if obj_battle.battle_time == 1 { global.is_paused = true }` 每帧强制暂停：
// 而 obj_battle.Step_0 的 `if global.is_paused { exit }` 在 battle_time += 1 之前，
// 于是 battle_time 卡死在 1、进关暂停永远无法解除（自锁）。
// 进关暂停现在由文件开头的 entry_pause 分支单独负责，这里不再强制置位。
