class_name Collect
extends Area2D

@onready var sprite = get_child(0)
func _ready():
	collision_layer = 8
	collision_mask = 8
	sprite.play('idle')

func _on_area_entered(area):
	if name == 'door_key':
		area.owner.door_key = true
	collision_layer = 0
	collision_mask = 0
	sprite.animation = 'collect'
	await sprite.animation_finished
	queue_free()
