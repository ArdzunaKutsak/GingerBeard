extends StatePlayer

func enter(msg: Dictionary={}):
	#for sound in $"../../sounds".get_children():
		#sound.stop()
	player.sprite.play('jump')
	if msg.has('do_jump'):
		$"../../sounds/jump".play()
		
		player.velocity.y = player.JUMP_VELOCITY
		player.collision_mask = 1
		player.velocity.x = player.velocity.x
	if msg.has('do_big_jump'):
		$"../../sounds/jump".play()
		
		player.velocity.y = -500
		player.collision_mask = 1
		player.velocity.x = player.velocity.x
	
func inner_physics_process(delta):
	'''#mobile
	if $"../../UI/move_buttons/left_button".is_pressed():
		player.direction = -1
	if $"../../UI/move_buttons/right_button".is_pressed():
		player.direction = 1
	if !$"../../UI/move_buttons/left_button".is_pressed() and !$"../../UI/move_buttons/right_button".is_pressed():
		player.direction = 0
	if !$"../../sounds/jump".playing and $"../../UI/action_buttons/jump_button".is_pressed() && player.can_dubble_jump:
		player.velocity.y = player.JUMP_VELOCITY
		player.collision_mask = 1
		player.can_dubble_jump = false
	if $"../../UI/action_buttons/attack_button".is_pressed() && player.can_attack:
		state_machine.change_to('Attack')
	'''#mobile
	if player.velocity.y >= 0:
		player.collision_mask = 257
	player.velocity.y += player.gravity * delta
	#PC
	if Input.is_action_just_pressed('ui_up') && player.can_dubble_jump:
	#if $"../../UI/action_buttons/jump_button".pressed && player.can_dubble_jump:
		player.velocity.y = player.JUMP_VELOCITY
		player.collision_mask = 1
		player.can_dubble_jump = false
		$"../../sounds/jump".play()
		
	
	if Input.is_action_just_pressed("attack")  && player.can_attack:
		state_machine.change_to('Attack')
	
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed('ui_left') || Input.is_action_pressed('ui_right'):
		if direction == -1:
			player.sprite.flip_h = true
			player.sprite.position.x = -14
		if direction == 1:
			player.sprite.flip_h = false
			player.sprite.position.x = 0
		player.velocity.x = direction * player.SPEED
		
	if direction == 0:
		player.velocity.x = 0
	#PC
	'''#mobile
	if player.direction == -1:
		player.sprite.flip_h = true
		player.sprite.position.x = -14
	if player.direction == 1:
		player.sprite.flip_h = false
		player.sprite.position.x = 0
	
	player.velocity.x = player.direction * player.SPEED
	'''#mobile
	player.move_and_slide()
	if player.is_on_floor():
		if player.velocity.x == 0 and player.sprite.animation != 'attack':
			state_machine.change_to('Idle')
		else:
			if player.sprite.animation != 'attack':
				state_machine.change_to('Run', owner.velocity_dict)
