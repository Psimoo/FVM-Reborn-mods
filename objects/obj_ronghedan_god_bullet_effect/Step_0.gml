if global.is_paused{
	exit
}
timer ++
image_index = floor(timer/3)

// 第6帧时炸开，造成溅射伤害
if (image_index >= 6 && !has_splashed) {
    has_splashed = true
    
    var _x = x
    var _y = y
    if instance_exists(hitted_enemy) {
        _x = hitted_enemy.x
        _y = hitted_enemy.y
    }
    
    var _range = 200
    var splash_ratio = 0.35
    if shape >= 1 {
        splash_ratio = 0.5
    }
    
    with (obj_enemy_parent) {
        if (hp > 0 && point_distance(x, y, _x, _y) < _range && grid_row <= other.row+1 && grid_row >= other.row-1 && id != other.hitted_enemy and can_hit(other.target_type, target_type)) {
            
            // 溅射伤害
            damage_amount = other.damage * splash_ratio
            damage_type = other.damage_type
            event_user(0)
            
            // 溅射附带定身效果（概率减半）
            var _chance = 10
            var _duration = 60
            if (other.shape >= 1) {
                _chance = 20
                _duration = 90
            }
            if (random(100) < _chance) {
                if (stun_timer < _duration) {
                    stun_timer = _duration
                }
            }
        }
    }
    
    // shape 2 及以上附加毒伤效果
    if (shape >= 2) {
        var grid_pos = get_grid_position_from_world(_x, _y)
        var inst = instance_create_depth(grid_pos.x, grid_pos.y, depth, obj_ronghedan_god_poison_effect)
        inst.damage = round(damage * splash_ratio)
        inst.grid_row = grid_pos.row
    }
    
    audio_play_sound(snd_egg_bullet, 0, 0)
}

if timer >= 18{
	instance_destroy()
}
