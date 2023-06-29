extends Node2D


var speach_array = [
	{'icon':'king_pig', 'text':'Никто не смеет называть меня трусом!'},
	{'icon':'king_pig', 'text':'Теперь ты поплатишься за свои слова!'},
]

func _ready():
	$profil_door.open()
	$boss_camera.enabled = false


func _on_trigger_to_start_area_entered(_area):
	$trigger_to_start/Timer.start(0.5)
	$boss_camera.set_deferred('enabled', true)
	$"../Player".get_node('Camera2D').set_deferred('enabled', false)
	$profil_door.close()
	
	


func _on_timer_timeout():
	$"../Player".dialog(speach_array)
	$king_pig_3.get_node('FSM').change_to('Idle')
	$trigger_to_start.queue_free()
	
