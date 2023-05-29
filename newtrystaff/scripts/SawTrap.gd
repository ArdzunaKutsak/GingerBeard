extends Area2D
@onready var body = get_child(0)
@onready var sprite = body.get_child(0)
@onready var Up = body.get_child(2)
@onready var collisionMask = get_child(1)
@onready var player = $"../../Player"

var move_up = true
func _ready():
	sprite.play()


func _process(_delta):
	collisionMask.position.y = body.position.y
	if move_up && Up.is_stopped():
		body.velocity.y = -80
		Up.start(1)
	if !move_up && Up.is_stopped():
		body.velocity.y = 80
		Up.start(1)
	
	body.move_and_slide()
func _on_up_timeout():
	move_up = !move_up

