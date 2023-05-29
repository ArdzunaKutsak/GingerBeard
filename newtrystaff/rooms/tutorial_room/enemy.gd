extends Node2D
var color = 0.392
var color_delta = 0.008
var text_array = [
	{'icon':'king_pig', 'text':'Действительно! Вы так хорошо защищены!'},
	{'icon':'king_pig', 'text':'Жалкие людишки! Они расчитывали на свой крохотный мозг!'},
	{'icon':'king_pig', 'text':'Думали нас так просто остановить? Ха-ха!Схватить их!'},
]
var catch = false
func walk():
	for child in get_children():
		child.walk = true
		child.visible = true
	if !catch:
		$"../Timer".start(1.2)

func stop():
	for child in get_children():
		child.walk = false


func _on_timer_timeout():
	stop()
	if !$king_pig.dialog:
		$king_pig.dialog = true
		$"../Player".dialog(text_array)
	catch = true
	walk()

func _process(_delta):
	if catch:
		color -= color_delta
		for child in $"../Player/UI".get_children():
			child.modulate = Color(color,color,color,1)
		$"..".modulate = Color(color,color,color,1)
		
