extends StaticBody2D
var is_collide = false
var is_on_floor = false
var velY = 0
var pieces_path = load("res://newtrystaff/level_staff/box/box_pieces/pieces.tscn")
func call_pieces():
	var pieces = pieces_path.instantiate()
	#if owner != null:
		#owner.call_deferred('add_child', pieces)
	#else: 
	get_parent().call_deferred('add_child', pieces)
	pieces.position = position
	pieces.breack()
	queue_free()

func _process(delta):
	if !is_collide:
		is_collide = move_and_collide(Vector2(0, velY))
		velY += delta * 9.80
	else: 
		velY = 0
		is_on_floor = true


func _on_collide_check_body_exited(body):
	is_collide = false
