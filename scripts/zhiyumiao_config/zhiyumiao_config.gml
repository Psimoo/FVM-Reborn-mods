/// @desc 治愈喵配置：所有数值集中管理，禁止散落硬编码

function zhiyumiao_config_init() {
    global.zhiyumiao_config = {
        // 基础属性
        id: "zhiyumiao",
        type: "support",
        energyCost: 75,
        placeCondition: "all_day",
        strengthenable: ["cooldown"],
        skillEnhancementSupported: false,

        // 图鉴
        collection: {
            group: "生肖卡·鼠年卡",
            bonusEnabled: false
        },

        // 副卡评级
        secondaryCardRating: "good",

        // 续费
        renewal: {
            currency: "point_coupon",
            price: 60000,
            duration: "permanent"
        },

        // 即刻治疗量（按阶段）
        instantHeal: {
            stage0: 50,
            stage1: 80,
            stage2: 80
        },

        // 范围配置
        range: {
            stage0: { type: "square", size: 5, radius: 2 },
            stage1: { type: "square", size: 5, radius: 2 },
            stage2: { type: "full_board" }
        },

        // 卡牌体力（max_hp）
        cardStamina: {
            stage0: 50,
            stage1: 80,
            stage2: 80
        },

        // 一转/二转补血Buff参数（按阶段）
        regen: {
            stage1: {
                durationMs: 3000,
                totalHeal: 240,
                tickIntervalMs: 1000,
                tickAmount: 80
            },
            stage2: {
                durationMs: 3000,
                totalHeal: 240,
                tickIntervalMs: 1000,
                tickAmount: 80
            },
            stacking: "refresh_same_source"
        },

        // 冷却平衡表（0~16级，单位：秒）
        // 此表仅用于平衡评估展示，运行时冷却由卡牌cycle字段驱动
        balanceCurve: {
            cooldownLevels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
            zhiyumiao: [47, 45, 43, 41, 39, 37, 35, 33, 31, 29, 26, 23, 20, 17, 14, 11, 8],
            reference2ndAnniversary: [60, 58, 56, 54, 52, 50, 48, 46, 44, 42, 40, 38, 36, 34, 32, 30, 28],
            runtimeEffect: false
        },

        // 转职路径
        evolutionPath: ["治愈喵", "武装治愈喵", "全能治愈喵"]
    };
}

/// @desc 获取治愈喵配置项
function zhiyumiao_get_config() {
    return global.zhiyumiao_config;
}

/// @desc 获取指定阶段的范围半径（格子数）
function zhiyumiao_get_range_radius(_stage) {
    var _cfg = global.zhiyumiao_config;
    if (_stage == 0) return _cfg.range.stage0.radius;
    if (_stage == 1) return _cfg.range.stage1.radius;
    return -1; // 全屏
}

/// @desc 获取指定阶段的即刻治疗量
function zhiyumiao_get_heal_amount(_stage) {
    var _cfg = global.zhiyumiao_config;
    if (_stage == 0) return _cfg.instantHeal.stage0;
    if (_stage == 1) return _cfg.instantHeal.stage1;
    return _cfg.instantHeal.stage2;
}

/// @desc 判断指定阶段是否为全屏范围
function zhiyumiao_is_full_board(_stage) {
    return _stage >= 2;
}

/// @desc 判断指定阶段是否有回血Buff
function zhiyumiao_has_regen(_stage) {
    return _stage >= 1;
}

/// @desc 对目标施加或刷新回血Buff（同源刷新，不叠层）
function zhiyumiao_apply_regen_buff(_source_id, _target_id, _stage) {
    if (!instance_exists(_target_id) || _target_id.hp <= 0)
        return noone;

    if (!variable_instance_exists(_target_id, "max_hp"))
        return noone;

    var _cfg = global.zhiyumiao_config;
    var _regen_cfg = (_stage >= 2) ? _cfg.regen.stage2 : _cfg.regen.stage1;
    var _found = false;
    var _buff_id = noone;

    with (obj_zhiyumiao_regen_buff) {
        if (source_id == _source_id && target_id == _target_id) {
            elapsed_frames = 0;
            tick_timer_frames = 0;
            tick_amount = _regen_cfg.tickAmount;
            duration_frames = round(_regen_cfg.durationMs * 60 / 1000);
            tick_interval_frames = round(_regen_cfg.tickIntervalMs * 60 / 1000);
            _found = true;
            _buff_id = id;
        }
    }

    if (!_found) {
        _buff_id = instance_create_depth(_target_id.x, _target_id.y, _target_id.depth - 10, obj_zhiyumiao_regen_buff);
        _buff_id.target_id = _target_id;
        _buff_id.source_id = _source_id;
        _buff_id.duration_frames = round(_regen_cfg.durationMs * 60 / 1000);
        _buff_id.tick_interval_frames = round(_regen_cfg.tickIntervalMs * 60 / 1000);
        _buff_id.tick_amount = _regen_cfg.tickAmount;
    }

    return _buff_id;
}

/// @desc 对单个目标执行即刻治疗，返回实际治疗量
function zhiyumiao_instant_heal(_target, _heal_amount) {
    if (!instance_exists(_target) || _target.hp <= 0)
        return 0;

    if (!variable_instance_exists(_target, "max_hp"))
        return 0;

    var _applied = min(_heal_amount, _target.max_hp - _target.hp);
    if (_applied > 0) {
        _target.hp += _applied;
        instance_create_depth(_target.x, _target.y + 30, _target.depth - 4, obj_card_heal_effect);
    }

    return _applied;
}

/// @desc 对玩家角色执行即刻治疗，返回实际治疗量
function zhiyumiao_heal_player(_heal_amount) {
    if (!instance_exists(obj_player_character))
        return 0;

    var _player = obj_player_character;
    if (_player.hp <= 0 || !variable_instance_exists(_player, "max_hp"))
        return 0;

    var _applied = min(_heal_amount, _player.max_hp - _player.hp);
    if (_applied > 0) {
        _player.hp += _applied;
        instance_create_depth(_player.x, _player.y + 30, _player.depth - 4, obj_card_heal_effect);
    }

    return _applied;
}

/// @desc 5x5范围内治疗所有有效友方卡片
function zhiyumiao_heal_area_5x5(_source, _heal_amount, _apply_regen, _stage) {
    var _radius = zhiyumiao_get_range_radius(_stage);
    var _total_healed = 0;

    with (obj_card_parent) {
        if (hp > 0 && abs(grid_col - other.grid_col) <= _radius && abs(grid_row - other.grid_row) <= _radius) {
            var _applied = zhiyumiao_instant_heal(id, _heal_amount);
            _total_healed += _applied;

            if (_apply_regen && _applied >= 0) {
                zhiyumiao_apply_regen_buff(_source, id, _stage);
            }
        }
    }

    return _total_healed;
}

/// @desc 全屏治疗所有有效友方卡片
function zhiyumiao_heal_full_board(_source, _heal_amount, _apply_regen, _stage) {
    var _total_healed = 0;

    with (obj_card_parent) {
        if (hp > 0) {
            var _applied = zhiyumiao_instant_heal(id, _heal_amount);
            _total_healed += _applied;

            if (_apply_regen && _applied >= 0) {
                zhiyumiao_apply_regen_buff(_source, id, _stage);
            }
        }
    }

    return _total_healed;
}
