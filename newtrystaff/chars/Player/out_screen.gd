extends VisibleOnScreenNotifier2D

func _on_screen_exited():
	owner.health = 1
	$"../Zones/HitBox".hit()
