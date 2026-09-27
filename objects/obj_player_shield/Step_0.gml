if (global.is_paused)
    exit;

grid_row = parent_player.grid_row;
grid_col = parent_player.grid_col;
depth = parent_player.depth - 1;
origin_x = parent_player.x + 20;
origin_y = parent_player.y - 35;

for (var ei = 0; ei < array_length(shield_vfx_insts); ei++)
{
    shield_vfx_insts[ei].x = parent_player.x + shield_vfx_insts[ei].rel_x;
    shield_vfx_insts[ei].y = parent_player.y + shield_vfx_insts[ei].rel_y;
}

timer++;

if (!aura_created)
{
    if (is_gods_shield)
    {
        if (gods_flame_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 30, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_1;
            _eff.depth = parent_player.depth - 3;
            _eff.parent_player = parent_player;
            _eff.depth_offset = -3;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (gods_damage_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_2;
            _eff.depth = parent_player.depth + 149;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 149;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (gods_buff_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_3;
            _eff.depth = parent_player.depth + 150;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 150;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (gods_hp_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_4;
            _eff.depth = parent_player.depth + 148;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 148;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }
    }
    else if (is_master_shield)
    {
        if (gods_flame_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 30, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_1;
            _eff.depth = parent_player.depth - 3;
            _eff.parent_player = parent_player;
            _eff.depth_offset = -3;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (gods_damage_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_2;
            _eff.depth = parent_player.depth + 149;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 149;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (gods_buff_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_3;
            _eff.depth = parent_player.depth + 150;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 150;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (master_eye_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_master_shield_effect_4;
            _eff.depth = parent_player.depth + 148;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 148;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }
    }
    else if (is_rose_shield)
    {
        if (rose_flame_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_rose_shield_effect_5;
            _eff.depth = parent_player.depth + 8;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 8;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (rose_buff_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 15, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_rose_shield_effect_3;
            _eff.depth = parent_player.depth + 5;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 5;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }

        if (rose_dmg_gem)
        {
            var _eff = instance_create_depth_define(spawn_x - 17, spawn_y - 5, 0, obj_shield_aura);
            _eff.sprite_index = spr_rose_shield_effect_4;
            _eff.depth = parent_player.depth + 6;
            _eff.parent_player = parent_player;
            _eff.depth_offset = 6;
            array_push(shield_vfx_insts, _eff);
            _eff.rel_x = _eff.x - parent_player.x;
            _eff.rel_y = _eff.y - parent_player.y;
        }
    }
    
    aura_created = true;
}

if (parent_player.state == CARD_STATE.IDLE)
{
    anim_timer++;
    
    if (anim_timer >= 6)
    {
        anim_timer = 0;
        t += (t_speed * t_dir);
        
        if (t >= 1)
        {
            t = 1;
            t_dir = -1;
        }
        
        if (t <= -1)
        {
            t = -1;
            t_dir = 1;
        }
        
        var x_param = t;
        var y_param = (0.5 * t * t) - 1;
        x = origin_x + x_param;
        y = origin_y + y_param;
    }
}
else if (parent_player.state == CARD_STATE.ATTACK)
{
    anim_timer = 0;
    x = origin_x;
    y = origin_y;
    t = 0;
    t_dir = 1;
}

if (produce_gem)
{
    if (!first_produce)
    {
        if ((timer % first_produce_delay) == 0)
        {
            var f_inst = instance_create_depth_define(x, y - 50, -1300, obj_flame);
            f_inst.value = flame_produce;
            first_produce = true;
        }
    }
    else if ((timer % cycle) == 0)
    {
        var f_inst = instance_create_depth_define(x, y - 50, -1300, obj_flame);
        f_inst.value = flame_produce;
    }
}

if (slow_down_gem)
{
    if ((timer % slow_down_cycle) == 0)
    {
        var start_pos_x = (player_x + 10) - global.grid_cell_size_x;
        var start_pos_y = player_y - 35 - global.grid_cell_size_y;
        
        for (var i = 0; i < 3; i++)
        {
            for (var j = 0; j < 3; j++)
            {
                var grid_pos = get_grid_position_from_world(start_pos_x + (j * global.grid_cell_size_x), start_pos_y + (i * global.grid_cell_size_y));
                
                if (grid_pos.row >= 0 && grid_pos.row < global.grid_rows && grid_pos.col >= 0 && grid_pos.col < global.grid_cols)
                {
                    var inst = instance_create_depth_define(start_pos_x + (j * global.grid_cell_size_x), start_pos_y + (i * global.grid_cell_size_y), depth, obj_slowdown_gem_effect);
                    inst.row = (grid_row - 1) + i;
                }
            }
        }
    }
}

if (bleed_gem)
{
    if ((timer % 60) == 0)
    {
        var _x = player_x;
        var _y = player_y;
        var _range = 250;
        
        with (obj_enemy_parent)
        {
            if (hp > 0 && point_distance(x, y, _x, _y) < _range && grid_row >= (other.grid_row - 1) && grid_row <= (other.grid_row + 1))
            {
                hp -= other.bleed_damage;
                event_user(0);
            }
        }
    }
}

if (guard_gem || strength_gem)
{
    with (obj_card_parent)
    {
        if (grid_row >= (other.grid_row - 1) && grid_row <= (other.grid_row + 1) && grid_col >= (other.grid_col - 1) && grid_col <= (other.grid_col + 1) && array_get_index(other.blacklist, plant_id) == -1)
        {
            if (other.guard_gem)
            {
                if (array_get_index(other.hp_modified_card_list, id) == -1)
                {
                    max_hp += other.max_hp_increase;
                    array_push(other.hp_modified_card_list, id);
                }
                
                if ((other.timer % 60) == 0)
                {
                    if (hp < (max_hp - 10))
                    {
                        hp += 10;
                        instance_create_depth_define(x, y + 30, depth - 4, obj_card_heal_effect);
                    }
                    else if (hp < max_hp)
                    {
                        hp = max_hp;
                        instance_create_depth_define(x, y + 30, depth - 4, obj_card_heal_effect);
                    }
                }
            }
            
            if (other.strength_gem && array_get_index(other.atk_modified_card_list, id) == -1)
            {
                atk *= (other.atk_ratio + 1);
                array_push(other.atk_modified_card_list, id);
            }
        }
    }
}

if (gods_flame_gem)
{
    if (!gods_flame_first)
    {
        if ((timer % gods_flame_first_delay) == 0)
        {
            var _cnt = floor(gods_flame_value / 25);
            
            for (var fi = 0; fi < _cnt; fi++)
            {
                var f_inst = instance_create_depth_define(x + irandom_range(-15, 15), y - 50 - irandom_range(0, 25), -1300, obj_flame);
                f_inst.value = 25;
            }
            
            gods_flame_first = true;
        }
    }
    else if ((timer % gods_flame_cycle) == 0)
    {
        var _cnt = floor(gods_flame_value / 25);
        
        for (var fi = 0; fi < _cnt; fi++)
        {
            var f_inst = instance_create_depth_define(x + irandom_range(-15, 15), y - 50 - irandom_range(0, 25), -1300, obj_flame);
            f_inst.value = 25;
        }
    }
}

if (gods_damage_gem)
{
    if ((timer % 150) == 0)
    {
        var _dr = gods_damage_range;
        
        with (obj_enemy_parent)
        {
            if (hp > 0 && grid_row >= (other.grid_row - _dr) && grid_row <= (other.grid_row + _dr) && grid_col >= (other.grid_col - _dr) && grid_col <= (other.grid_col + _dr))
            {
                var _dmg = round((maxhp * other.gods_damage_rate) + other.gods_damage_atk);
                
                if (_dmg > other.gods_damage_max)
                    _dmg = other.gods_damage_max;
                
                damage_amount = _dmg;
                damage_type = "normal";
                event_user(0);
                audio_play_sound(hit_sound, 0, 0);
            }
        }
    }
}

if (gods_buff_gem)
{
    with (obj_card_parent)
    {
        if (array_get_index(other.blacklist, plant_id) == -1 && array_get_index(other.gods_buff_card_list, id) == -1)
        {
            var _in3x3 = grid_row >= (other.grid_row - 1) && grid_row <= (other.grid_row + 1) && grid_col >= (other.grid_col - 1) && grid_col <= (other.grid_col + 1);
            var _in5x5 = grid_row >= (other.grid_row - 2) && grid_row <= (other.grid_row + 2) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2);
            var _ratio = 0;
            
            if (_in3x3)
                _ratio = other.gods_buff_inner;
            else if (_in5x5)
                _ratio = other.gods_buff_outer;
            
            if (_ratio > 0)
            {
                atk *= (_ratio + 1);
                array_push(other.gods_buff_card_list, id);
            }
        }
    }
}

if (gods_hp_gem)
{
    with (obj_card_parent)
    {
        if (array_get_index(other.blacklist, plant_id) == -1 && array_get_index(other.gods_hp_card_list, id) == -1 && grid_row >= (other.grid_row - 2) && grid_row <= (other.grid_row + 2) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2))
        {
            var _inc = round(max_hp * other.gods_hp_rate);
            max_hp += _inc;
            hp += _inc;
            array_push(other.gods_hp_card_list, id);
        }
    }
}

if (master_eye_gem)
{
    if ((timer % 60) == 0 && ds_exists(master_eye_hit_map, ds_type_map))
    {
        var _keys = ds_map_keys_to_array(master_eye_hit_map);
        
        for (var ki = 0; ki < array_length(_keys); ki++)
        {
            if (!instance_exists(_keys[ki]))
                ds_map_delete(master_eye_hit_map, _keys[ki]);
        }
    }
    
    with (obj_enemy_parent)
    {
        if (hp > 0 && grid_row >= (other.grid_row - 2) && grid_row <= (other.grid_row + 2) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2))
        {
            var _last = ds_map_find_value(other.master_eye_hit_map, id);
            
            if (is_undefined(_last) || (other.timer - _last) >= 600)
            {
                damage_amount = other.master_eye_atk;
                damage_type = "normal";
                ice_timer = other.master_eye_slow;
                is_slowdown = true;
                event_user(0);
                audio_play_sound(hit_sound, 0, 0);
                ds_map_set(other.master_eye_hit_map, id, other.timer);
            }
        }
    }
}

if (rose_flame_gem)
{
    if (!rose_flame_first)
    {
        if ((timer % rose_flame_first_delay) == 0)
        {
            var _cnt = floor(rose_flame_value / 25);
            
            for (var fi = 0; fi < _cnt; fi++)
            {
                var f_inst = instance_create_depth_define(x + irandom_range(-15, 15), y - 50 - irandom_range(0, 25), -1300, obj_flame);
                f_inst.value = 25;
            }
            
            rose_flame_first = true;
        }
    }
    else if ((timer % rose_flame_cycle) == 0)
    {
        var _cnt = floor(rose_flame_value / 25);
        
        for (var fi = 0; fi < _cnt; fi++)
        {
            var f_inst = instance_create_depth_define(x + irandom_range(-15, 15), y - 50 - irandom_range(0, 25), -1300, obj_flame);
            f_inst.value = 25;
        }
    }
}

if (rose_buff_gem)
{
    with (obj_card_parent)
    {
        if (array_get_index(other.blacklist, plant_id) == -1 && array_get_index(other.rose_buff_card_list, id) == -1)
        {
            if (other.rose_buff_type == "5x5")
            {
                var _in3x3 = grid_row >= (other.grid_row - 1) && grid_row <= (other.grid_row + 1) && grid_col >= (other.grid_col - 1) && grid_col <= (other.grid_col + 1);
                var _in5x5 = grid_row >= (other.grid_row - 2) && grid_row <= (other.grid_row + 2) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2);
                var _ratio = 0;

                if (_in3x3)
                    _ratio = other.rose_buff_inner;
                else if (_in5x5)
                    _ratio = other.rose_buff_outer;

                if (_ratio > 0)
                {
                    atk *= (_ratio + 1);
                    array_push(other.rose_buff_card_list, id);
                }
            }
            else if (other.rose_buff_type == "5x7")
            {
                if (grid_row >= (other.grid_row - 3) && grid_row <= (other.grid_row + 3) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2))
                {
                    atk *= (other.rose_buff_ratio + 1);
                    array_push(other.rose_buff_card_list, id);
                }
            }
        }
    }
}

if (rose_needle_gem)
{
    if ((timer % rose_needle_cycle) == 0)
    {
        rose_needle_wave = 0;
        rose_needle_cd = 0;
    }
    
    if (rose_needle_wave < rose_needle_count)
    {
        if (rose_needle_cd <= 0)
        {
            var _dirs = [0, 45, 90, 135, 180, 225, 270, 315];
            
            for (var d = 0; d < 8; d++)
            {
                var inst = instance_create_depth_define(x, y, depth - 500, obj_rose_shield_bullet);
                inst.damage = rose_needle_atk;
                inst.direction = _dirs[d];
                inst.row = grid_row;
            }
            
            rose_needle_wave++;
            rose_needle_cd = 4;
        }
        else
        {
            rose_needle_cd--;
        }
    }
}

if (rose_dmg_gem)
{
    if ((timer % 60) == 0 && ds_exists(rose_dmg_fhit_map, ds_type_map))
    {
        var _keys = ds_map_keys_to_array(rose_dmg_fhit_map);
        
        for (var ki = 0; ki < array_length(_keys); ki++)
        {
            if (!instance_exists(_keys[ki]))
                ds_map_delete(rose_dmg_fhit_map, _keys[ki]);
        }
    }
    
    with (obj_enemy_parent)
    {
        if (hp > 0 && grid_row >= (other.grid_row - 3) && grid_row <= (other.grid_row + 3) && grid_col >= (other.grid_col - 2) && grid_col <= (other.grid_col + 2))
        {
            if (is_undefined(ds_map_find_value(other.rose_dmg_fhit_map, id)))
            {
                damage_amount = other.rose_dmg_atk_f;
                damage_type = "normal";
                event_user(0);
                audio_play_sound(snd_rose_shield, 0, 0);
                var effect_inst = instance_create_depth_define(x, y - 20, depth, obj_xiaolongbao_bullet_effect);
                effect_inst.sprite_index = spr_rose_shield_effect_1;
                ds_map_set(other.rose_dmg_fhit_map, id, 1);
            }
            
            if ((other.timer % 150) == 0)
            {
                var _dmg = round(other.rose_dmg_atk + (hp * other.rose_dmg_rate));
                
                if (_dmg > other.rose_dmg_max)
                    _dmg = other.rose_dmg_max;
                
                damage_amount = _dmg;
                damage_type = "normal";
                event_user(0);
                audio_play_sound(snd_rose_shield, 0, 0);
                var effect_inst = instance_create_depth_define(x, y - 20, depth, obj_xiaolongbao_bullet_effect);
                effect_inst.sprite_index = spr_rose_shield_effect_1;
            }
        }
    }
}
