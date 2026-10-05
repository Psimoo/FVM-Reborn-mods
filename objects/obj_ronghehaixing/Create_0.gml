event_inherited();
plant_id = "ronghehaixing";
event_user(0);
if (shape == 0) sprite_index = spr_ronghehaixing;
else if (shape == 1) sprite_index = spr_ronghehaixing_1;
else sprite_index = spr_ronghehaixing_2;

attack_anim = 21;
idle_anim = 10;
flash_speed = 5;
plant_type = "normal";
is_slowdown = false;

if (shape >= 2) {
    attack_anim = 16;
}
