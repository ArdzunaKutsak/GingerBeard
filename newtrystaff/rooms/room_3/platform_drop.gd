extends Area2D

var current_func

var down = func(area):
	area.velocity.y = -200
'''
var up = func(area):
	area.owner.velocity.y = -400
'''
func _ready():
	current_func = down

func _on_body_entered(body):
		current_func.call(body)
