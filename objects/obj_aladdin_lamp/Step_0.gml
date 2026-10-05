if (global.is_paused)
    exit;

var pos = get_world_position_from_grid(grid_row, grid_col);
x = pos.x + 5;
y = pos.y;

if (timer < (flash_speed - 1))
{
    timer++;
}
else
{
    switch (state)
    {
        case CARD_STATE.IDLE:
            if (image_index < (idle_anim - 1))
                image_index++;
            else
                image_index = 0;

            break;

        case CARD_STATE.ATTACK:
            var _as = idle_anim;
            var _ae = (idle_anim + attack_anim) - 1;

            if (image_index < _as || image_index > _ae)
                image_index = _as;
            else if (image_index < _ae)
                image_index++;
            else
                image_index = _as;

            break;
    }
    
    timer = 0;
}

depth = -500;

if (cooldown > 0)
    cooldown--;

if (!is_attacking && cooldown <= 0)
{
    var _target = -4;
    
    with (obj_enemy_parent)
    {
        if (hp <= 0 || pooled)
            continue;
        _target = id;
        break;
    }
    
    if (_target != -4)
    {
        is_attacking = true;
        attack_timer = 0;
    }
}

if (is_attacking)
{
    state = CARD_STATE.ATTACK;
    attack_timer++;
    var _gap = 10;
    
    for (var i = 0; i < bullet_amount; i++)
    {
        if (attack_timer == (1 + (i * _gap)))
        {
            fire_dir = 270;
            event_user(1);
        }
    }
    
    for (var i = 0; i < bullet_amount; i++)
    {
        if (attack_timer == (121 + (i * _gap)))
        {
            fire_dir = 90;
            event_user(1);
        }
    }
    
    if (attack_timer >= (121 + (bullet_amount * _gap) + 10))
    {
        is_attacking = false;
        attack_timer = 0;
        cooldown = cycle;
    }
}
else
{
    state = CARD_STATE.IDLE;
}

