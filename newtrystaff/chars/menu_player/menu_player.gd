#menu_player.gd

extends CharacterBody2D
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1
var repeat = false

signal go_to_start
func _ready():
	$AnimatedSprite2D.play()
	
func _physics_process(_delta):
	if repeat && position.x >= -30.5:
		go_to_start.emit()
		repeat = false
		
	if position.x < -300:
		$AnimatedSprite2D.flip_h = false
		direction = 1
		repeat = true
		
	velocity.x = direction * SPEED
		
	if position.x > 500:
		$AnimatedSprite2D.flip_h = true
		direction = -1
	move_and_slide()
