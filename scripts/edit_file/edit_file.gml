/// @function unlock_card(card_id, level, shape)
/// @desc 解锁新卡片并保存存档
/// @param {string} card_id 卡片ID
/// @param {number} level 卡片等级
/// @param {number} shape 卡片转职
function unlock_card(card_id, level, shape, skill) {
    // 检查卡片是否已解锁
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            // 卡片已存在，只升级不降级（取最大值）
            global.save_data.unlocked_cards[i].level = max(global.save_data.unlocked_cards[i].level, level);
            global.save_data.unlocked_cards[i].shape = max(global.save_data.unlocked_cards[i].shape, shape);
			global.save_data.unlocked_cards[i].skill = max(global.save_data.unlocked_cards[i].skill, skill);
			global.save_data.unlocked_cards[i].max_shape = max(global.save_data.unlocked_cards[i].max_shape, shape);
			global.save_data.unlocked_cards[i].max_level = max(global.save_data.unlocked_cards[i].max_level, level);
            save_file(global.save_slot); // 立即保存
            return true;
        }
    }
    
    // 卡片未解锁，添加新卡片
    var new_card = {
        id: card_id,
        level: level,
        shape: shape,
		skill: skill,
		max_level: level,
		max_shape: shape
    };
    
    array_push(global.save_data.unlocked_cards, new_card);
    save_file(global.save_slot); // 立即保存
    return true;
}

/// @function remove_card(card_id)
/// @desc 移除已解锁的卡片并保存存档
/// @param {string} card_id 卡片ID
function remove_card(card_id) {
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            // 找到卡片，从数组中移除
            array_delete(global.save_data.unlocked_cards, i, 1);
            save_file(global.save_slot); // 立即保存
            return true;
        }
    }
    
    // 未找到卡片
    return false;
}

/// @function cleanup_orphan_cards()
/// @desc 移除已解锁但已不存在于卡池(player_deck)的孤儿卡，彻底消除强化界面中的空卡片
function cleanup_orphan_cards() {
    var removed = 0;
    for (var i = array_length(global.save_data.unlocked_cards) - 1; i >= 0; i--) {
        var entry = global.save_data.unlocked_cards[i];
        var cid;
        var cshape = 0;
        if (is_struct(entry)) {
            cid = entry.id;
            cshape = entry.shape;
        } else {
            cid = entry;
        }
        if (deck_get_card_data(cid, cshape) == noone) {
            show_debug_message("清理孤儿卡: " + string(cid));
            array_delete(global.save_data.unlocked_cards, i, 1);
            removed++;
        }
    }
    if (removed > 0)
        save_file(global.save_slot);
    return removed;
}

/// @function upgrade_card(card_id, levels)
/// @desc 升级卡片等级并保存存档
/// @param {string} card_id 卡片ID
/// @param {number} levels 要提升到的等级数
function upgrade_card(card_id, levels) {
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            // 找到卡片，升级等级
            global.save_data.unlocked_cards[i].max_level = levels;
			global.save_data.unlocked_cards[i].level = levels;
            save_file(global.save_slot); // 立即保存
            return true;
        }
    }
    
    // 未找到卡片
    return false;
}

/// @function upgrade_card_shape(card_id, shapes)
/// @desc 解锁卡片转职并保存存档
/// @param {string} card_id 卡片ID
/// @param {number} shapes 要提升到的转职数
function upgrade_card_shape(card_id, shapes) {
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            // 找到卡片，升级等级
            global.save_data.unlocked_cards[i].max_shape = shapes;
			global.save_data.unlocked_cards[i].shape = shapes;
            save_file(global.save_slot); // 立即保存
            return true;
        }
    }
    
    // 未找到卡片
    return false;
}

/// @function is_card_unlocked(card_id)
/// @desc 检查卡片是否已解锁
/// @param {string} card_id 卡片ID
function is_card_unlocked(card_id) {
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            return true;
        }
    }
    return false;
}

/// @function get_card_level(card_id)
/// @desc 获取卡片等级
/// @param {string} card_id 卡片ID
function get_card_level(card_id) {
    for (var i = 0; i < array_length(global.save_data.unlocked_cards); i++) {
        if (global.save_data.unlocked_cards[i].id == card_id) {
            return global.save_data.unlocked_cards[i].level;
        }
    }
    return 0; // 未解锁的卡片等级为0
}

/// @function complete_level(level_id)
/// @desc 标记关卡为已完成并保存存档
/// @param {string} level_id 关卡ID
function complete_level(level_id) {
    // 检查关卡是否已完成
    for (var i = 0; i < array_length(global.save_data.completed_levels); i++) {
        if (global.save_data.completed_levels[i] == level_id) {
            // 关卡已完成，无需重复添加
            return true;
        }
    }
    
    // 添加新完成的关卡
    array_push(global.save_data.completed_levels, level_id);
    save_file(global.save_slot); // 立即保存
    return true;
}

/// @function uncomplete_level(level_id)
/// @desc 取消标记关卡为已完成并保存存档
/// @param {string} level_id 关卡ID
function uncomplete_level(level_id) {
    for (var i = 0; i < array_length(global.save_data.completed_levels); i++) {
        if (global.save_data.completed_levels[i] == level_id) {
            // 找到关卡，从数组中移除
            array_delete(global.save_data.completed_levels, i, 1);
            save_file(global.save_slot); // 立即保存
            return true;
        }
    }
    
    // 未找到关卡
    return false;
}

/// @function is_level_completed(level_id)
/// @desc 检查关卡是否已完成
/// @param {string} level_id 关卡ID
function is_level_completed(level_id) {
    for (var i = 0; i < array_length(global.save_data.completed_levels); i++) {
        if (global.save_data.completed_levels[i] == level_id) {
            return true;
        }
    }
    return false;
}

/// @function get_completed_levels()
/// @desc 获取所有已完成的关卡列表
function get_completed_levels() {
    return global.save_data.completed_levels;
}

/// @function is_weapon_unlocked(weapon_id)
/// @desc 检查武器是否已解锁
/// @param {string} weapon_id 武器ID
function is_weapon_unlocked(weapon_id) {
    for (var i = 0; i < array_length(global.save_data.unlocked_weapons); i++) {
        var _w = global.save_data.unlocked_weapons[i];
        if ((is_struct(_w) ? _w.id : _w) == weapon_id) {
            return true;
        }
    }
    return false;
}

/// @function unlock_weapon(weapon_id)
/// @desc 解锁新的武器
/// @param {string} weapon_id 武器ID
function unlock_weapon(weapon_id){
	if not is_weapon_unlocked(weapon_id){
		var index = array_length(global.save_data.unlocked_weapons)
		global.save_data.unlocked_weapons[index] = {"id":weapon_id}
		save_file(global.save_slot)
	}
}

/// @function is_gem_unlocked(gem_id)
/// @desc 检查宝石是否已解锁
/// @param {string} gem_id 宝石ID
function is_gem_unlocked(gem_id) {
    for (var i = 0; i < array_length(global.save_data.unlocked_gems); i++) {
        var _g = global.save_data.unlocked_gems[i];
        if ((is_struct(_g) ? _g.id : _g) == gem_id) {
            return true;
        }
    }
    return false;
}

/// @function unlock_gem(gem_id)
/// @desc 解锁新的宝石
/// @param {string} gem_id 宝石ID
function unlock_gem(gem_id){
	if not is_gem_unlocked(gem_id){
		var index = array_length(global.save_data.unlocked_gems)
		global.save_data.unlocked_gems[index] = {"id":gem_id,"level":0,"max_level":0}
		save_file(global.save_slot)
	}
}

function get_gem_level(gem_id){
	var gem_level = 0
	for(var i = 0;i < array_length(global.save_data.unlocked_gems);i++){
		if global.save_data.unlocked_gems[i].id == gem_id{
			gem_level = global.save_data.unlocked_gems[i].level
		}
	}
	return gem_level
}

function get_gem_max_level(gem_id){
	var gem_level = 0
	for(var i = 0;i < array_length(global.save_data.unlocked_gems);i++){
		if global.save_data.unlocked_gems[i].id == gem_id{
			gem_level = global.save_data.unlocked_gems[i].max_level
		}
	}
	return gem_level
}

function edit_gem_level(gem_id,new_level){
	for(var i = 0;i < array_length(global.save_data.unlocked_gems);i++){
		if global.save_data.unlocked_gems[i].id == gem_id{
			global.save_data.unlocked_gems[i].level = new_level
		}
	}
}

function edit_gem_max_level(gem_id,new_level){
	for(var i = 0;i < array_length(global.save_data.unlocked_gems);i++){
		if global.save_data.unlocked_gems[i].id == gem_id{
			global.save_data.unlocked_gems[i].max_level = new_level
		}
	}
}