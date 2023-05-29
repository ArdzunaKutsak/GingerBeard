extends EnemyState

var count 
var jump_ready
func enter(_msg: Dictionary={}):
	jump_ready = false
	$"../../zones/jumpbox".set_deferred('monitoring', false)
	$"../../zones/jumpbox".set_deferred('monitorable', false)
	owner.get_child(0).play('run')
	count = 0
	
func inner_physics_process(_delta):
	if owner.is_on_wall():
			count += 1
			owner.direction = -owner.direction
	if !jump_ready:
		owner.velocity.x = 400 * owner.direction
	if count >= 2:
		$"../../zones/jumpbox".set_deferred('monitoring', true)
		$"../../zones/jumpbox".set_deferred('monitorable', true)
	


func _on_jumpbox_area_entered(_area):
	jump_ready = true
	state_machine.change_to('Platform_up')
