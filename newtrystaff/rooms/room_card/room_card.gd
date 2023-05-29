extends Node2D

var gems
var next_room
var number
func _ready():
	pass
func _process(_delta):
	if $number.text == '#':
		$number.set_text(str(number))
func _on_button_pressed():
	get_tree().change_scene_to_packed(next_room)
