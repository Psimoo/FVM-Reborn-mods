event_inherited();
plant_id = "heian_god";
obj_type = object_index;
current_level = 1;
event_user(0);

if (shape == 0)
    sprite_index = spr_heian_god;
else if (shape == 1)
    sprite_index = spr_heian_god_1;
else if (shape == 2)
    sprite_index = spr_heian_god_2;
else if (shape == 3)
    sprite_index = spr_heian_god_3;

idle_anim = 10;
attack_anim = 20;
flash_speed = 5;
plant_type = "coffee";
is_slowdown = false;
current_hp = hp;
image_speed = 0;

attack_interval = 48;
if (shape >= 1)
    attack_interval = 30;

attack_timer = 0;
has_fired = false;
state = CARD_STATE.IDLE;

range_x = 200;
range_y = 200;
if (shape >= 2)
    range_y = 300;

if (skill == 0)
    lifetime = 900;
else if (skill == 6)
    lifetime = 1440;
else if (skill == 8)
    lifetime = 1860;
else
    lifetime = 900;
lifetime_timer = lifetime;

freeze_chance = 15;
freeze_duration = 180;

hit_map = ds_map_create();

var eff_spr = spr_heian_god_effect;
if (shape >= 1)
    eff_spr = spr_heian_god_effect_1;

heian_effect_obj = instance_create_depth(x, y - 30, 0, obj_heian_god_effect);
heian_effect_obj.sprite_index = eff_spr;
heian_effect_obj.image_xscale = 1.8;
heian_effect_obj.image_yscale = 1.8;
heian_effect_obj.is_one_shot = false;

image_alpha = 1;
