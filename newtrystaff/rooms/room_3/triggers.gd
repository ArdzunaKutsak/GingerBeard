extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.set_deferred('collision_mask', 8192)
	$platform_up/CollisionShape2D.set_deferred("disabled", true)
	$platform_up2/CollisionShape2D.set_deferred("disabled", true)

