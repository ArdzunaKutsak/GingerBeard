extends Node2D

var previous_node


func _on_touch_screen_button_pressed():
	owner.owner.add_child(previous_node)
	owner.queue_free()
