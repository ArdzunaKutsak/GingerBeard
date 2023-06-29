extends Node2D

@onready var health_bar = $"../HealthBar"
@onready var gem_bar = $"../gem_bar"

@onready var move_buttons = $"../../move_buttons"
@onready var action_buttons = $"../../action_buttons"
var menu_node = load("res://newtrystaff/UI/main_menu/main_menu.tscn")
var start_modulate

func _ready():
	start_modulate = owner.owner.modulate
func _on_restart_pressed():
	$"../../../sounds/menu_button_press".play()
	
	get_tree().reload_current_scene()
	get_tree().paused = !get_tree().paused
	


func _on_home_pressed():
	$"../../../sounds/menu_button_press".play()
	
	get_tree().change_scene_to_packed(menu_node)
	get_tree().paused = !get_tree().paused
	


func _on_burger_menu_pressed():
	$"../../../sounds/menu_button_press".play()
	owner.owner.modulate = Color(0.2,0.2,0.2,1)
	health_bar.modulate = Color(0.2,0.2,0.2,1)
	gem_bar.modulate = Color(0.2,0.2,0.2,1)
	move_buttons.modulate = Color(0.2,0.2,0.2,1)
	action_buttons.modulate = Color(0.2,0.2,0.2,1)
	visible = true
	get_tree().paused = true


func _on_continue_pressed():
	$"../../../sounds/menu_button_press".play()
	owner.owner.modulate = start_modulate
	health_bar.modulate = Color(1,1,1,1)
	gem_bar.modulate = Color(1,1,1,1)
	move_buttons.modulate = Color(1,1,1,1)
	action_buttons.modulate = Color(1,1,1,1)
	visible = false
	get_tree().paused = false
