if !bounced{
	move_speed *= -1
	y_move_speed *= -1
	damage += other.atk
	image_angle += 180
	bounced = true
}
