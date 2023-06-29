extends Area2D
	
func _on_area_entered(area):
	var x
	if owner.global_position.x > area.owner.global_position.x:
		x = 150
	else:
		x = -150
	$"../FSM".change_to('On', {velY=-450, velX=x, aim='enemy'}) 
	
	
	
