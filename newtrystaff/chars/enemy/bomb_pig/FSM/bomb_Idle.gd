extends EnemyStateEnemy

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('idle')
	pass
	
func inner_physics_process(_delta):
	if owner.sprite.frame == 9:
		state_machine.change_to('Attack')
