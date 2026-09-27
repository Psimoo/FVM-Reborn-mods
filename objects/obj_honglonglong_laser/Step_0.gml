if global.is_paused{
	exit
}
if timer == 0{
	image_angle = laser_angle
}
timer++
if timer <= 6*3-1{
	image_index = floor(timer/3) mod 6
}
else{
	image_alpha-=0.1
	if image_alpha <=0{
		instance_destroy()
	}
}