extends Area2D

var text_array = [
		{'icon':'player', 'text':'Некоторые двери будут закрыты на ключ'},
]
func _on_area_entered(area):
	area.owner.dialog(text_array)
	queue_free()
