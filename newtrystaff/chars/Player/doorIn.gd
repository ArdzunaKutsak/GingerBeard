#doorIn.gd

extends StatePlayer


func enter(_msg: Dictionary={}):
	player.sprite.play('door_in')
	await player.sprite.animation_finished
