extends BaseState


func enter(_msg: Dictionary={}):
	sprite.play('idle')
		
func _on_timer_timeout():
	state_machine.change_to('Attack')
	#if owner.health > 0:
		#state_machine.change_to('Run')
