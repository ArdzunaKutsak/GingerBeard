extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	#owner.transform.x = Vector2(-1, 0)
	owner.sprite.play('picking')
	
func inner_physics_process(_delta):
	if owner.sprite.frame == 3:
		#owner.transform.x = Vector2(1, 0)
		state_machine.change_to('Idle')



