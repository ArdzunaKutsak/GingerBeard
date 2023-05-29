extends Node2D
@onready var lift = $"../../platforms/lift"

var lift_up = func():
	up()
var lift_down = func():
	down()
var lift_stop = func():
	stop()
	
func up():
	lift.velocity.y = -50
func down():
	lift.velocity.y = 50

func stop():
	lift.velocity.y = 0
	
func _ready():
	$lift_up.ref_func = lift_up
	$lift_down.ref_func = lift_down
	$lift_up.exit_func = lift_stop
	$lift_down.exit_func = lift_stop
