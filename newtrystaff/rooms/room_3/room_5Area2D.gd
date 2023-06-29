extends Area2D


func _on_area_entered(_area):
	$"../no_collision_bricks".modulate = Color(1,1,1,0.7)
