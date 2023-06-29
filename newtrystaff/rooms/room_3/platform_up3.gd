extends Area2D

var current_func

var action = func(area):
	area.velocity.y = -800
	
'''
var up = func(area):
	area.owner.velocity.y = -400
'''
func _ready():
	current_func = action
	$CollisionShape2D.set_deferred("disabled", true)

func _on_body_entered(body):
	current_func.call(body)

