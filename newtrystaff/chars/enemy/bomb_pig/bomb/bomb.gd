extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$BoomArea.set_deferred('monitorable', false)
	$BoomArea.set_deferred('monitoring', false)
	$TriggerArea.set_deferred('monitorable', false)
	$TriggerArea.set_deferred('monitoring', false)
func _physics_process(delta):
	if is_on_floor() and velocity.y == 0:
		velocity.x = 0
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
