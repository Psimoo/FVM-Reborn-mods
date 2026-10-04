var inst = instance_create_depth(x+40,y-35,depth-500,obj_coffeecup_bullet)
audio_play_sound(snd_coffee_cup_attack,0,0)
inst.damage = atk
inst.move_speed = 8
inst.shape = shape
inst.row = grid_row
inst.start_col = grid_col