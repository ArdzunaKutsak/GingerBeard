#hitBox.gd

extends Area2D

func hit():
	$CollisionShape2D.set_deferred("disabled", true)
	$"../../BloodTimer".start()
	$"../../blood/Timer".start()
	$"../../blood".enabled = true
	
	$"../../ProgressBar".visible = false
	$"../../ProgressBar".play('full')
	owner.can_attack = true
	owner.health -= 1
	owner.emit_signal('health_count')
	#for sound in $"../../sounds".get_children():
	#	sound.stop()
	match owner.health:
		2:
			$"../../sounds/hit".play()
		1:
			$"../../sounds/hit2".play()
		0:
			$"../../sounds/hit4".play()
			$"../../Zones/HitBox".queue_free()
	if owner.health < 1:
		$"../../FSM".change_to('Death')
	

func _on_area_entered(area):
	if not area.owner.name == 'Bomb':
		$"../../sounds/player_hurt".play()
	hit()



func _on_blood_timer_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
	$"../../blood/Timer".stop()
	$"../../blood".enabled = false
