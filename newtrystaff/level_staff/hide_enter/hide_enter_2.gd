extends Node2D

var health = 2

func _ready():
	z_index = 0

func _on_hitbox_area_entered(_area):
	health -= 1
	if health > 0:
		$brick.hit()
		$brick2.hit()
		$wall/AnimatedSprite2D.play("first_hit")
	if health <= 0:
		z_index = 20
		$brick.hit()
		$brick2.hit()
		$brick3.hit()
		$brick4.hit()
		$wall/AnimatedSprite2D.play("last_hit")
		modulate = Color(1,1,1,0.7)
		$hitbox.queue_free()
		$wall.collision_layer = 0
		$"../no_collision_bricks".modulate = Color(1,1,1,0.7)
		$"../LightOccluder2D".queue_free()
