event_inherited();
mouse_id = "infected_arno";
jump_times = 0;
state = UnknownEnum.Value_0;
hp = 18000;
maxhp = 18000;
immune_to_ash = true;
wait_time = 59;
sprite_index = spr_infected_arno_appear;
is_boss = true;
hpbar_inst = instance_create_depth(450, 1040, -900, obj_boss_hpbar);
hpbar_inst.target_boss = id;
hpbar_inst.boss_id = mouse_id;

if (obj_battle.boss_count > 0)
    hpbar_inst.y -= 40;
