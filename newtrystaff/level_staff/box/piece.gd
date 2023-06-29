extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var velX = 0
var velY = 0

func _physics_process(delta):
	if visible:
		velocity.y += gravity * delta
	if velocity.y == 0:
		velocity.x = 0
	move_and_slide()
		
func breack():
	velocity.y = velY
	velocity.x = velX
	#$"../Timer".start(1)
	
func _on_timer_timeout():
	owner.queue_free()
