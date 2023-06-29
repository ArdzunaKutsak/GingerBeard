extends EnemyStateEnemy

func enter(msg: Dictionary={}):
	if owner.is_on_screen:
		$"../../on".play()
	$"../../HitArea".set_deferred('monitorable', false)
	$"../../HitArea".set_deferred('monitoring', false)
	
	$"../../TriggerArea".set_deferred('monitorable', true)
	$"../../TriggerArea".set_deferred('monitoring', true)
	if msg.aim == 'enemy':
		$"../../TriggerArea".collision_mask = 263
		$"../../BoomArea".collision_layer = 64
	if msg.aim == 'player':
		$"../../TriggerArea".collision_mask = 277
		$"../../BoomArea".collision_layer = 128
	owner.get_child(0).play('on')
	owner.velocity.y = msg.velY
	owner.velocity.x = msg.velX
	
func inner_physics_process(_delta):
	if owner.is_on_floor():
		owner.velocity.x = 0
	owner.move_and_slide()

func _on_trigger_area_area_entered(_area):
	state_machine.change_to('Boom')


func _on_trigger_area_body_entered(_body):
	state_machine.change_to('Boom')
