extends Node2D

var next_room
var number

func _process(_delta):
	if $number.text == '#':
		$number.set_text(str(number))
		
func _on_button_pressed():
	get_tree().change_scene_to_packed(next_room)
	
func draw_gems(gems):
	for i in gems:
		print($gems.get_child(i))
		$gems.get_child(i).play('on')
