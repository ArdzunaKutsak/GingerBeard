extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$hide_enter_2.no_collision_wall = $no_collision_bricks
