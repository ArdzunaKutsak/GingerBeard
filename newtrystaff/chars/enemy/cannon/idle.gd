extends BaseState

func enter(_msg: Dictionary={}):
	sprite.play('idle')
	$"../../AnimatedSprite2D2".visible = true
	$"../../AnimatedSprite2D2".play("charging")
	await $"../../AnimatedSprite2D2".animation_finished
	state_machine.change_to('Shoot')
