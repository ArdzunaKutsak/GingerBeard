#death_window.gd

extends Node2D

var menu = load("res://newtrystaff/UI/main_menu/main_menu.tscn")

func _on_restart_pressed():
	get_tree().reload_current_scene()



func _on_main_menu_pressed():
	get_tree().change_scene_to_packed(menu)
