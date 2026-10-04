if (global.is_paused)
{
    image_speed = 0;
    exit;
}

image_speed = 1;

// 垂直移动（向下）
y += move_speed;

// 水平摆动：第9列 -> 第8列 -> 第7列 -> 第8列
// 即从右往左扫，再回到中间
var target_x = 0;
var col_x_start = get_world_position_from_grid(start_col, 0).x;
var col_x_mid = get_world_position_from_grid(middle_col, 0).x;
var col_x_end = get_world_position_from_grid(end_col, 0).x;

if (phase == 0)
{
    // 第一阶段：从start_col向end_col移动（从右到左）
    target_x = col_x_end;
    x -= horizontal_speed;

    // 到达end_col后切换阶段
    if (x <= col_x_end)
    {
        x = col_x_end;
        phase = 1;
    }
}
else
{
    // 第二阶段：从end_col向middle_col移动（从左到右回到中间）
    target_x = col_x_mid;
    x += horizontal_speed;

    // 到达middle_col后停止水平移动
    if (x >= col_x_mid)
    {
        x = col_x_mid;
    }
}

// 更新当前所在列
var grid_pos = get_grid_position_from_world(x, y);
current_col = grid_pos.col;

// 超出底部边界销毁
if (y > 1200 || x < -100 || x > 2200)
{
    if (ds_exists(hitted_enemy, ds_type_list))
        ds_list_destroy(hitted_enemy);
    if (ds_exists(col_hit_count, ds_type_map))
        ds_map_destroy(col_hit_count);
    instance_destroy();
    exit;
}

// 碰撞检测：攻击当前列范围内（第7-9列）的所有行敌人
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
        var _list = bullet_sap_type_list(id, _key);
        for (var _i = 0; _i < array_length(_list); _i++)
        {
            var _e = _list[_i];
            if (!instance_exists(_e)) continue;

            // 只攻击第7-9列的敌人
            if (_e.grid_col < end_col || _e.grid_col > start_col)
                continue;

            // 检查该列是否还能造成伤害（第8列最多2次，其他列最多1次）
            var col_key = string(_e.grid_col);
            var max_hits = 1;
            if (_e.grid_col == middle_col)
                max_hits = 2;

            var cur_hits = 0;
            if (ds_map_exists(col_hit_count, col_key))
                cur_hits = ds_map_find_value(col_hit_count, col_key);

            if (cur_hits >= max_hits)
                continue;

            // 检查是否已经命中过这个敌人
            if (ds_list_find_index(hitted_enemy, _e.id) == -1
                && _e.hp > 0
                && precise_bbox_collision(id, _e))
            {
                var _prev_hp = _e.hp;

                with (_e)
                {
                    audio_play_sound(hit_sound, 0, 0);
                    damage_amount = other.damage;
                    damage_type = other.damage_type;
                    event_user(0);
                }

                ds_list_add(hitted_enemy, _e.id);

                // 更新该列的命中计数
                var new_hits = cur_hits + 1;
                ds_map_replace(col_hit_count, col_key, new_hits);

                // 击杀灰烬效果
                if (ash_kill && _prev_hp > 0 && _e.hp <= 0)
                {
                    instance_create_depth(_e.x, _e.y - 20, depth, obj_mouse_ash_death);
                }
            }
        }
    }
}
	}
}

