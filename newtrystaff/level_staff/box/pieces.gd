#pieces.gd
extends Node2D
var x
var y



func breack():
	for child in get_children():
		match child.name:
			'1':
				child.velX = randf_range(-120, -100)
				child.velY = randf_range(-250, -200)
				child.breack()
			'2':
				child.velX = randf_range(-80, -30)
				child.velY = randf_range(-300, -250)
				child.breack()
			'3':
				child.velX = randf_range(100, 80)
				child.velY = randf_range(-300, -250)
				child.breack()
			'4':
				child.velX = randf_range(120, 100)
				child.velY = randf_range(-250, -200)
				child.breack()
			



