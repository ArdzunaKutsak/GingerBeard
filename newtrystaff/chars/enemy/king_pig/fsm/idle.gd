extends EnemyState

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('idle')
	
func inner_physics_process(_delta):
	pass
