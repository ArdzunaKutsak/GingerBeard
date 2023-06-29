#run.gd
extends StatePlayer

var sound_played = false

func enter(_msg: Dictionary={}):
	
	if player.is_on_floor():
		player.can_dubble_jump = true
	player.sprite.play('run')
func inner_physics_process(_delta):
	sound_step()
		
	var direction = Input.get_axis("ui_left", "ui_right")
	
	player.velocity.x = direction * player.SPEED
	if player.velocity.x == 0 and player.direction == 0:
		state_machine.change_to('Idle')
	
	'''#mobile
	if $"../../UI/move_buttons/left_button".is_pressed():
		player.direction = -1
	if $"../../UI/move_buttons/right_button".is_pressed():
		player.direction = 1
	if !$"../../UI/move_buttons/left_button".is_pressed() and !$"../../UI/move_buttons/right_button".is_pressed():
		state_machine.change_to('Idle')
		player.direction = 0
	if $"../../UI/action_buttons/attack_button".is_pressed() && player.can_attack:
		state_machine.change_to('Attack')
	if $"../../UI/action_buttons/jump_button".is_pressed():
		state_machine.change_to('Air', {do_jump=true})
	if not player.is_on_floor():
		state_machine.change_to('Air')
	'''#mobile
	
	#PC
	if Input.is_action_just_pressed("attack")  && player.can_attack:
		state_machine.change_to('Attack')
	if not player.is_on_floor():
		state_machine.change_to('Air')
	
	if Input.is_action_just_pressed('ui_up'):
		state_machine.change_to('Air', {do_jump=true})

	
	#if owner.direction:
	if direction == -1:
		player.sprite.flip_h = true
		player.sprite.position.x = -14
	if direction == 1:
		player.sprite.flip_h = false
		player.sprite.position.x = 0
	if direction == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED/10)
	#player.velocity.x = lerp(player.velocity.x, direction * player.SPEED, 0.2)
	
	
	'''#mobile
	if player.direction == -1:
		player.sprite.flip_h = true
		player.sprite.position.x = -14
	if player.direction == 1:
		player.sprite.flip_h = false
		player.sprite.position.x = 0
	player.velocity.x = player.SPEED * player.direction
	if player.direction == 0:
		#player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED/10)
		player.velocity.x = 0
	'''#mobile
	player.move_and_slide()
	
func sound_step():
	if not sound_played:
		if player.sprite.frame == 0:
			sound_played = true
			$"../../sounds".get_child(2).volume_db = - 10
			$"../../sounds".get_child(2).play()
		if player.sprite.frame == 5:
			sound_played = true
			$"../../sounds".get_child(0).volume_db = - 10
			$"../../sounds".get_child(0).play()
	if  player.sprite.frame != 0 and player.sprite.frame != 5:
		sound_played = false
	
