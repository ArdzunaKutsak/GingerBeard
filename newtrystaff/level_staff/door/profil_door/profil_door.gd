extends Node2D

var opened

func open():
	opened = true
	$AnimatedSprite2D.play('open')
	$CollisionShape2D.set_deferred('disabled', true)
func close():
	opened = false
	$AnimatedSprite2D.play('idle')
	$CollisionShape2D.set_deferred('disabled', false)

func _ready():
	close()
		
