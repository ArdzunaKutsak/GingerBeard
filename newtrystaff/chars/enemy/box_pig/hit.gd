#idle.gd
extends BaseState

@onready var pig_path = load("res://newtrystaff/chars/enemy/pig/pig.tscn")
var pig
func enter(_msg: Dictionary = {}):
	owner.velocity = Vector2(0,0)
	$"../../Pieces".breack()
	$"..".queue_free()
	pig = pig_path.instantiate()
	owner.owner.add_child(pig)
	pig.position = owner.position
	pig.out_of_box()
	$"../../Zones".queue_free()
	$"../../AnimatedSprite2D".queue_free()
	$"../../Timer2".queue_free()
	$"../../Timer3".queue_free()

	



	
