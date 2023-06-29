extends Node2D

var open_profil_door = func():
	open()
	
func open():
	$"../doors/profil_door".open()
# Called when the node enters the scene tree for the first time.
func _ready():
	$saw_trap.move_dir = 'left-right'
	$saw_trap.time = 4
	$saw_trap.move_vel = -80
	$saw_trap2.move_dir = 'left-right'
	$saw_trap2.time = 4
	$saw_trap2.move_vel = -80
	$saw_trap3.move_dir = 'left-right'
	$saw_trap3.time = 4
	$saw_trap3.move_vel = -80
	
	$trigger.ref_func = open_profil_door
