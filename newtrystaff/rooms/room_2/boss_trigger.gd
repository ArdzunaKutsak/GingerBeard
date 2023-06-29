extends Area2D

var screen_control = load("res://newtrystaff/chars/Player/screen_out_death.tscn")

var speach_array = [
	{'icon':'king_pig','text':'Вот мы и снова встретились, человечишко!'},
	{'icon':'king_pig','text':'Я изучил ваши жалкие ловушки! Тебе остаётся лишь молиться!'},
	{'icon':'king_pig','text':'Ха-ха! Сейчас я покажу тебе фокус - "Распиливание Короля"!'},
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_entered(area):
	var screen_out_death = screen_control.instantiate()
	$"../../Player".add_child(screen_out_death)
	area.owner.get_node('Camera2D').enabled = false
	$"../../doors/profil_door".close()
	$"../boss_camera".enabled = true
	area.owner.dialog(speach_array)
	$"../king_pig_2".get_node('FSM').change_to('Jump')
	queue_free()
