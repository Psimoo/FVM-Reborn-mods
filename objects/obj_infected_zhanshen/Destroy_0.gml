with obj_battle{
	if boss_count > 1{
		boss_count--
	}
	else{
		boss_count = 0
		if  current_wave == total_wave-1 {
				battle_finish_win();
		}
		else{
			level_stage = "pre"
			current_wave += 1
			current_subwave = 0
		}
	}
}
if instance_exists(up_inst){
	instance_destroy(up_inst)
}
if instance_exists(down_inst){
	instance_destroy(down_inst)
}
instance_destroy(hpbar_inst)
