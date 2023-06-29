extends AnimatableBody2D

var velocity = Vector2(500,0)
var sprite
func _ready():
	sprite = get_child(0)
	sprite.play('idle')
	sync_to_physics = false
	
func _process(delta):
	if sprite.animation == 'idle':
		var collision = move_and_collide(velocity*delta)
		if collision:
			velocity = Vector2(0,0)
			sprite.play('boom')
	if sprite.animation == 'boom':
		await sprite.animation_finished
		queue_free()


func _on_area_2d_area_entered(_area):
	sprite.play('boom')
	velocity = Vector2(0,0)
