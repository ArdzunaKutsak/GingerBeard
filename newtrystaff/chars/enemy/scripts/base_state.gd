class_name BaseState
extends EnemyStateEnemy

var agro_area 
var sprite

func _ready():
	sprite = owner.get_child(0)
	

func math_direction():
	if owner.position.x < owner.aim.position.x:
		owner.direction = 1
		return 1
	else:
		owner.direction = -1
		return -1

func flip_h():
	owner.scale.x = -owner.scale.x
