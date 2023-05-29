extends EnemyStateEnemy

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('idle')
	$"../../HitArea".collision_mask = 64
	
func inner_physics_process(_delta):
	pass
	
	
	
