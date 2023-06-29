extends AnimatedSprite2D

var player
# Called when the node enters the scene tree for the first time.
func _ready():
	offset.x = 7
	player = $"../../Player"
	play()

func _process(delta):
	if player.global_position.x - global_position.x > 0:
		scale = Vector2(1,1)
		rotation = 0
	else:
		scale.x = -1
	pass
