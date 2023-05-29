extends Area2D


func _process(_delta):
	await $"../AnimatedSprite2D".animation_finished
	owner.queue_free()



