if global.is_paused{
	exit
}
timer++
if state == "start"{
	image_index = floor(timer/5) mod 4
	y -= 15
	if y <= -200{
		var target_pos = get_world_position_from_grid(target_col,target_row)
		x = target_pos.x 
		y = target_pos.y - room_height
		state = "drop"
	}
}
if state == "drop"{
	image_index = floor(timer/5) mod 4 + 4
	var target_pos = get_world_position_from_grid(target_col,target_row)
	y += 15
	if y >= target_pos.y{
		// 变异版：十字爆炸（落点 + 上下左右各一格）
		var _tcol = target_col
		var _trow = target_row
		with obj_card_parent{
			var _in_cross = false
			// 中心点
			if grid_col == _tcol && grid_row == _trow{
				_in_cross = true
			}
			// 上
			if grid_col == _tcol && grid_row == _trow - 1{
				_in_cross = true
			}
			// 下
			if grid_col == _tcol && grid_row == _trow + 1{
				_in_cross = true
			}
			// 左
			if grid_col == _tcol - 1 && grid_row == _trow{
				_in_cross = true
			}
			// 右
			if grid_col == _tcol + 1 && grid_row == _trow{
				_in_cross = true
			}
			if _in_cross && plant_id != "player"{
				if hp >= max_hp{
					obj_task_manager.card_loss++
				}
				instance_destroy()
			}
		}
		instance_create_depth(x,y,-200,obj_arno_bullet_effect)
		instance_destroy()
	}
}