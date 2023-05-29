extends EnemyState

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('hit')
	owner.health -= 1
	
func inner_physics_process(_delta):
	await owner.get_child(0).animation_finished
	if owner.health > 0:
		state_machine.change_to('Platform_down')
	if owner.health <= 0:
		state_machine.change_to('Death')
