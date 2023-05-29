#clouds.gd
extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < 400:
		position.x += delta * 2
	else:
		position.x -= delta * 2
		
