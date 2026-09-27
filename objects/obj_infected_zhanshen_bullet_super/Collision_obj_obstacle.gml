if (target_type == "normal" && row == other.row && precise_bbox_collision(id, other))
{
    if (burnt == 0)
    {
        var inst = instance_create_depth(x, y, depth, obj_corn_shooter_effect);
        inst.sprite_index = spr_corn_shooter_bullet_effect;
    }
    else if (burnt == 1)
    {
        var inst = instance_create_depth(x + 25, y, depth, obj_fire_bullet_effect);
        inst.sprite_index = spr_fire_bullet_effect;
    }
    
    instance_destroy();
}
