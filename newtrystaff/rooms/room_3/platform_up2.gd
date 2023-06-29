extends Area2D

var current_func

var down = func(area):
	$Timer.start(1)
	#area.velocity.x = 0
	area.get_node('FSM').change_to('Idle')
	
	await $Timer.timeout
	if area.health > 0:
		area.velocity.y = -540
		area.get_node('FSM').change_to('Run')
'''
var up = func(area):
	area.owner.velocity.y = -400
'''
func _ready():
	current_func = down



func _on_body_entered(body):
	current_func.call(body)
