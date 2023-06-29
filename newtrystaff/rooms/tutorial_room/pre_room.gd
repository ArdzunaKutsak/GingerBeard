extends Node2D

var speach_array1 = [
	{'icon':'player', 'text':'Опыт не пропьёшь! Все ящики в щепки! Теперь можно и в галлерею сходить'}
]
var speach_array2 = [
	{'icon':'player', 'text':'Эх, руки уже не те! Даже стыдно, что не по всем ящикам попал... '},
	{'icon':'player', 'text':'Схожу в галлерею, что-ли...'}
]
# Called when the node enters the scene tree for the first time.
func _ready():
	$profil_door2.open()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not has_node("Bomb") and not has_node("Bomb2") and $Timer.is_stopped() and not $profil_door.opened:
		$Timer.start(1)
		

func _on_timer_timeout():
	$profil_door.open()
	if $boxes.get_children().size() == 0:
		$"../Player".dialog(speach_array1)
	if $boxes.get_children().size() > 0:
		$"../Player".dialog(speach_array2)
	$Camera2D.enabled = false
	$"../Player/Camera2D".enabled = true
