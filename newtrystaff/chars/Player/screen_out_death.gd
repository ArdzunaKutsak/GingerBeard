class_name ScreenOutDeath
extends VisibleOnScreenNotifier2D

func _ready():
	print(get_parent())
	
func _on_screen_exited():
	if get_parent().position.y >  get_parent().get_node('Camera2D').position.y:
		get_parent().health = 1
		get_parent().get_node('Zones/HitBox').hit()
