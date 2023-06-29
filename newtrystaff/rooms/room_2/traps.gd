extends Node2D

@onready var lift = $"../platforms/moving_platform"
@onready var needles_path = load("res://newtrystaff/level_staff/traps/slide_needles/slide_needles.tscn")

var press_count = 0

var slide_needles_on = func():
	needles_on()
	
var lift_up = func():
	up()

func up():
	lift.velocity.y = -50
	lift.collision_layer = 1

func needles_on():
	if press_count == 0:
		var needles = needles_path.instantiate()
		owner.call_deferred('add_child',needles)
		needles.position.x = $platform_button.position.x - 128
		needles.position.y = $platform_button.position.y - 32
		needles.velocity.x = 50
	if press_count == 1:
		var needles = needles_path.instantiate()
		owner.call_deferred('add_child',needles)
		needles.scale.x = -1
		needles.position.x = $platform_button.position.x + 128
		needles.position.y = $platform_button.position.y - 32
		needles.velocity.x = -50
	if press_count > 1:
		$"../Player".FSM.change_to("Air", {'do_big_jump': true})
	press_count += 1
func needles_off():
	$needles_stop/CollisionShape2D.disabled = true
	
func _ready():
	$lift_trigger.ref_func = lift_up
	$platform_button.ref_func = slide_needles_on
