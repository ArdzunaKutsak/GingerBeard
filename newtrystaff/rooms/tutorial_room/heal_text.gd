extends Area2D

var heal_text_array = [
		{'icon':'player', 'text':'Если вы поранились, вам помогут целебные сердца'},
]
func _on_area_entered(area):
	area.owner.dialog(heal_text_array)
	queue_free()



func _on_body_entered(body):
	body.dialog(heal_text_array)
	queue_free()
