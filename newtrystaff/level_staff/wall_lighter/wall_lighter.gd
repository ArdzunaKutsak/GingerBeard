extends Node2D

@onready var sprite = $AnimatedSprite2D
var animation = 'idle'

func _ready():
	sprite.play(animation)
func _process(_delta):
	if sprite.animation == 'off':
		$PointLight2D.enabled = false
	if sprite.animation == 'idle':
		$PointLight2D.enabled = true
	if sprite.frame < 2:
		$PointLight2D.position.x = 1
		return
	if sprite.frame < 4:
		$PointLight2D.position.x = 0
		return
	if sprite.frame < 6:
		$PointLight2D.position.x = -1
		return
	if sprite.frame > 5:
		$PointLight2D.position.x = 0
