extends EnemyState

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('jump')
	owner.velocity.x = 300 * owner.direction
	owner.velocity.y = -550
	
func inner_physics_process(_delta):
	if owner.is_on_floor():
		owner.velocity.x = 0
		owner.velocity.y = 0
		owner.direction = -owner.direction
		state_machine.change_to('Platform_idle')
	

