extends Area2D


func _on_area_entered(_area):
	owner.save_game({'room': 2,'win': true, 'gems':owner.player.gems})
	var win_window = load("res://newtrystaff/rooms/middle_window/win_window.tscn")
	var win_window_item = win_window.instantiate()
	win_window_item.next_room = load("res://newtrystaff/rooms/room_3/room_3.tscn")
	win_window_item.gems = $"../../Player".gems
	$"../../Player/UI".add_child(win_window_item)
	win_window_item.position.x = 320
	win_window_item.position.y = 132
	get_tree().paused = true
