#agroArea.gd

extends Area2D

func _on_area_exited(_area):
	owner.agro = false
	$"../../FSM".change_to('Run')


func _on_area_entered(area):
	var aim_position = 0
	for item in get_overlapping_areas():
		if item.owner.name == 'Player':
			aim_position = item.owner.position.x
	var max_position = max(owner.position.x, aim_position)
	var min_position = min(owner.position.x, aim_position)
	for item in get_overlapping_bodies():
		if item.position.x > min_position and item.position.x < max_position:
			return
	owner.aim = area.owner
	$"../../FSM".change_to('Agro')

