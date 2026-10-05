if global.is_paused{
    exit
}

if ice_timer > 0{
    ice_timer--
    is_slowdown = true
}
else{
    is_slowdown = false
}
if frozen_timer > 0{
    frozen_timer--
    is_frozen = true
}
else{
    is_frozen = false
}
if is_frozen{
    exit
}

var current_flash_speed = flash_speed
if is_slowdown{
    current_flash_speed *= 2
}

if timer < current_flash_speed - 1 {
    timer++;
} else {
    if anim_frame < idle_anim {
        anim_frame++;
        image_index = anim_frame;
    }
    else {
        if (!spawned) {
            spawned = true

            var fish_count = 4
            if (shape == 2) fish_count = 5
            if (shape == 3) fish_count = 7

            var fish_type = obj_save_god01_e
            if (shape == 2 || shape == 3) fish_type = obj_save_god23_e2

            var summon_col = 0
            for (var i = 0; i < fish_count; i++) {
                var target_row = i % global.grid_rows
                var world_pos = get_world_position_from_grid(summon_col, target_row)
                var inst = instance_create_depth(world_pos.x, world_pos.y, depth, fish_type)
                inst.grid_row = target_row
                inst.atk = atk
                inst.shape = shape
            }

            if (shape == 3) {
                var vertical_pos = get_world_position_from_grid(global.grid_cols - 1, 0)
                var vertical_fish = instance_create_depth(vertical_pos.x, vertical_pos.y, depth, obj_save_god23_e2)
                vertical_fish.sprite_index = spr_save_god_23_e2
                vertical_fish.is_vertical = true
                vertical_fish.grid_row = 0
                vertical_fish.atk = atk
                vertical_fish.shape = shape
            }
        }
        instance_destroy()
    }
    timer = 0;
}

if hp <= 0{
    instance_destroy()
}

if flash_value > 0{
    flash_value -= 10
}

var grid_pos = get_grid_position_from_world(x,y)
grid_col = grid_pos.col
grid_row = grid_pos.row
depth = calculate_plant_depth(grid_col, grid_row, plant_type)
if instance_exists(banding_star_obj){
    banding_star_obj.depth = depth - 1
}
