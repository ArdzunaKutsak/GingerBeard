extends GameData

#var data = load_game()
var first_room = load("res://newtrystaff/rooms/room_1/room_1.tscn")
#var start_game
var room_card_hall = load("res://newtrystaff/rooms/room_card_hall/room_card_hall.tscn")
#@onready var already_started = owner.data[0]['win']
#@export var play : PackedScene

func _ready():
	level_state_dict = load_game()
	var room_number = str(level_state_dict.size()+1)
	#start_game = load("res://newtrystaff/rooms/room_" + room_number + "/room_" + room_number + ".tscn")
	if int(room_number) > 1:
		$StartButton/Label.modulate = Color(1,1,1,1)
		$StartButton.disabled = false
	if int(room_number) == 1:
		$StartButton/Label.modulate = Color(1,1,1,0.4)
		$StartButton.disabled = true
		
func _on_start_button_button_down():
	#owner.add_child(start_game.instantiate())
	#queue_free()
	get_tree().change_scene_to_packed(room_card_hall)


func _on_restart_button_pressed():
	save_game([])
	get_tree().change_scene_to_packed(first_room)
