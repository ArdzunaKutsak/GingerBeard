extends Node2D
@onready var wall = $slide_wall
func _ready():
	$trigger.ref_func = func(): 
		wall.down_speed = 50
		wall.can_shake = true
