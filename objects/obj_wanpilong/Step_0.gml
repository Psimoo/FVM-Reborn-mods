/// @description 顽皮龙 - 步事件（完整状态机实现）
if (global.is_paused)
    exit;

event_inherited();

if (is_frozen)
    exit;

// ============================================
// 辅助函数：获取当前冷却时间（根据强化等级）
// ============================================
function wanpilong_get_cooldown()
{
    var _skill_entry = noone;
    if (ds_map_exists(global.skill_registry, "wanpilong"))
        _skill_entry = global.skill_registry[? "wanpilong"];

    if (_skill_entry != noone && is_array(_skill_entry) && array_length(_skill_entry) >= 2)
    {
        var _cooldown_array = _skill_entry[1];
        var _lvl = clamp(current_level, 0, array_length(_cooldown_array) - 1);
        return _cooldown_array[_lvl];
    }

    // 默认冷却 55 秒（转帧）
    return 55 * 60;
}

// ============================================
// 辅助函数：检查源目标是否合法
// ============================================
function wanpilong_is_valid_source(_inst)
{
    if (!instance_exists(_inst))
        return false;

    // 不能选自己
    if (_inst == id)
        return false;

    // 检查是否是玩家角色（二转可用）
    if (variable_instance_exists(_inst, "plant_id") && _inst.plant_id == "player")
    {
        if (!can_move_character)
            return false;
        if (_inst.hp <= 0)
            return false;
        // 检查角色是否处于可移动状态
        if (variable_instance_exists(_inst, "state") && _inst.state == CARD_STATE.DEAD)
            return false;
        return true;
    }

    // 检查是否是己方卡片
    if (variable_instance_exists(_inst, "plant_id"))
    {
        // 必须有 grid_col/grid_row
        if (!variable_instance_exists(_inst, "grid_col") || !variable_instance_exists(_inst, "grid_row"))
            return false;

        if (_inst.grid_col < 0 || _inst.grid_row < 0)
            return false;

        // 检查可被移动标记
        if (variable_instance_exists(_inst, "can_be_moved_by_wanpilong") && !_inst.can_be_moved_by_wanpilong)
            return false;

        // 检查存活状态
        if (variable_instance_exists(_inst, "hp") && _inst.hp <= 0)
            return false;
        if (variable_instance_exists(_inst, "state") && _inst.state == CARD_STATE.DEAD)
            return false;

        // 检查是否可铲除（不可铲除的通常也不可移动）
        if (variable_instance_exists(_inst, "can_shovel_remove") && !_inst.can_shovel_remove)
            return false;

        return true;
    }

    return false;
}

// ============================================
// 辅助函数：检查目标格是否合法（空格+范围内）
// ============================================
function wanpilong_is_valid_dest(_col, _row)
{
    // 边界检查
    if (_col < 0 || _col >= global.grid_cols || _row < 0 || _row >= global.grid_rows)
        return false;

    // 不能是源位置
    if (_col == source_entity_grid_col && _row == source_entity_grid_row)
        return false;

    // 范围检查
    if (!is_fullscreen_range)
    {
        var _dx = abs(_col - source_entity_grid_col);
        var _dy = abs(_row - source_entity_grid_row);
        if (_dx > range_radius || _dy > range_radius)
            return false;
    }

    // 地形检查
    if (global.grid_terrains[_row][_col].type == "obstacle")
        return false;

    // 空格检查
    var _plant_list = ds_grid_get(global.grid_plants, _col, _row);
    if (ds_list_size(_plant_list) > 0)
    {
        // 如果源是玩家角色，允许格子上有植物吗？不，角色也需要空格
        return false;
    }

    return true;
}

// ============================================
// 辅助函数：移动实体（原子操作）
// ============================================
function wanpilong_move_entity(_entity, _from_col, _from_row, _to_col, _to_row)
{
    if (!instance_exists(_entity))
        return false;

    // 记录原始位置（用于计算装备偏移）
    var _orig_x = _entity.x;
    var _orig_y = _entity.y;

    // 1. 从原格子移除
    card_destroyed(_entity);

    // 2. 计算目标世界坐标
    var _dest_pos = get_world_position_from_grid(_to_col, _to_row);

    // 3. 移动实体
    _entity.x = _dest_pos.x;
    _entity.y = _dest_pos.y;

    // 4. 添加到新格子
    card_created(_entity, _to_col, _to_row);

    // 5. 更新实体自身的网格坐标
    _entity.grid_col = _to_col;
    _entity.grid_row = _to_row;

    // 6. 移动绑定对象（星级贴图、水面特效、睡眠特效等）
    if (variable_instance_exists(_entity, "banding_star_obj") && instance_exists(_entity.banding_star_obj))
    {
        _entity.banding_star_obj.x = _dest_pos.x;
        _entity.banding_star_obj.y = _dest_pos.y - 5;
    }
    if (variable_instance_exists(_entity, "banding_water_obj") && instance_exists(_entity.banding_water_obj))
    {
        _entity.banding_water_obj.x = _dest_pos.x;
        _entity.banding_water_obj.y = _dest_pos.y;
    }
    if (variable_instance_exists(_entity, "banding_sleep_obj") && instance_exists(_entity.banding_sleep_obj))
    {
        _entity.banding_sleep_obj.x = _dest_pos.x;
        _entity.banding_sleep_obj.y = _dest_pos.y;
    }
    if (variable_instance_exists(_entity, "inner_inst") && instance_exists(_entity.inner_inst))
    {
        _entity.inner_inst.x += _dest_pos.x - _orig_x;
        _entity.inner_inst.y += _dest_pos.y - _orig_y;
    }

    // 7. 如果是玩家角色，需要额外处理（角色逻辑）
    if (variable_instance_exists(_entity, "plant_id") && _entity.plant_id == "player")
    {
        // 清空旧路径（如果有）
        if (variable_instance_exists(_entity, "target_x"))
            _entity.target_x = _dest_pos.x;
        if (variable_instance_exists(_entity, "target_y"))
            _entity.target_y = _dest_pos.y;
        // 重新寻敌
        if (variable_instance_exists(_entity, "attack_timer"))
            _entity.attack_timer = 0;

        // 移动所有绑定的装备（武器、盾牌等）
        var _dx = _dest_pos.x - _orig_x;
        var _dy = _dest_pos.y - _orig_y;
        with (all)
        {
            if (variable_instance_exists(id, "parent_player") && parent_player == _entity)
            {
                x += _dx;
                y += _dy;
                // 更新网格坐标
                if (variable_instance_exists(id, "grid_col"))
                    grid_col = _to_col;
                if (variable_instance_exists(id, "grid_row"))
                    grid_row = _to_row;

                // 如果是盾牌，还需要移动其特效数组中的特效
                if (variable_instance_exists(id, "shield_vfx_insts") && is_array(shield_vfx_insts))
                {
                    for (var _ei = 0; _ei < array_length(shield_vfx_insts); _ei++)
                    {
                        if (instance_exists(shield_vfx_insts[_ei]))
                        {
                            shield_vfx_insts[_ei].x += _dx;
                            shield_vfx_insts[_ei].y += _dy;
                        }
                    }
                }
            }
        }
    }
    else
    {
        // 卡片：刷新寻敌和光环
        if (variable_instance_exists(_entity, "buff_cells_refreshed"))
            _entity.buff_cells_refreshed = false;
    }

    // 8. 全局buff标记脏
    global.buff_dirty = true;

    return true;
}

// ============================================
// 辅助函数：取消释放，回滚
// ============================================
function wanpilong_cancel_cast()
{
    cast_cancelled = true;

    // 返还耗能
    if (variable_global_exists("player_flame"))
        global.player_flame += wanpilong_cost;

    // 清除高亮
    ds_list_clear(highlight_cells);

    // 回到空闲或开始冷却（按方案：取消不进入冷却）
    wanpilong_state = WANPILONG_STATE.IDLE;

    // 重置变量
    source_entity = noone;
    source_entity_grid_col = -1;
    source_entity_grid_row = -1;
    source_is_character = false;
    dest_grid_col = -1;
    dest_grid_row = -1;
    pre_swing_timer = 0;
}

// ============================================
// 状态：IDLE - 空闲
// ============================================
function step_idle()
{
    // 播放待机动画
    image_index += 0.15;
    if (image_index >= idle_anim)
        image_index = 0;

    // 等待被激活（通过点击释放技能）
    // 实际激活由 card_slot 的点击事件触发
    // 这里检测全局激活标记
    if (variable_global_exists("wanpilong_active_id") && global.wanpilong_active_id == id)
    {
        // 进入第一段选点
        wanpilong_state = WANPILONG_STATE.TARGETING_SOURCE;
        global.wanpilong_active_id = noone;
    }
}

// ============================================
// 状态：TARGETING_SOURCE - 第一段选点（选源目标）
// ============================================
function step_targeting_source()
{
    // 待机动画
    image_index += 0.15;
    if (image_index >= idle_anim)
        image_index = 0;

    // 鼠标位置转网格
    var _mouse_grid = get_grid_position_from_world(mouse_x, mouse_y);

    // 查找鼠标位置的实体
    var _hovered_entity = noone;

    // 边界检查：鼠标在地图范围内才访问网格
    if (_mouse_grid.col >= 0 && _mouse_grid.col < global.grid_cols &&
        _mouse_grid.row >= 0 && _mouse_grid.row < global.grid_rows)
    {
        var _plant_list = ds_grid_get(global.grid_plants, _mouse_grid.col, _mouse_grid.row);

        for (var i = ds_list_size(_plant_list) - 1; i >= 0; i--)
        {
            var _plant = ds_list_find_value(_plant_list, i);
            if (instance_exists(_plant) && wanpilong_is_valid_source(_plant))
            {
                _hovered_entity = _plant;
                break;
            }
        }
    }

    // 右键取消
    if (mouse_check_button_pressed(mb_right))
    {
        wanpilong_cancel_cast();
        return;
    }

    // 左键确认
    if (mouse_check_button_pressed(mb_left))
    {
        if (_hovered_entity != noone)
        {
            // 确认源目标
            source_entity = _hovered_entity;
            source_entity_grid_col = _hovered_entity.grid_col;
            source_entity_grid_row = _hovered_entity.grid_row;
            source_is_character = (variable_instance_exists(_hovered_entity, "plant_id") && _hovered_entity.plant_id == "player");

            // 进入前摇
            wanpilong_state = WANPILONG_STATE.PRE_SWING;
            pre_swing_timer = 0;

            // 播放种植音效（占位）
            // audio_play_sound(snd_wanpilong_plant, 1, false);
        }
    }
}

// ============================================
// 状态：SOURCE_CONFIRMED - 源目标已确认（过渡态，实际直接进前摇）
// ============================================
function step_source_confirmed()
{
    // 此状态为过渡，实际逻辑已合并
    wanpilong_state = WANPILONG_STATE.PRE_SWING;
}

// ============================================
// 状态：PRE_SWING - 前摇
// ============================================
function step_pre_swing()
{
    // 前摇动画
    image_index += 0.2;
    if (image_index >= idle_anim)
        image_index = idle_anim - 1;

    pre_swing_timer++;

    // 前摇期间源目标失效检测
    if (!wanpilong_is_valid_source(source_entity))
    {
        // 源目标失效，取消释放
        wanpilong_cancel_cast();
        return;
    }

    // 右键取消（前摇期间可取消）
    if (mouse_check_button_pressed(mb_right))
    {
        wanpilong_cancel_cast();
        return;
    }

    // 前摇完成
    if (pre_swing_timer >= pre_swing_frames)
    {
        // 进入第二段选点
        wanpilong_state = WANPILONG_STATE.TARGETING_DEST;

        // 播放范围展开特效音效（占位）
        // audio_play_sound(snd_wanpilong_range, 1, false);

        // 生成高亮格子
        wanpilong_generate_highlight();
    }
}

// ============================================
// 辅助：生成目标范围高亮
// ============================================
function wanpilong_generate_highlight()
{
    ds_list_clear(highlight_cells);

    if (is_fullscreen_range)
    {
        // 全屏：遍历所有合法空格
        for (var c = 0; c < global.grid_cols; c++)
        {
            for (var r = 0; r < global.grid_rows; r++)
            {
                if (wanpilong_is_valid_dest(c, r))
                {
                    ds_list_add(highlight_cells, c, r);
                }
            }
        }
    }
    else
    {
        // 5x5 范围
        for (var dc = -range_radius; dc <= range_radius; dc++)
        {
            for (var dr = -range_radius; dr <= range_radius; dr++)
            {
                var c = source_entity_grid_col + dc;
                var r = source_entity_grid_row + dr;
                if (wanpilong_is_valid_dest(c, r))
                {
                    ds_list_add(highlight_cells, c, r);
                }
            }
        }
    }
}

// ============================================
// 状态：TARGETING_DEST - 第二段选点（选目标格）
// ============================================
function step_targeting_dest()
{
    // 动画
    image_index += 0.15;
    if (image_index >= idle_anim)
        image_index = 0;

    // 源目标实时校验
    if (!wanpilong_is_valid_source(source_entity))
    {
        wanpilong_cancel_cast();
        return;
    }

    // 鼠标位置转网格
    var _mouse_grid = get_grid_position_from_world(mouse_x, mouse_y);
    var _col = _mouse_grid.col;
    var _row = _mouse_grid.row;

    // 右键取消
    if (mouse_check_button_pressed(mb_right))
    {
        wanpilong_cancel_cast();
        return;
    }

    // 刷新高亮（目标格被占用时动态更新）
    wanpilong_generate_highlight();

    // 左键确认目标
    if (mouse_check_button_pressed(mb_left))
    {
        if (wanpilong_is_valid_dest(_col, _row))
        {
            dest_grid_col = _col;
            dest_grid_row = _row;
            wanpilong_state = WANPILONG_STATE.RESOLVING;
        }
        else
        {
            // 非法目标，播放失败音效（占位）
            // audio_play_sound(snd_wanpilong_invalid, 1, false);
        }
    }
}

// ============================================
// 状态：RESOLVING - 结算
// ============================================
function step_resolving()
{
    if (cast_resolved)
        return;

    cast_resolved = true;

    // 最终校验
    if (!wanpilong_is_valid_source(source_entity) || !wanpilong_is_valid_dest(dest_grid_col, dest_grid_row))
    {
        wanpilong_cancel_cast();
        return;
    }

    // 执行移动
    var _success = wanpilong_move_entity(source_entity, source_entity_grid_col, source_entity_grid_row, dest_grid_col, dest_grid_row);

    if (_success)
    {
        // 播放传送特效（占位：创建一个简单的特效对象）
        // instance_create_depth(source_entity.x, source_entity.y, depth - 10, obj_wanpilong_effect);

        // 扣除耗能（已经在释放时预留，这里确认扣除）
        // 实际耗能在 card_slot 点击时已扣，成功则不返还

        // 一次性卡片：移动成功后淡出销毁
        state = CARD_STATE.DEAD;
        fade_out_timer = 0;
        wanpilong_state = WANPILONG_STATE.FADING_OUT;

        // 从网格移除
        card_destroyed(id);

        // 清除高亮
        ds_list_clear(highlight_cells);

        // 播放成功音效（占位）
        // audio_play_sound(snd_wanpilong_success, 1, false);
    }
    else
    {
        // 移动失败，回滚
        wanpilong_cancel_cast();
    }
}

// ============================================
// 状态：COOLDOWN - 冷却中
// ============================================
function step_cooldown()
{
    // 冷却动画（慢速播放）
    image_index += 0.05;
    if (image_index >= idle_anim)
        image_index = 0;

    cooldown_timer++;

    if (cooldown_timer >= cooldown_total)
    {
        // 冷却完成，回到空闲
        wanpilong_state = WANPILONG_STATE.IDLE;
        cooldown_timer = 0;
        cast_resolved = false;
        cast_cancelled = false;

        // 通知 card_slot 冷却完成
        // （通过全局事件或变量通知）
    }
}

// ============================================
// 状态：FADING_OUT - 淡出销毁（卡片死亡时）
// ============================================
function step_fading_out()
{
    fade_out_timer++;
    image_alpha -= 0.05;

    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}

// ============================================
// 主状态机驱动
// ============================================

switch (wanpilong_state)
{
    case WANPILONG_STATE.IDLE:
        step_idle();
        break;

    case WANPILONG_STATE.TARGETING_SOURCE:
        step_targeting_source();
        break;

    case WANPILONG_STATE.SOURCE_CONFIRMED:
        step_source_confirmed();
        break;

    case WANPILONG_STATE.PRE_SWING:
        step_pre_swing();
        break;

    case WANPILONG_STATE.TARGETING_DEST:
        step_targeting_dest();
        break;

    case WANPILONG_STATE.RESOLVING:
        step_resolving();
        break;

    case WANPILONG_STATE.COOLDOWN:
        step_cooldown();
        break;

    case WANPILONG_STATE.FADING_OUT:
        step_fading_out();
        break;
}
