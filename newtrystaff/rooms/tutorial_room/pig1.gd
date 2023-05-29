extends CharacterBody2D

@onready var sprite = get_child(0)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 150
var walk = false


func _ready():
	visible = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta*gravity
	if walk:
		sprite.play('run')
		velocity.x = SPEED
	if !walk:
		sprite.play('idle')
		velocity.x = 0
	move_and_slide()
