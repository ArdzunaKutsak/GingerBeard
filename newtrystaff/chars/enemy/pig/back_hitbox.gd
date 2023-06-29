#back_hitbox.gd

extends Area2D


func _on_area_entered(area):
	$"../../hru".play()
	var dir =  (owner.global_position.x - area.owner.global_position.x) / abs(owner.global_position.x - area.owner.global_position.x)
	#$"../../FSM".change_to('Hit')
	$CollisionShape2D.set_deferred("disabled", true)
	$"../../blood/Timer".start()
	owner.health -= 1
	#owner.sprite.play("hit")
	if owner.health <= 0:
		$"../../blood".queue_free()
		$"../AgroArea".queue_free()
		$"../Attack".queue_free()
		$"../../FSM".change_to('Death',{'vel':Vector2(dir*50,-100)})
	if owner.can_damage:
		$"../../FSM".change_to('Attack')
	else:
		$"../../FSM".change_to('Agro')
	$"../../HittingTimer".start(0.5)

func _on_hitting_timer_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
	$"../../blood/Timer".stop()
	$"../../blood".enabled = false
	

