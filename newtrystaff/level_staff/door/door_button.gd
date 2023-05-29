extends Button
 


func _on_button_down():
	if owner.name == 'boss_door':
		get_tree().change_scene_to_packed(owner.next_room)
	else:
		owner.player.position.x = owner.position.x + 8
		owner.player.FSM.change_to('DoorIn')
		await owner.player.sprite.animation_finished
		owner.player.position.x = owner.out_door.position.x + 8
		owner.player.position.y = owner.out_door.position.y + 14
		owner.player.visible = false
		owner.player.FSM.change_to('EmptyState')
		await owner.out_door.sprite.animation_finished
		owner.player.FSM.change_to('DoorOut')
		owner.player.visible = true
	
