# EnemyFSM.gd
class_name EnemyStateMachine
extends Node

@export var start_state: NodePath
@onready var state: EnemyState = get_node(start_state)

func _ready():
	for child in get_children():
		child.state_machine = self
	state.enter()

func _unhandled_input(event):
	state.inner_unhandled_input(event)
func _process(delta):
	state.inner_process(delta)
func _physics_process(delta):
	state.inner_physics_process(delta)
func change_to(target_state: String, _msg: Dictionary={}):
	if not has_node(target_state):
		return
	state.exit()
	if owner.name.contains('pig'): 
		if owner.health > -1:
			state = get_node(target_state)
			state.enter(_msg)
	else:
		state = get_node(target_state)
		state.enter(_msg)
