if (global.is_paused)
    exit;

event_inherited();

if (is_frozen)
    exit;

image_alpha = 1;

// 检测是否有黑暗神在场，计算伤害倍率
var dark_god_present = false;
var dark_god_final = false;
with (obj_heian_god)
{
    if (hp > 0)
    {
        dark_god_present = true;
        if (shape >= 3)
            dark_god_final = true;
        break;
    }
}

var damage_multiplier = 1;
if (shape == 2 && dark_god_present)
    damage_multiplier = 4;
else if (shape == 3)
{
    if (dark_god_final)
        damage_multiplier = 8;
    else if (dark_god_present)
        damage_multiplier = 5;
}

// 范围检测辅助变量
var _chk_range = grid_range;
var _chk_row = grid_row;
var _chk_col = grid_col;

// 检测范围内是否有敌人
var _has_enemy = false;

with (obj_enemy_parent)
{
    if (hp > 0)
    {
        var _rd = abs(grid_row - _chk_row);
        var _cd = abs(grid_col - _chk_col);
        if (_rd <= _chk_range && _cd <= _chk_range)
        {
            var _can_atk = true;
            if (variable_instance_exists(id, "is_non_mainstream") && is_non_mainstream)
                _can_atk = false;
            if (_can_atk)
            {
                _has_enemy = true;
                break;
            }
        }
    }
}

// 更新光环效果的位置和透明度
if (instance_exists(guangming_effect_obj))
{
    guangming_effect_obj.x = x;
    guangming_effect_obj.y = y - 30;
    if (state == CARD_STATE.ATTACK)
        guangming_effect_obj.image_alpha = 1;
    else
        guangming_effect_obj.image_alpha = 0.6;
}

if (state != CARD_STATE.SLEEP)
{
    if (state == CARD_STATE.IDLE)
    {
        attack_timer++;

        if (attack_timer >= cycle)
        {
            if (_has_enemy)
            {
                state = CARD_STATE.ATTACK;
                has_fired = false;
                timer = 0;
                image_index = idle_anim + 1;
                attack_timer = 0;

                // 攻击开始特效
                if (shape >= 1)
                {
                    var start_spr = spr_guangming_god_start_1;
                    if (shape >= 2)
                        start_spr = spr_guangming_god_start_2;

                    var boom = instance_create_depth(x, y - 30, depth - 100, obj_guangming_god_effect);
                    boom.sprite_index = start_spr;
                    boom.is_one_shot = true;
                    boom.frame_counter = 0;
                    boom.flash_speed = 5;
                }
            }
            else
            {
                attack_timer = 0;
            }
        }
    }
    else if (state == CARD_STATE.ATTACK)
    {
        // 第21帧：释放子弹并造成伤害
        if (!has_fired && image_index >= attack_fire_frame)
        {
            has_fired = true;

            // Phase 1: 收集范围内所有可攻击敌人
            var _enemies = [];
            with (obj_enemy_parent)
            {
                if (hp > 0)
                {
                    var _row_diff = abs(grid_row - _chk_row);
                    var _col_diff = abs(grid_col - _chk_col);
                    if (_row_diff <= _chk_range && _col_diff <= _chk_range)
                    {
                        var _can_attack = true;
                        if (variable_instance_exists(id, "is_non_mainstream") && is_non_mainstream)
                            _can_attack = false;
                        if (_can_attack)
                            array_push(_enemies, id);
                    }
                }
            }

            attack_targets = _enemies;
            attack_tick = 0;
            attack_tick_timer = 0;
        }

        // 每次攻击持续约2.1秒，均匀结算10次伤害。
        if (has_fired && attack_tick < 10)
        {
            attack_tick_timer++;
            if (attack_tick_timer >= 13)
            {
                attack_tick_timer = 0;
                attack_tick++;
                var _tick_atk = floor(atk * damage_multiplier);
                for (var _ti = 0; _ti < array_length(attack_targets); _ti++)
                {
                    var _te = attack_targets[_ti];
                    if (!instance_exists(_te) || _te.hp <= 0) continue;

                    var _tick_spr = spr_guangming_god_bullet;
                    if (shape == 1) _tick_spr = spr_guangming_god_bullet_1;
                    else if (shape >= 2) _tick_spr = spr_guangming_god_bullet_2;

                    var _bullet = instance_create_depth(_te.x, _te.y - 20, depth - 100, obj_guangming_god_bullet);
                    _bullet.sprite_index = _tick_spr;
                    var _impact = instance_create_depth(_te.x, _te.y - 20, depth - 150, obj_guangming_god_effect);
                    _impact.sprite_index = _tick_spr;
                    _impact.is_one_shot = true;
                    _impact.frame_counter = 0;
                    _impact.flash_speed = 4;
                    _impact.image_xscale = 1.5;
                    _impact.image_yscale = 1.5;

                    var _before = _te.hp;
                    _te.damage_amount = _tick_atk;
                    _te.damage_type = "holy";
                    with (_te)
                    {
                        event_user(0);
                    }
                    if (_before > 0 && _te.hp <= 0)
                    {
                        _te.ash_death = true;
                        instance_create_depth(_te.x, _te.y - 20, _te.depth, obj_mouse_ash_death);
                    }
                }
            }
        }

        // 攻击动画播放完毕（image_index回到攻击起点），回到待机
        if (has_fired && attack_tick >= 10 && image_index <= idle_anim + 1)
        {
            if (_has_enemy)
            {
                has_fired = false;
                attack_targets = [];
                attack_tick = 0;
                attack_tick_timer = 0;
            }
            else
            {
                state = CARD_STATE.IDLE;
                has_fired = false;
                image_index = 0;
                timer = 0;
                attack_timer = 0;
            }
        }
    }
}
