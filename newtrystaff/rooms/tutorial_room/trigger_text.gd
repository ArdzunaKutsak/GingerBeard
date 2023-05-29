extends Area2D

var text_array = [
		{'icon':'player', 'text':'С помощью рычага, можно открывать - закрывать двери.'},
		{'icon':'player', 'text':'И включать - выключать ловушки. В общем, полезная вещь!'},
]
func _on_area_entered(area):
	area.owner.dialog(text_array)
	queue_free()
