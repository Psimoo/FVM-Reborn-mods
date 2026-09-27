// 死亡时发生爆炸
event_inherited();

// 创建爆炸视觉效果
var effect_inst = instance_create_depth(x, y, depth, obj_coke_bomb_explode);
effect_inst.sprite_index = spr_coke_bomb_explode;

// 播放爆炸音效
audio_play_sound(snd_coke_bomb_explode, 0, false);

// 屏幕震动
if (global.screen_shake) {
    Camera_Shock(5, 20);
}

// 对3x3范围内敌人造成伤害
with (obj_enemy_parent) {
    if (grid_row >= other.grid_row - 1 && grid_row <= other.grid_row + 1
        && grid_col >= other.grid_col - 1 && grid_col <= other.grid_col + 1) {
        var can_ash = !immune_to_ash;
        var _prev_hp = hp;
        hp -= 900;
        event_user(0);

        if (can_ash && _prev_hp > 0 && hp <= 0) {
            if ((is_boss || string_pos("infected_", mouse_id) == 1) && special_ash) {
                var inst = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                inst.special_ash = true;
                inst.sprite_index = sprite_index;
                inst.image_index = image_index;
            } else {
                instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
            }
            instance_destroy();
        }
    }
}
