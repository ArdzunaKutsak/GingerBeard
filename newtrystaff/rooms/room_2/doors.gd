extends Node2D


func _ready():
	$Door2.out_door = $Door3
	$Door3.out_door = $Door2
	$Door6.out_door = $Door5
	$Door5.out_door = $Door6
	$Door2.opened = true
	$Door3.opened = true
	$Door5.opened = true
	$Door6.opened = true


func _on_door_key_area_entered(_area):
	$profil_door.open()
	$"../Player".door_key = false
