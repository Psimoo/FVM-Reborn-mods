if global.is_paused {
    exit
}

remove_timer++

if remove_timer == 1 {
    with obj_card_parent {
        if grid_row == other.grid_row && grid_col == other.grid_col && plant_id == "lingrong_god" && id != other.id {
            instance_destroy()
        }
    }
}

if grid_row >= 0 && grid_col >= 0 && grid_row < global.grid_rows && grid_col < global.grid_cols {
    var terrain_type = global.grid_terrains[grid_row][grid_col].type
    if terrain_type == "water" || on_lava {
        plant_type = "lilypad"
    } else {
        plant_type = "coffee"
    }
}

event_inherited()

depth = calculate_plant_depth(grid_col, grid_row, "lilypad") + 2

with obj_cloud {
    if is_hole && col > 1 &&
       ((other.shape == 0 && row == other.grid_row && abs(col - other.grid_col) <= 1) ||
        (other.shape >= 1 && abs(row - other.grid_row) <= 1 && abs(col - other.grid_col) <= 1)) {
        is_hole = false
        image_alpha = 1
    }
}

var current_flash_speed = flash_speed
if is_slowdown {
    current_flash_speed *= 2
}

if anim_timer < current_flash_speed - 1 {
    anim_timer++
} else {
    anim_timer = 0
    if !placed {
        if anim_frame < f_place_end {
            anim_frame++
            image_index = anim_frame
        } else {
            placed = true
            anim_frame = f_idle_start
            image_index = anim_frame
        }
    } else {
        if anim_frame < f_idle_end {
            anim_frame++
            image_index = anim_frame
        } else {
            anim_frame = f_idle_start
            image_index = anim_frame
        }
    }
}

if !spawn_init && !is_clone {
    spawn_init = true

    var _blocked_ids = ["lingrong_god", "cotton_candy", "soda_bubble", "wooden_plate"]

    if shape == 1 {
        var current_replace = global.replace_placement
        global.replace_placement = false

        var dirs = [-1, 1]
        for (var i = 0; i < 2; i++) {
            var dy = dirs[i] * global.grid_cell_size_y
            if can_place_at_position(x, y + dy, "coffee", "normal", "none") {
                var grid_pos = get_grid_position_from_world(x, y + dy)
                var _can_spawn = true
                var _plant_list = ds_grid_get(global.grid_plants, grid_pos.col, grid_pos.row)
                for (var _i = 0; _i < ds_list_size(_plant_list); _i++) {
                    var _plant = ds_list_find_value(_plant_list, _i)
                    if !instance_exists(_plant) continue
                    if variable_instance_exists(_plant, "plant_id") && array_get_index(_blocked_ids, _plant.plant_id) != -1 {
                        _can_spawn = false
                        break
                    }
                }
                if _can_spawn {
                    var clone = instance_create_depth(x, y + dy, depth + 5 * dirs[i], obj_lingrong_god)
                    clone.is_clone = true
                    clone.shape = 1
                    card_created(clone, grid_pos.col, grid_pos.row)
                }
            }
        }

        global.replace_placement = current_replace
    }

    if shape == 2 {
        var current_replace = global.replace_placement
        global.replace_placement = false

        var candidates = ds_priority_create()

        for (var r = 0; r < global.grid_rows; r++) {
            for (var c = 0; c < global.grid_cols; c++) {
                if r == grid_row && c == grid_col continue

                var check_x = global.grid_offset_x + (c * global.grid_cell_size_x) + (global.grid_cell_size_x / 2)
                var check_y = global.grid_offset_y + (r * global.grid_cell_size_y) + (global.grid_cell_size_y / 2)

                if can_place_at_position(check_x, check_y, "coffee", "normal", "none") {
                    var _can_spawn = true
                    var _plant_list = ds_grid_get(global.grid_plants, c, r)
                    for (var _i = 0; _i < ds_list_size(_plant_list); _i++) {
                        var _plant = ds_list_find_value(_plant_list, _i)
                        if !instance_exists(_plant) continue
                        if variable_instance_exists(_plant, "plant_id") && array_get_index(_blocked_ids, _plant.plant_id) != -1 {
                            _can_spawn = false
                            break
                        }
                    }
                    if _can_spawn {
                        var dist = abs(r - grid_row) + abs(c - grid_col)
                        if c == grid_col && abs(r - grid_row) <= 1 {
                            dist -= 0.5
                        }
                        ds_priority_add(candidates, [r, c], dist)
                    }
                }
            }
        }

        for (var i = 0; !ds_priority_empty(candidates) && i < 8; i++) {
            var best_cell = ds_priority_delete_min(candidates)
            var target_r = best_cell[0]
            var target_c = best_cell[1]
            var spawn_x = x + ((target_c - grid_col) * global.grid_cell_size_x)
            var spawn_y = y + ((target_r - grid_row) * global.grid_cell_size_y)
            var clone = instance_create_depth(spawn_x, spawn_y, depth, obj_lingrong_god)
            clone.is_clone = true
            clone.shape = 2
            clone.hp = hp
            clone.atk = atk
            card_created(clone, target_c, target_r)
        }

        ds_priority_destroy(candidates)
        global.replace_placement = current_replace
    }
}
