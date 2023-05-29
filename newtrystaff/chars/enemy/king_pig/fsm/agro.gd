extends EnemyState

func enter(_msg: Dictionary={}):
	owner.start_fight = true
	owner.dialog.current_array_item = 0
	owner.player.dialog(owner.speach_array)
	
	
func inner_physics_process(_delta):
	#$"../../Timer".start(0.2)
	#await $"../../Timer".timeout
	state_machine.change_to('Platform_down')
	
