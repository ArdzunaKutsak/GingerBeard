class_name Boss
extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -650.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = -1
var health = 3
@onready var aim = $"../../Player" 

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * gravity
	move_and_slide()
