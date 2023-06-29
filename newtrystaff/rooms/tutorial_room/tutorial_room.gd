#tutorial_room.gd
extends Node2D

var speach_array = [
	{'icon':'player', 'text':'Пока идут последние приготовления, я сыграю в свою любимую игру'},
	{'icon':'player', 'text':'Буду своим молотом бить по этим бомбам. Главное до ящиков достать'},
]
func _ready():
	$"doors/Door".out_door = $"doors/Door0"
	$"doors/Door0".out_door = $"doors/Door"
	$"doors/Door2".out_door = $"doors/Door3"
	$"doors/Door3".out_door = $"doors/Door2"
	$"doors/Door4".out_door = $"doors/Door5"
	$"doors/Door5".out_door = $"doors/Door4"
	$"doors/Door2".opened = true
	$"doors/Door0".opened = true
	$"doors/Door".opened = true
	$"doors/Door3".opened = true
	$"doors/Door5".opened = true
	$"doors/Door4".need_key = true
	$TimerStartDialog.start(1)
	$Player.get_node('Camera2D').enabled = false


func _on_timer_start_dialog_timeout():
		$Player.dialog(speach_array)
