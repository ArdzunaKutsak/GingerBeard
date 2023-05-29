extends Area2D

func _on_area_entered(area):
	print(area.monitoring, area.monitorable)
	$"../../FSM".change_to('Hit')
