extends Node2D
var bomb = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")

var bomb_drop_ref = func():
	bomb_drop()
	
func bomb_drop():
	var bomb_instance1 = bomb.instantiate()
	$platform_button.add_child(bomb_instance1)
	bomb_instance1.set_position(Vector2(owner.position.x, owner.position.y -100))
	bomb_instance1.get_node('FSM').change_to('On', {velY = 0, velX = 0, aim = 'player'})
	
func _ready():
	$platform_button.ref_func = bomb_drop_ref
