extends EnemyStateEnemy

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('idle')
	$"../../HitArea".collision_mask = 64
	#print($"../../HitArea".monitorable)
	#print($"../../HitArea".monitoring)
	#print($"../../TriggerArea".monitoring)
	#print($"../../TriggerArea".monitorable)
	
	
