extends Area2D

var traps_text_array = [
	{'icon':'sir', 'text':'Ваше величество, в замке расставлены опасные ловушки.'},
	]



func _on_area_entered(area):
	area.owner.dialog(traps_text_array)
	queue_free()


func _on_body_entered(body):
	body.dialog(traps_text_array)
	queue_free()
