extends CharacterBody2D
var delta_rotation = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	visible = false

func _physics_process(delta):
	if delta_rotation > 0:
		if not is_on_floor():
			velocity.y += gravity * delta
		rotation += delta_rotation
		move_and_slide()
		if is_on_floor():
			delta_rotation = 0
			visible = false
			position = Vector2(0,0)
			if owner.health <= 0:
				queue_free()

func hit():
	delta_rotation = 0.33
	visible = true
	velocity.x = randi_range(100,300)
	velocity.y = randi_range(-200,100)

