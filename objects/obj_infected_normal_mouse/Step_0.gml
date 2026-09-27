if (!arm_dropped && (hp / (maxhp - helmet_hp)) <= hurt_rate)
{
    var inst = instance_create_depth(x - 25, y - 95, depth - 1, obj_infected_arms_drop);
    arm_dropped = true;
}

event_inherited();
