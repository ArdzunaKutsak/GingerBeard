extends Area2D


func _on_area_entered(_area):
	$"../../sounds/enemy_hurt".play()
