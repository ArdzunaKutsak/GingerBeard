extends Area2D
@onready var body = get_child(0)
@onready var sprite = body.get_child(0)
@onready var Up = body.get_child(2)
@onready var collisionMask = get_child(1)
@onready var player = $"../../Player"


var move_dir = 'top-down'
var move_vel = 80
var time = 1
var move_up = true
func _ready():
	sprite.play()


func _process(_delta):
	if move_dir == 'top-down':
		collisionMask.position.y = body.position.y
		if move_up && Up.is_stopped():
			body.velocity.y = -move_vel
			Up.start(time)
		if !move_up && Up.is_stopped():
			body.velocity.y = move_vel
			Up.start(time)
	else:
		collisionMask.position.x = body.position.x
		if move_up && Up.is_stopped():
			body.velocity.x = -move_vel
			Up.start(time)
		if !move_up && Up.is_stopped():
			body.velocity.x = move_vel
			Up.start(time)
	
	body.move_and_slide()
func _on_up_timeout():
	move_up = !move_up

