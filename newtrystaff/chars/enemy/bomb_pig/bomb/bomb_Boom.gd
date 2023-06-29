extends EnemyStateEnemy

func enter(_msg: Dictionary={}):
	if owner.is_on_screen:
		$"../../on".stop()
		$"../../boom".play()
	owner.get_child(0).play('boom')
	$"../../BoomArea".set_deferred('monitorable', true)
	$"../../BoomArea".set_deferred('monitoring', true)
	#$"../../PointLight2D".enabled = true
func inner_physics_process(_delta):
	owner.velocity = Vector2(0,0)
	#if owner.get_child(0).frame_changed:
		#if $"../../PointLight2D".energy >= 0.35:
		#	$"../../PointLight2D".energy -= 0.35
		
	await owner.get_child(0).animation_finished
	owner.queue_free()
	
