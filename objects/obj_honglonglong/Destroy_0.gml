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
ds_list_destroy(avaliable_pos)
instance_destroy(hpbar_inst)