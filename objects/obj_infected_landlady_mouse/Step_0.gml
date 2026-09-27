if (shield_hp > 0)
{
    sprite_index = spr_infected_landlady_mouse_shield;
    death_anim = 16;
}
else
{
    sprite_index = spr_infected_landlady_mouse;
    death_anim = 17;
}

if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

if (shield_hp <= 0 && !armor_dropped)
{
    var inst = instance_create_depth(x - 45, y - 75, depth - 1, obj_enemy_armor);
    inst.ground_y = y - 30;
    inst.type = "shield";
    inst.x_speed = random_range(-3, -5);
    inst.y_speed = random_range(-1, -3);
    inst.cgravity = 0.8;
    inst.sprite_index = spr_landlady_shield;
    armor_dropped = true;
}

event_inherited();
