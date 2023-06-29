extends Area2D

	
func _on_body_entered(body):
	body.get_node('FSM').change_to('Idle')
	if name == 'stop2':
		$"../platform_drop/CollisionShape2D".set_deferred("disabled", true)
		$CollisionShape2D.set_deferred("disabled", true)
		$"../stop2/CollisionShape2D".set_deferred("disabled", true)
		$"../platform_up/CollisionShape2D".set_deferred("disabled", true)
		$"../platform_up2/CollisionShape2D".set_deferred("disabled", true)
		
		$"../platform_up3/CollisionShape2D".set_deferred("disabled", false)
		
		return
	if name == 'stop3':
		$"../stop2/CollisionShape2D".set_deferred("disabled", false)
		$"../platform_up/CollisionShape2D".set_deferred("disabled", false)
		$"../platform_up2/CollisionShape2D".set_deferred("disabled", false)
		return
	else:
		get_child(0).set_deferred('disabled', true)
		$"../platform_up/CollisionShape2D".set_deferred("disabled", false)
		$"../platform_up2/CollisionShape2D".set_deferred("disabled", false)
	
