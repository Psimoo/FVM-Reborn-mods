var _pt = get_timer()
var inst = pool_acquire_bullet(obj_coffeecup_bullet, x+40, y-35, depth-500)
if (!variable_global_exists("_pool_first_bullet_measured")) {
    global._pool_first_bullet_measured = true
    show_debug_message("[对象池] 首只咖啡杯子弹创建耗时 " + string(get_timer() - _pt) + " us")
}
audio_play_sound(snd_coffee_cup_attack,0,0)
inst.damage = atk
inst.damage_type = "normal"
inst.target_type = "normal"
inst.move_speed = 8
inst.shape = shape
inst.row = grid_row
inst.col = grid_col
inst.start_col = grid_col
inst.state = 1
inst.state_timer = 0
inst.timer = 0
inst.disabled = false
inst.image_alpha = 1
inst.image_index = 0