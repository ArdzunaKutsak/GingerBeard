extends BaseState


func enter(_msg: Dictionary={}):
	await sprite.animation_finished
	sprite.play('idle')
	$Timer.start(1)


func _on_timer_timeout():
	sprite.play('run')
	owner.scale.x = -1
	owner.velocity.x = 300 
	owner.velocity.y = - 100 
	
	
