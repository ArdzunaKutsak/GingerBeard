extends BaseState


func enter(_msg: Dictionary={}):
	sprite.play('jump')
	owner.velocity.y = owner.JUMP_VELOCITY
	owner.collision_mask = 1

func inner_physics_process(delta):
	if not owner.is_on_floor():
		owner.velocity.y += delta * owner.gravity
	if owner.velocity.y > 0:
		owner.collision_mask = 257
	if owner.is_on_floor():
		state_machine.change_to('Idle')
		$"../../Timer".start(1.5)
