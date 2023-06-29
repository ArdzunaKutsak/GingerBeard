extends Area2D

var button_traps_text_array = [
	{'icon':'monk', 'text':'Помимо, таких явных ловушек есть ещё и более опасные'},
	{'icon':'monk', 'text':'Замаскированные кнопки в полу, могут застать этих орко-свиней врасплох!'},

]


func _on_area_entered(area):
	area.owner.dialog(button_traps_text_array)
	queue_free()


func _on_body_entered(body):
	body.dialog(button_traps_text_array)
	queue_free()
