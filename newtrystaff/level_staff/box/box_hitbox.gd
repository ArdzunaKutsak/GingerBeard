extends Area2D

func _on_area_entered(_area):
	$"../LightOccluder2D".queue_free()
	owner.collision_layer = 0
	collision_mask = 0
	collision_layer = 0
	$"../AnimatedSprite2D".visible = false
	$"../Pieces".breack()
