extends BaseState


func enter(_msg: Dictionary={}):
	sprite.play('run')
	
func inner_physics_process(_delta):
	owner.velocity.x = 300 * owner.direction
	pass
	
	#if owner.is_on_wall() and owner.is_on_floor():
		#owner.direction = -owner.direction
		#owner.velocity.x = 300 * owner.direction
		
