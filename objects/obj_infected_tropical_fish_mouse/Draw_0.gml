if (sprite_index == spr_infected_tropical_fish_mouse || sprite_index == spr_infected_tropical_fish_mouse_helmet)
{
    draw_sprite_ext(spr_in_water_2, floor(water_effect_timer / 5), x - 15, y - 38, 1.8, 1.8, 0, c_white, 1);
    water_effect_timer++;
}

event_inherited();
