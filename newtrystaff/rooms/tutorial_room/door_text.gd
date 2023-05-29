extends Area2D

var door_text_array = [
		{'icon':'player', 'text':'В дверях подвоха нет, не переживайте, ваше величество.'},
		{'icon':'player', 'text':'Просто нажмите на них и вы пройдёте в следующую комнату.'},
]
func _on_area_entered(area):
	area.owner.dialog(door_text_array)
	queue_free()

