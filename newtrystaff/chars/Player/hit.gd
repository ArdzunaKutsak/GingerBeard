#hit.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	$"../../ProgressBar".visible = false
	$"../../ProgressBar".play('full')
	owner.can_attack = true
	player.health -= 1
	player.emit_signal('health_count')
	player.sprite.play("hit")
	for sound in $"../../sounds".get_children():
		sound.stop()
	match player.health:
		2:
			$"../../sounds/hit".play()
		1:
			$"../../sounds/hit2".play()
		0:
			$"../../sounds/hit4".play()
	await $"../../HittingTimer".timeout
	if player.health < 1:
		state_machine.change_to('Death')
	else:
		if player.previous_state.name != 'Hit' and player.previous_state.name != 'Attack':
			state_machine.change_to(player.previous_state.name, player.velocity_dict)
		else:
			state_machine.change_to('Idle')
	
	
	
