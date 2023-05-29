#doorOut.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	player.get_child(0).play('door_out')
	await player.sprite.animation_finished
	state_machine.change_to('Idle')
