var _spr = (shape == 0) ? spr_ronghehaixing_bullet : ((shape == 1) ? spr_ronghehaixing_bullet_1 : spr_ronghehaixing_bullet_2)

var inst = instance_create_depth(x-40,y-45,depth-500,obj_ronghehaixing_bullet)
inst.damage = atk
inst.move_speed = -8
inst.row = grid_row
inst.b_type = 1
inst.shape = shape
inst.sprite_index = _spr

var inst2 = instance_create_depth(x,y-45,depth-500,obj_ronghehaixing_bullet)
inst2.damage = atk
inst2.move_speed = 0
inst2.y_move_speed = 8
inst2.image_angle = 90
inst2.shape = shape
inst2.sprite_index = _spr

var inst3 = instance_create_depth(x,y-95,depth-500,obj_ronghehaixing_bullet)
inst3.damage = atk
inst3.move_speed = 0
inst3.y_move_speed = -8
inst3.image_angle = -90
inst3.shape = shape
inst3.sprite_index = _spr

var inst4 = instance_create_depth(x+40,y-45,depth-500,obj_ronghehaixing_bullet)
inst4.damage = atk
inst4.move_speed = 5
inst4.y_move_speed = -3
inst4.image_angle = -145
inst4.shape = shape
inst4.sprite_index = _spr

var inst5 = instance_create_depth(x+40,y-45,depth-500,obj_ronghehaixing_bullet)
inst5.damage = atk
inst5.move_speed = 5
inst5.y_move_speed = 3
inst5.image_angle = 145
inst5.shape = shape
inst5.sprite_index = _spr
