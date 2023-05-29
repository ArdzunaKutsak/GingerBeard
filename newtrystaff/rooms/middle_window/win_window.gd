extends Node2D

var menu = load("res://newtrystaff/UI/main_menu/main_menu.tscn")
var next_room
var gems

func _ready():
	pass
	
func _on_next_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_packed(next_room)


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_packed(menu)
