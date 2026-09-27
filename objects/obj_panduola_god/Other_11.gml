// ===== 疫神·潘多拉：放置立即 3×3 灰烬爆炸 + 本行毒气 + (四转)全屏8000爆炸 + 鼠疫 =====
var _cx = grid_col;
var _cy = grid_row;

// 1) 3×3 灰烬爆炸（[攻击力] 伤害）
with (obj_enemy_parent)
{
    if (hp > 0 && abs(grid_col - _cx) <= 1 && abs(grid_row - _cy) <= 1 && can_hit(other.target_type, target_type))
    {
        damage_amount = other.atk;
        damage_type = "normal";
        event_user(0);
    }
}

// 2) 爆炸特效（复用可乐炸弹灰烬爆炸贴图）
var _exp = instance_create_depth(x, y, depth - 1, obj_coke_bomb_explode);
_exp.sprite_index = spr_coke_bomb_explode;

// 3) 本行毒气：3 次毒气伤害 [atk, atk×1.35, atk×1.35]，三转/四转毒气+35%
var _poison_mult = (shape >= 1) ? 1.35 : 1;
var _tick2 = round(atk * 1.35);
var _poison = instance_create_depth(x, y, depth + 1, obj_panduola_effect);
_poison.grid_row = _cy;
_poison.shape = shape;
_poison.target_type = target_type;
_poison.tick_damages = [round(atk * _poison_mult), round(_tick2 * _poison_mult), round(_tick2 * _poison_mult)];

// 4) 四转：全屏 8000 灰烬爆炸 + 鼠疫（每1s 造成 [体力×0.03+1215] ×3次）
if (shape >= 2)
{
    var _plague_hp = hp;
    with (obj_enemy_parent)
    {
        if (hp > 0)
        {
            damage_amount = 8000;
            damage_type = "normal";
            event_user(0);
        }
    }
    _poison.has_plague = true;
    _poison.plague_damage = min(1000000, round(_plague_hp * 0.03 + 1215));
}

audio_play_sound(snd_coke_bomb_explode, 0, false);
