extends Area2D
	
func _on_area_entered(area):
	var x
	if owner.position.x > area.owner.position.x:
		x = 150
	else:
		x = -150
	$"../FSM".change_to('On', {velY=-450, velX=x, aim='enemy'}) 
	
	
	
