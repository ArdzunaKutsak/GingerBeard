#tutorial_room.gd
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"doors/Door2".out_door = $"doors/Door3"
	$"doors/Door3".out_door = $"doors/Door2"
	$"doors/Door4".out_door = $"doors/Door5"
	$"doors/Door5".out_door = $"doors/Door4"
	$"doors/Door2".opened = true
	$"doors/Door3".opened = true
	$"doors/Door5".opened = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
