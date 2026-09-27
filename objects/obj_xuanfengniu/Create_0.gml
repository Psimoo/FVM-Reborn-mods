event_inherited();
plant_id = "xuanfengniu";
obj_type = object_index;
event_user(0);

sprite_index = spr_xuanfengniu;
if (shape == 1)
    sprite_index = spr_xuanfengniu_1;
else if (shape == 2)
    sprite_index = spr_xuanfengniu_2;

attack_anim = 0;
idle_anim = sprite_get_number(sprite_index);
flash_speed = 5;

// 二转不占格：使用 plant_type = "gridless" 与全局机制对齐
if (shape >= 2) {
    plant_type = "gridless";
} else {
    plant_type = "normal";
}
target_type = "normal";
is_slowdown = false;
invincible = true;

// 一转及以上支持清障
can_clear_obstacles = (shape >= 1);

// 对特殊飞行老鼠造成的伤害（不再秒杀）
damage = 500;

// 起手延迟后触发一次全屏吹走
activate_delay = 4 * flash_speed;
state_timer = 0;
has_activated = false;
is_activating = false;

// 可吹走的空中老鼠白名单（真实 mouse_id）
// 包含常见飞行类老鼠，排除 Boss 与特殊免疫目标
// 注意：以下强力飞行鼠已改为造成伤害而非吹走，不在此白名单中：
//   aircraft_carrier, kamikaze_glider_mouse, machine_bee,
//   machine_flag_mouse, machine_bomb_mouse, airbrone_explosive_mouse, flight_barrier_mouse
air_mouse_whitelist = [
    "bat_mouse",
    "glider_mouse",
    "waste_flying_mouse",
    "paratrooper_mouse",
    "little_armour_mouse",
    "windmill_fish_mouse",
    "captain_rainbow",
    "eel_mouse",
    "spider_man_mouse"
];
