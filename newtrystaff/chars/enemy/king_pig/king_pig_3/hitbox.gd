#back_hitbox.gd

extends Area2D


func _on_area_entered(_area):
	#var dir =  (owner.global_position.x - area.owner.global_position.x) / abs(owner.global_position.x - area.owner.global_position.x)
	$CollisionShape2D.set_deferred("disabled", true)
	$"../../blood/Timer".start()
	owner.health -= 1
	#owner.sprite.play("hit")
	#if owner.health <= 0:
		#$"../../blood".queue_free()
	if owner.health <= 0:
		owner.collision_layer = 0
		$"../../FSM".change_to('Death')
		for child in $"..".get_children():
			child.get_child(0).set_deferred('disabled', true)
		$CollisionShape2D.set_deferred("disabled", false)
		$"../../blood/Timer".stop()
		$"../../blood".enabled = false
		#$"../../Timer".queue_free()
	else:
		$"../../HittingTimer".start(0.5)

func _on_hitting_timer_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
	$"../../blood/Timer".stop()
	$"../../blood".enabled = false
	

