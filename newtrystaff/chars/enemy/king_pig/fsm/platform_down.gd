extends EnemyState

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('jump')
	owner.velocity.x = 200 * owner.direction
	owner.velocity.y = -200
	
func inner_physics_process(_delta):
	if owner.is_on_floor():
		owner.velocity.x = 0
		owner.velocity.y = 0
		$"../../zones/hitbox".collision_layer = 0
		$"../../zones/hitbox".collision_mask = 0
		state_machine.change_to('Run')
	
