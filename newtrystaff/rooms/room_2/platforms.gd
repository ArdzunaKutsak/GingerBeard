extends Node2D


func _on_stop_lift_body_entered(_body):
	$moving_platform.velocity.y = 0
