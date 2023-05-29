extends Area2D

func _on_area_entered(_area):
	$"../../FSM".change_to('Agro')
	queue_free()
