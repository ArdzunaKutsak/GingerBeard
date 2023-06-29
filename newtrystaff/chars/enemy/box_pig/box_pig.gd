extends EnemyBase



func _on_timer_2_timeout():
	$Zones/agro_area/CollisionShape2D.set_deferred("disabled", false)
	if $FSM.state != $FSM/Hit:
		$FSM.change_to('Agro')


func _on_hit_box_area_entered(_area):
	$FSM.change_to('Hit')
