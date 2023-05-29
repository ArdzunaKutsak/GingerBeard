#trigger.gd
class_name Trigger
extends Node2D

var ref_func
var exit_func
	

func _ready():
	$AnimatedSprite2D.play('off')
func _on_area_2d_area_entered(_area):
	if ref_func:
		ref_func.call()
	$AnimatedSprite2D.play('on')
	#$"../profil_door".opened = true
