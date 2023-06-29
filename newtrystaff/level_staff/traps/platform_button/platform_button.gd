extends Node2D

var ref_func
var exit_func

func _on_area_2d_area_entered(_area):
	$StaticBody2D.position.y += 2
	ref_func.call()
	$press.play()
func _on_area_2d_area_exited(_area):
	if exit_func:
		exit_func.call()
	$StaticBody2D.position.y -= 2
	
