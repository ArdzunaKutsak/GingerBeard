extends CharacterBody2D

@onready var player = $"../../Player"
@onready var camera = $"../../Player/Camera2D"

var down_speed = 0
var start_y 
var can_shake = false
func _ready():
	start_y = position.y
func shake_camera():
	camera.position.x += randi_range(-1,1)
	camera.position.y += randi_range(-1,1)
	
func _physics_process(_delta):
	if abs(abs(start_y)-abs(position.y)) <= 114:
		if start_y != position.x and can_shake:
			shake_camera()
		velocity.y = down_speed
		move_and_slide()
	if abs(abs(start_y)-abs(position.y)) >= 110:
		camera.position.x = 0
		camera.position.y = 0
