#idle.gd
extends BaseState

@onready var pig_path = load("res://newtrystaff/chars/enemy/pig/pig.tscn")
@onready var pieces_path = load("res://newtrystaff/level_staff/box/box_pieces/pieces.tscn")
var pig
var pieces
func enter(_msg: Dictionary = {}):
	owner.velocity = Vector2(0,0)
	$"..".queue_free()
	pieces = pieces_path.instantiate()
	owner.owner.call_deferred('add_child',pieces)
	pieces.position = owner.position
	pieces.breack()
	pig = pig_path.instantiate()
	owner.owner.add_child(pig)
	pig.position = owner.position
	pig.out_of_box()
	$"../../Zones".queue_free()
	$"../../AnimatedSprite2D".queue_free()
	$"../../Timer2".queue_free()
	$"../../Timer3".queue_free()

	



	
