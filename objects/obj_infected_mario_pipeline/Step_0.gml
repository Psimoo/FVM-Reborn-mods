if (global.is_paused)
    exit;

if (!enemy_registered || enemy_registered_type != target_type) {
    if (enemy_registered) {
        var _old_list = global.enemy_by_type[$ enemy_registered_type];
        var _old_idx = array_get_index(_old_list, id);
        if (_old_idx != -1) array_delete(_old_list, _old_idx, 1);
    }
    if (!variable_global_exists("enemy_by_type")) {
        global.enemy_by_type = {};
    }
    var _reg_key = target_type;
    if (!variable_struct_exists(global.enemy_by_type, _reg_key)) {
        global.enemy_by_type[$ _reg_key] = [];
    }
    array_push(global.enemy_by_type[$ _reg_key], id);
    enemy_registered = true;
    enemy_registered_type = target_type;
}

var grid_pos = get_grid_position_from_world(x, y);

if (global.grid_terrains[grid_pos.row][grid_pos.col].type == "water")
    sprite_index = spr_infected_mario_pipeline_water;
else if (global.grid_terrains[grid_pos.row][grid_pos.col].type == "normal")
    sprite_index = spr_infected_mario_pipeline_land;

if (global.grid_terrains[grid_pos.row][grid_pos.col].type != "obstacle")
{
    current_grid_type = global.grid_terrains[grid_pos.row][grid_pos.col].type;
    global.grid_terrains[grid_pos.row][grid_pos.col].type = "obstacle";
}

if (flash_value > 0)
    flash_value -= 10;

timer++;

if (state == "appear")
{
    image_index = floor(timer / 5);
    
    if (timer >= 30)
    {
        timer = 0;
        state = "anim_wait";
    }
}
else if (state == "anim_wait")
{
    if (timer >= anim_wait)
    {
        timer = 0;
        state = "anim";
    }
}
else if (state == "anim")
{
    if (main_pipe)
        image_index = floor(timer / 5) + 5;
    else if (hp > (hurt_rate * maxhp))
        image_index = 16;
    else
        image_index = 17;
    
    if (timer >= 50)
    {
        timer = 0;
        state = "idle";
    }
}
else if (state == "idle")
{
    if (hp > (hurt_rate * maxhp))
        image_index = 16;
    else
        image_index = 17;
}

if (hp <= 0)
    image_alpha -= 0.1;

if (image_alpha <= 0 && hp <= 0)
    instance_destroy();

var zombie_grid = get_grid_position_from_world(x, y);
var base_depth = -10 - (zombie_grid.row * 45) - (zombie_grid.col * 5);
depth = base_depth - 4.5;
grid_col = zombie_grid.col;
grid_row = zombie_grid.row;
