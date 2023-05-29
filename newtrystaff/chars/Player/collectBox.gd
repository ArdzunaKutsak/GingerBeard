extends Area2D



func _on_area_entered(area):
	if area.name.contains('gem'):
		owner.gems += 1
		owner.emit_signal('gems_count')
	if area.name.contains('heart'):
		if owner.health < 3:
			owner.health += 1
			owner.emit_signal('health_count')
