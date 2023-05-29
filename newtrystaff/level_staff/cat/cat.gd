extends Node2D

var text 
var speach_array = [
	{'icon':'cat','text':'О мой король, вы всё-таки выжили.'},
	{'icon':'player', 'text': 'Рыжебород живее всех живых!'},
	{'icon':'cat', 'text':'Да, но мы в ловушке. Здесь нет прохода, дверь - это лишь замаскированная стена.'},
	{'icon':'player', 'text': 'И что ты предлагаешь?'},
	{'icon':'cat','text':'Возможно где-то есть тайный проход.'},
	{'icon':'player', 'text': 'Тайный проход? И где же например?'},
	{'icon':'cat', 'text': 'Я слышала среди этих свиней какое-то хрюконье про серый флаг.'},
	{'icon':'cat', 'text': 'Да, точно, вспомнил!'},
	{'icon':'cat', 'text': 'В комнатах с серым флагом есть скрытые проходы.'},
]
func _ready():
	$CharacterBody2D/AnimatedSprite2D.play('idle')
	$Label.visible = false

func _on_area_2d_area_entered(area):
	area.owner.dialog(speach_array)
	#$Label.set_text(text)
	#$Label.visible = true
	
func _on_area_2d_area_exited(_area):
	$Label.visible = false
