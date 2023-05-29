extends EnemyStateEnemy

func enter(_msg: Dictionary={}):
	owner.health -= 1
	owner.sprite.play("hit")
	
func inner_physics_process(_delta):
	await owner.sprite.animation_finished
	if owner.health <= 0:
		state_machine.change_to('Death')
	else:
		state_machine.change_to('Picking')
