if (global.is_paused)
    exit;

var grid_pos = get_grid_position_from_world(x, y);

if (global.grid_terrains[grid_pos.row][grid_pos.col].type == "water")
    sprite_index = spr_mario_cave_water;
else if (global.grid_terrains[grid_pos.row][grid_pos.col].type == "normal")
    sprite_index = spr_mario_cave_land;

if (global.grid_terrains[grid_pos.row][grid_pos.col].type != "obstacle")
{
    current_grid_type = global.grid_terrains[grid_pos.row][grid_pos.col].type;
    global.grid_terrains[grid_pos.row][grid_pos.col].type = "obstacle";
}

timer++;

if (image_index < (image_number - 1))
    image_index = floor(timer / 5);
else
    image_index = image_number - 1;

if (timer >= 3600)
    instance_destroy();

var base_depth = -10 - (grid_pos.row * 45) - (grid_pos.col * 5);
depth = base_depth - 4.5;
