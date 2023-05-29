extends Node2D

var opened = false
func open():
	opened = true
func _process(_delta):
	if opened:
		$AnimatedSprite2D.play('open')
		$CollisionShape2D.disabled = true
