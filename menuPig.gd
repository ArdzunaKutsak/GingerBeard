extends CharacterBody2D


const SPEED = 150.0
var direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var go = true
var start_position
func _ready():
	$"../MenuPlayer".go_to_start.connect(repeat)
	start_position = position.x
	$AnimatedSprite2D.play()
func _physics_process(_delta):
	if go:
		velocity.x = direction * SPEED
	if position.x < 0:
		go = false
		position.x = start_position
	
	move_and_slide()

func go_again( ):
	go = true

func repeat():
	position.x = start_position
