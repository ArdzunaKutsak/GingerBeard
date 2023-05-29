extends CharacterBody2D

var caller

func _physics_process(delta):
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.collision_layer == 16:
		caller.can_agro = true
		queue_free()

func _on_area_2d_body_entered(body):
	queue_free()
	#print(body)
	#if body.collision_layer == 1 || body.collision_layer == 4:
	#		queue_free()
