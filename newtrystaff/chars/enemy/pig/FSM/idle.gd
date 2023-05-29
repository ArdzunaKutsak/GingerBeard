#idle.gd

extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	enemy.get_child(0).play('idle')
	
func inner_physics_process(_delta):
	if enemy.health <= 0:
			state_machine.change_to('Death')
			return
	state_machine.change_to('Run')
