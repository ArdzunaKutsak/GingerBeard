extends BaseState


func enter(_msg: Dictionary={}):
	owner.velocity.x = 0
	sprite.play('idle')
	$"../../Timer".start(2.5)

func inner_physics_process(_delta):
	pass
	#if owner.velocity.x != 0:
		#owner.velocity.x -= 100
		
		
func _on_timer_timeout():
	if owner.health > 0:
		state_machine.change_to('Run')
