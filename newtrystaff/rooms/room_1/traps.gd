extends Node2D

var bomb = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")

var needles_y
var needles_ref = func():
	needles_switch()
var bomb_drop_ref = func():
	bomb_drop()
	
func needles_switch():
	if $long_needles.position.y == needles_y:
		$long_needles.position.y -= 8
	else:
		$long_needles.position.y += 8
func bomb_drop():
	var delta_x = 150
	for i in 4:
		var bomb_instance1 = bomb.instantiate()
		$platform_button3.call_deferred('add_child', bomb_instance1)
		bomb_instance1._ready()
		bomb_instance1.get_child(5)._ready()
		bomb_instance1.get_child(5).call_deferred('change_to', 'On', {velY = 0, velX = 0, aim = 'player'})
		bomb_instance1.set_position(Vector2(owner.position.x + delta_x, owner.position.y - 150))
		delta_x -= 75
		
		
	

func _ready():
	needles_y = $long_needles.position.y
	$platform_button.ref_func = needles_ref
	$platform_button2.ref_func = needles_ref
	$platform_button3.ref_func = bomb_drop_ref

