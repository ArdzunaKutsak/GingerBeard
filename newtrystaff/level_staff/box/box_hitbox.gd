extends Area2D

func _on_area_entered(_area):
	owner.call_pieces()
