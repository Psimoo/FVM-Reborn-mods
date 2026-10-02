event_inherited();
plant_id = "chunv";
current_level = 1;
obj_type = object_index;
event_user(0);

inner_inst = instance_create_depth(x, y - 18, depth + 2, obj_chunv_inner);
inner_inst.parent_plant = id;
inner_inst.sprite_index = spr_melon_virgo_inner_1;

sprite_list = [spr_melon_virgo_outer_1, spr_melon_virgo_outer_2, spr_melon_virgo_outer_3];

if (shape == 1)
{
    sprite_list = [spr_melon_virgo_1_outer_1, spr_melon_virgo_1_outer_2, spr_melon_virgo_1_outer_3];
    inner_inst.sprite_index = spr_melon_virgo_inner_2;
}

if (shape == 2)
{
    sprite_list = [spr_melon_virgo_2_outer_1, spr_melon_virgo_2_outer_2, spr_melon_virgo_2_outer_3];
    inner_inst.sprite_index = spr_melon_virgo_inner_3;
    inner_inst.y -= 5;
}

sprite_index = sprite_list[0];

idle_anim = 10;
flash_speed = 5;
plant_type = "shield_outer";
is_slowdown = false;
bleed_damage = 0;
current_hp = hp;
attack_timer = 0;
heal_wait = 60;
