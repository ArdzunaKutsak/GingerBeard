extends Node2D

var health = 2
var no_collision_wall

func _ready():
	$brick.velocity.x = 200
	$brick.velocity.y = -200
	$brick2.velocity.x = 200
	$brick2.velocity.y = 200
	$brick3.velocity.x = 200
	$brick3.velocity.y = -200
	$brick4.velocity.x = 200
	$brick4.velocity.y = 200
	
func _on_hitbox_area_entered(_area):
	health -= 1
	if health > 0:
		$brick.hit()
		$brick2.hit()
		$wall/AnimatedSprite2D.play("first_hit")
	if health <= 0:
		$brick.hit()
		$brick2.hit()
		$brick3.hit()
		$brick4.hit()
		$wall/AnimatedSprite2D.play("last_hit")
		$hitbox.queue_free()
		$wall.collision_layer = 0
		no_collision_wall.modulate = Color(1,1,1,0.7)
		$"../LightOccluder2D".queue_free()
		queue_free()
		
