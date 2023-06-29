#areaAttack.gd
extends Area2D

func _on_area_entered(_area):
	if owner.is_on_floor():
		$"../..".can_damage = true
		$"../../FSM".change_to('Attack')
	
	

func _on_area_exited(_area):
	$"../..".can_damage = false
	$"../../FSM".change_to('Agro')
