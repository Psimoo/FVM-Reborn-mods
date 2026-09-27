if (hp > (maxhp - helmet_hp))
    sprite_index = spr_infected_football_fan_mouse_helmet;
else
    sprite_index = spr_infected_football_fan_mouse;

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

if (hp <= (maxhp - helmet_hp) && !armor_dropped)
{
    var inst = instance_create_depth(x - 25, y - 175, depth - 1, obj_enemy_armor);
    inst.ground_y = y - 45;
    inst.type = "helmet";
    inst.x_speed = random_range(3, 5);
    inst.y_speed = random_range(-5, -8);
    inst.cgravity = 0.8;
    inst.sprite_index = spr_football_helmet;
    armor_dropped = true;
}

event_inherited();
