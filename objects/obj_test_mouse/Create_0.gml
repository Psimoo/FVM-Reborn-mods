event_inherited()
image_xscale = 1.8
image_yscale = 1.8
image_speed = 0
move_speed = 0
hp = 2147483647
maxhp = 2147483647
atk = 0
hurt_rate = 0
state = ENEMY_STATE.IDLE
flash_speed = 6
attack_anim = 4
move_anim = 8
death_anim = 13
flash_value = 0
timer = 0
attack_timer = 0
target_plant = noone
attack_range = 0
// 测试鼠用于承受伤害统计，免疫灰烬类秒杀效果。
immune_to_ash = true
is_slowdown = false
ice_timer = 0
is_frozen = false
frozen_timer = 0
ice_sprite = spr_mouse_frozen
current_frozen = false

shader_hit = hit_effect_2
u_progress = shader_get_uniform(shader_hit, "u_progress");
u_flashColor = shader_get_uniform(shader_hit, "u_flashColor");

flash_color = #FFFFFF

grid_col = 99
grid_row = 99

test_damage_total = 0
