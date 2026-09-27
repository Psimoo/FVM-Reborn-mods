if (global.is_paused) exit;

// 第34帧（image_index 33）动作结束，销毁重生神
// 在 event_inherited 之前检查，避免父类将 image_index 重置回循环起点
if (state == CARD_STATE.ATTACK && image_index >= 33 && timer >= flash_speed - 1) {
    instance_destroy();
    exit;
}

// 第26帧（image_index 25）复活卡片，只触发一次
if (state == CARD_STATE.ATTACK && !revive_triggered && image_index >= 25) {
    revive_triggered = true;

    var _eff1_spr = spr_chongsheng_god_effect_0_1;
    if (shape == 1) _eff1_spr = spr_chongsheng_god_effect_1_1;
    else if (shape == 2) _eff1_spr = spr_chongsheng_god_effect_2_1;
    else if (shape == 3) _eff1_spr = spr_chongsheng_god_effect_3_1;

    if (variable_global_exists("dead_cards") && ds_exists(global.dead_cards, ds_type_list))
    {
        for (var i = ds_list_size(global.dead_cards) - 1; i >= 0 && revive_count < revive_limit; i--)
        {
            var dead_info = global.dead_cards[| i];

            // 只复活被老鼠摧毁的卡片
            var _cause = ds_map_find_value(dead_info, "death_cause");
            if (_cause != "mouse") continue;

            var dead_col = dead_info[? "grid_col"];
            var dead_row = dead_info[? "grid_row"];

            if (abs(dead_col - grid_col) > grid_range_col || abs(dead_row - grid_row) > grid_range_row) continue;

            if (dead_col < 0 || dead_col >= global.grid_cols || dead_row < 0 || dead_row >= global.grid_rows) continue;

            var plant_list = ds_grid_get(global.grid_plants, dead_col, dead_row);
            var has_plant = false;
            for (var j = 0; j < ds_list_size(plant_list); j++) {
                var p = plant_list[| j];
                if (instance_exists(p) && p.hp > 0) { has_plant = true; break; }
            }
            if (has_plant) continue;

            var _plant_id = dead_info[? "plant_id"];
            var _shape = dead_info[? "shape"];
            var _level = dead_info[? "level"];
            var _skill = dead_info[? "skill"];

            var card_data = deck_get_card_data(_plant_id, _shape);
            if (card_data == noone) continue;

            var card_obj = card_data[? "obj"];
            var grid_pos = get_world_position_from_grid(dead_col, dead_row);

            var new_plant = instance_create_depth(grid_pos.x, grid_pos.y, 0, card_obj);
            new_plant.current_level = _level;
            new_plant.skill = _skill;
            new_plant.shape = _shape;
            with (new_plant) event_user(0);

            var depth_value = calculate_plant_depth(dead_col, dead_row, new_plant.plant_type);
            card_created(new_plant, dead_col, dead_row);
            new_plant.depth = depth_value;
            new_plant.attack_timer = 0;
            new_plant.state = 0;

            // 在复活位置释放 effect_1 特效
            var _eff1 = instance_create_depth(grid_pos.x, grid_pos.y, depth_value - 100, obj_card_heal_effect);
            _eff1.sprite_index = _eff1_spr;

            ds_map_destroy(dead_info);
            ds_list_delete(global.dead_cards, i);

            revive_count++;

            // 首次复活时施加减伤BUFF
            if (!buff_applied) {
                buff_applied = true;
            }
        }
    }
}

event_inherited();

if (is_frozen || state == CARD_STATE.SLEEP) exit;

// IDLE 状态：检查范围内是否有被老鼠摧毁的死亡卡片，有则切换到 ATTACK
if (state == CARD_STATE.IDLE) {
    if (variable_global_exists("dead_cards") && ds_exists(global.dead_cards, ds_type_list)) {
        for (var i = ds_list_size(global.dead_cards) - 1; i >= 0; i--) {
            var dead_info = global.dead_cards[| i];

            var _cause = ds_map_find_value(dead_info, "death_cause");
            if (_cause != "mouse") continue;

            var dead_col = dead_info[? "grid_col"];
            var dead_row = dead_info[? "grid_row"];

            if (abs(dead_col - grid_col) > grid_range_col || abs(dead_row - grid_row) > grid_range_row) continue;

            if (dead_col < 0 || dead_col >= global.grid_cols || dead_row < 0 || dead_row >= global.grid_rows) continue;

            var plant_list = ds_grid_get(global.grid_plants, dead_col, dead_row);
            var has_plant = false;
            for (var j = 0; j < ds_list_size(plant_list); j++) {
                var p = plant_list[| j];
                if (instance_exists(p) && p.hp > 0) { has_plant = true; break; }
            }
            if (has_plant) continue;

            // 找到可复活的卡片，进入攻击状态
            state = CARD_STATE.ATTACK;
            image_index = idle_anim + 1;
            timer = 0;
            break;
        }
    }
}

// 减伤BUFF：首次复活时施放到范围内所有卡片
if (buff_applied)
{
    var _my_id = id;
    var _bdur = buff_duration;
    var _red = chongsheng_reduction;
    for (var _col = grid_col - grid_range_col; _col <= grid_col + grid_range_col; _col++) {
        for (var _row = grid_row - grid_range_row; _row <= grid_row + grid_range_row; _row++) {
            if (_col < 0 || _col >= global.grid_cols || _row < 0 || _row >= global.grid_rows) continue;
            var _list = ds_grid_get(global.grid_plants, _col, _row);
            for (var _k = 0; _k < ds_list_size(_list); _k++) {
                var _p = _list[| _k];
                if (instance_exists(_p) && _p.hp > 0 && _p.id != _my_id) {
                    if (variable_instance_exists(_p, "chongsheng_buff_source")) {
                        _p.chongsheng_buff_source = _my_id;
                        _p.chongsheng_buff_timer = _bdur;
                        _p.chongsheng_buff_reduction = _red;
                    }
                }
            }
        }
    }
}

if (flash_value > 0) flash_value -= 10;

var grid_pos = get_grid_position_from_world(x, y);
grid_col = grid_pos.col;
grid_row = grid_pos.row;
depth = calculate_plant_depth(grid_col, grid_row, plant_type);
if (instance_exists(banding_star_obj)) {
    banding_star_obj.depth = depth - 1;
}

if (hp <= 0) instance_destroy();
