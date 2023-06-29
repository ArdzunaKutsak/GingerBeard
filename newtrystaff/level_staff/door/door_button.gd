extends Button
 


func _on_button_down():
	owner.enter_door()
	'''
	owner.out_door.opened = true
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
	'''
