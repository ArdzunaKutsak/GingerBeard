extends AnimatedSprite2D

var health = 3

func _on_player_property_list_changed():
	health -= 1
	if health > 0:
		animation = str(health)

