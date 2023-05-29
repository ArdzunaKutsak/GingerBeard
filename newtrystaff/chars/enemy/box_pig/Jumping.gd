extends BaseState

func enter(_msg: Dictionary= {}):
	$"../../Zones/agro_area/CollisionShape2D".set_deferred('disabled', true)
	sprite.play('jump')
	if _msg.has('do_attack_jump'):
		owner.velocity = Vector2(100 * math_direction(), -200)
		$"../../Timer2".start(1)
	if _msg.has('do_jump'):
		owner.velocity.y = -150
		flip_h()
		
	
func inner_physics_process(delta):
	if owner.is_on_floor():
		owner.velocity.x = 0
		state_machine.change_to('Idle')
		$"../../Timer2".start(1)
	owner.velocity.y += delta * owner.gravity
	owner.move_and_slide()
func exit():
	pass



