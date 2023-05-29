extends StaticBody2D

var health = 3


func _on_area_2d_area_entered(_area):
	health -= 1
	if health == 2:
		$"3".visible = false
	if health == 1:
		$"2".visible = false
	if health == 0:
		queue_free()
	
