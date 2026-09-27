// Inherit the parent event
event_inherited();

mouse_id = "infected_pharaoh"
jump_times = 0
state = BOSS_STATE.APPEAR
hp = 35000
maxhp = 35000
immune_to_ash = true
wait_time = 3 * 60
cave = noone
sprite_index = spr_infected_pharaoh_appear
is_boss = true

target_coord = []
skill_1_disappear = false

hpbar_inst = instance_create_depth(450,1040,-900,obj_boss_hpbar)
hpbar_inst.target_boss = id
hpbar_inst.boss_id = mouse_id

if obj_battle.boss_count > 0{
	hpbar_inst.y -= 40
}

move_target_row = -1
y_move_speed = 0
skill_cycle = 0
