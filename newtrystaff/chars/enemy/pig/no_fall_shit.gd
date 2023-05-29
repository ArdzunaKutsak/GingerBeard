extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * gravity
		owner.direction = -owner.direction
	move_and_slide()
