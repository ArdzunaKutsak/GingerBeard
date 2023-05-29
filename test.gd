extends Node2D

func _on_restart_button_button_down():
	get_tree().change_scene_to_file("res://newtrystaff/level_1.tscn")


func _on_menu_button_button_down():
	get_tree().change_scene_to_file("res://newtrystaff/main_menu.tscn")

