#BM.gd

class_name ButtonsMachine
extends Node
'''
func change_state(current_pressed_button):
	match current_pressed_button:
		'left':
			$"../FSM".change_to('Run', owner.velocity_dict)
		'right':
			$"../FSM".change_to('Run', owner.velocity_dict)
		'jump':
			$"../FSM".change_to('Air', {do_jump=true})
		'attack':
			$"../FSM".change_to('Attack')
		'idle':
			$"../FSM".change_to('Idle')
'''
		

