extends BaseState

var speach_array = [{'icon': 'player', 'text':'Вот и настал конец твоему хрюканью!'}]
var already_speach = false
func enter(_msg: Dictionary={}):
	owner.collision_mask = 1
	owner.velocity.x = 0
	owner.velocity.y = 0
	sprite.play('death')
	
	$"../../End".start(1)
	#await sprite.animation_finished
	#owner.queue_free()





func _on_end_timeout():
	if already_speach:
		owner.owner.save_game({'room': 3,'win': true, 'gems':owner.owner.player.gems})
		var win_window = load("res://newtrystaff/rooms/middle_window/win_window.tscn")
		var win_window_item = win_window.instantiate()
		win_window_item.next_room = load("res://newtrystaff/rooms/room_4/room_4.tscn")
		win_window_item.gems = owner.owner.player.gems
		owner.owner.player.get_node('UI').add_child(win_window_item)
		win_window_item.position.x = 320
		win_window_item.position.y = 132
		get_tree().paused = true
		return
	owner.owner.player.dialog(speach_array)
	already_speach = true
	$"../../End".start(1)
	
