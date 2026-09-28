// 切换状态
if room != room_battle{
	if config_key == "difficulty"{
		if b_type == "next"{
			if state < 5{
				state ++
			}
			else{
				state = 0
			}
		}
		else{
			if state > 0{
				state --
			}
			else{
				state = 5
			}
		}
	}
	audio_play_sound(snd_button,0,0)
	// 保存到配置文件
	if (config_key != "") {
	    ini_open("config.ini");
	    ini_write_real("settings", config_key, state);
	    ini_close();
	}

	if (config_key == "difficulty"){
		global.difficulty = state
		// 切换到不朽难度时，新存档发放原有难度奖励。
		if (state == 5) && !variable_struct_exists(global.save_data, "immortal_bonus_given"){
			if array_length(global.save_data.completed_levels) == 0{
				global.save_data.player.gold += 200000
				show_notice("不朽难度奖励：+200,000 金币", 60)
			}
			global.save_data.immortal_bonus_given = true
			save_file(global.save_slot)
		}
	}
}
else{
	audio_play_sound(snd_button,0,0)
	show_notice("无法在游戏中修改难度",60)
}
