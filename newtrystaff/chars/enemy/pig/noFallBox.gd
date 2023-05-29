extends Area2D


func _process(_delta):
	pass
	#if !has_overlapping_bodies() && !owner.just_turn:
		#owner.just_turn = true
		#owner.direction = -owner.direction


func _on_body_exited(_body):
	if !has_overlapping_bodies():
		if $"../../WaitTimer".is_stopped():
			$"../../WaitTimer".start(0.15)
			owner.direction = -owner.direction
