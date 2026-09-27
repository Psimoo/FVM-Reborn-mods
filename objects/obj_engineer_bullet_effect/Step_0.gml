if global.is_paused{
	image_speed = 0
}
else{
	image_speed = 1
}

// Control frame range for infected_bingzha bullet effect
if sprite_index == spr_infected_bingzha_bullet_effect{
	if is_final_bullet{
		// Final bullet: play frames 4-13, then destroy
		if image_index >= sprite_get_number(sprite_index) - 1{
			instance_destroy()
		}
	}
	else{
		// Normal bullets: play frames 0-3 only, then destroy
		if image_index >= 3{
			instance_destroy()
		}
	}
}