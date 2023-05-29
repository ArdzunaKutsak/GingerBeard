#hitBox.gd

extends Area2D

var hit_box_on = true

func _on_area_entered(_area):
	if hit_box_on:
		hit_box_on = false
		$"../../HittingTimer".start(0.2)
		$"../../FSM".change_to('Hit')





func _on_hitting_timer_timeout():
	hit_box_on = true
