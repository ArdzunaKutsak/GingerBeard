#idle.gd
extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../Zones/Attack".monitoring = false
	$"../../Zones/Attack".set_deferred('monitorable', false)
	if player.is_on_floor():
		player.can_dubble_jump = true
	player.get_child(0).animation = 'idle'
	player.velocity = Vector2.ZERO

	
func inner_physics_process(delta):
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	'''#mobile
	if $"../../UI/action_buttons/attack_button".is_pressed() && player.can_attack:
		state_machine.change_to('Attack')
	if $"../../UI/action_buttons/jump_button".is_pressed():
		state_machine.change_to('Air', {do_jump=true})
	if $"../../UI/move_buttons/left_button".is_pressed():
		state_machine.change_to('Run')
		player.direction = -1
	if $"../../UI/move_buttons/right_button".is_pressed():
		state_machine.change_to('Run')
		player.direction = 1
	'''#mobile
	
	if Input.is_action_just_pressed("attack") && player.can_attack:
		state_machine.change_to('Attack')
		
	if not player.is_on_floor():
		state_machine.change_to('Air')
	
	if Input.is_action_just_pressed('ui_up'):
		state_machine.change_to('Air', {do_jump=true})
		
	if (Input.is_action_pressed('ui_left') or Input.is_action_pressed('ui_right')) and player.is_on_floor():
		state_machine.change_to('Run')
	
	

