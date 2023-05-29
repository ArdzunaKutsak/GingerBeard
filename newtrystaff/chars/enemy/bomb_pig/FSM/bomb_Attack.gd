extends EnemyStateEnemy
func enter(_msg: Dictionary={}):
	owner.sprite.play('attack')

func inner_physics_process(_delta):
	if owner.sprite.frame == 3:
		var direction
		if owner.scale == Vector2(1,1):
			direction = 1
		else:direction = -1
		var bomb = owner.bomb.instantiate()
		add_child(bomb)
		bomb.set_position(owner.position)
		bomb.get_node('FSM').change_to('On', {velY = -100, velX = -300*direction, aim = 'player'})
		state_machine.change_to('Picking')
