#idle.gd
extends BaseState

func enter(_msg: Dictionary = {}):
	sprite.play('idle')
	pass

func inner_physics_process(delta):
	if not owner.is_on_floor():
		owner.velocity.y += owner.gravity * delta
