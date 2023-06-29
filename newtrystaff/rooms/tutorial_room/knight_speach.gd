extends Area2D

var speach_array = [
	{'icon':'knight','text':'Ваше высочество, все приготовления завершены!'},
	{'icon':'player','text':'Давно пора. Сейчас я всё осмотрю.'},
]


func _on_body_entered(body):
	body.dialog(speach_array)
	queue_free()
