extends CharacterBody2D

const SPEED = 50.0
const JUMP_VELOCITY = -200.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 2
@onready var sprite = $AnimatedSprite2D
@onready var bomb = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")
@onready var player = $"../../Player"
func _process(delta):
	if not is_on_floor():
		velocity.y += delta * gravity
	move_and_slide()
