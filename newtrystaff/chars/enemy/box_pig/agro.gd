extends BaseState

func enter(_msg: Dictionary= {}):
	sprite.play('idle')
	$"../../Zones/agro_area/CollisionShape2D".set_deferred('disabled', false)
	$"../../Timer3".start(1)
	
func _on_timer_3_timeout():

	if owner.is_on_floor():
		state_machine.change_to('Air', {'do_jump':true})
