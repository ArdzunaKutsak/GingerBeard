#death.gd

extends StatePlayer


func enter(_msg: Dictionary={}):
	player.health -= 1
	player.sprite.play('death')
	await player.sprite.animation_finished
	player.visible = false
	var death_window = player.death_window.instantiate()
	$"../../UI/GUI".add_child(death_window)
	death_window.position.x = -53
	death_window.position.y = -64
	$"..".queue_free()
	$"../../Zones".queue_free()
	
	
	
func inner_physics_process(delta):
	player.velocity.y += delta * player.gravity
	player.velocity.x = 0
	player.move_and_slide()
	#player.move()



