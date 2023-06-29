extends Node2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play('idle')
	player = $"../../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.global_position.x - global_position.x > 0:
		scale = Vector2(1,1)
		rotation = 0
	else:
		scale.x = -1
	pass
