#run.gd
extends StatePlayer

func enter(_msg: Dictionary={}):
	for sound in $"../../sounds".get_children():
		sound.stop()
	$"../../sounds/run".play()
	if player.is_on_floor():
		player.can_dubble_jump = true
	player.sprite.play('run')
	print(player.position.x)
func inner_physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	player.move_and_slide()
	player.velocity.x = direction * player.SPEED
	if player.velocity.x == 0 and player.direction == 0:
		state_machine.change_to('Idle')
	''' #mobile
	if $"../../UI/move_buttons/left_button".is_pressed():
		player.direction = -1
	if $"../../UI/move_buttons/right_button".is_pressed():
		player.direction = 1
	if !$"../../UI/move_buttons/left_button".is_pressed() and !$"../../UI/move_buttons/right_button".is_pressed():
		#state_machine.change_to('Idle')
		#player.direction = 0
	if $"../../UI/action_buttons/attack_button".is_pressed() && player.can_attack:
		state_machine.change_to('Attack')
	if $"../../UI/action_buttons/jump_button".is_pressed():
		state_machine.change_to('Air', {do_jump=true})
	''' #mobile
	

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
	
	
	''' #mobile
	if player.direction == -1:
		player.sprite.flip_h = true
		player.sprite.position.x = -14
	if player.direction == 1:
		player.sprite.flip_h = false
		player.sprite.position.x = 0
	player.velocity.x = lerp(player.velocity.x, player.direction * player.SPEED, 0.2)
	if player.direction == 0:
		#player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED/10)
		player.velocity.x = 0
	''' #mobile

	

