extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Box26.get_node('Area2D').collision_mask = 64
	$Box27.get_node('Area2D').collision_mask = 64
	$Box28.get_node('Area2D').collision_mask = 64
	$box_pig_2.get_node('Box').get_node('Area2D').collision_mask = 64

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
