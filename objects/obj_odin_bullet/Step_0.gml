if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;
x += move_speed;

if (burnt == 1)
    sprite_index = spr_fire_bullet;

if (x > 2200 || y > 1200 || x < 0 || y < 0)
{
    instance_destroy();
    exit;
}

// Use the unscaled sprite bbox for reflection and obstacle blocking.
if (!bounced)
{
    with (obj_water_god)
    {
        if (other.row == grid_row && precise_bbox_collision(other.id, id))
        {
            other.move_speed *= -1;
            other.damage += atk;
            other.image_angle += 180;
            other.bounced = true;
            break;
        }
    }
}

with (obj_obstacle)
{
    if (other.target_type == "normal" && other.row == row
        && precise_bbox_collision(other.id, id))
    {
        if (other.burnt == 0)
        {
            var _effect = instance_create_depth(other.x, other.y, other.depth, obj_corn_shooter_effect);
            _effect.sprite_index = spr_corn_shooter_bullet_effect;
        }
        else
        {
            var _effect = instance_create_depth(other.x + 25, other.y, other.depth, obj_fire_bullet_effect);
            _effect.sprite_index = spr_fire_bullet_effect;
        }
        instance_destroy(other.id);
    }
}

if (!instance_exists(id))
    exit;

// 类型过滤碰撞检测
if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;
if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = 2;
hit_tick++;
if (hit_tick >= global.bullet_hit_interval)
{
	hit_tick = 0;
	if (bullet_enemy_reachable(id)) {
if (variable_global_exists("enemy_by_type"))
{
    for (var _t = 0; _t < array_length(hittable_types); _t++)
    {
        var _key = hittable_types[_t];
        if (!variable_struct_exists(global.enemy_by_type, _key)) continue;
        var _list = global.enemy_by_type[$ _key];
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e)) continue;
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
            {
                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }
                ds_list_add(hitted_enemy, _e.id);
            }
        }
    }
}
	}
}

