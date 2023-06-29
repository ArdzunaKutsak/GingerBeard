extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	get_child(0).play('idle')
func _physics_process(delta):
	if position.y > 600:
		queue_free()
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
