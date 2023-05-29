extends EnemyState
var bombX 
var attacked 
func enter(_msg: Dictionary={}):
	bombX = 600
	attacked = false
	owner.get_child(0).play('attack')
	
func inner_physics_process(_delta):
	if owner.sprite.frame == 3 and !attacked:
		attacked = true
		for i in range(6):
			
			var bomb = owner.bomb.instantiate()
			var bomb_state 
			add_child(bomb)
			bomb.set_position(owner.position)
			if i == 2:
				bomb_state = 'Off'
				bomb.velocity.y = -100
				bomb.velocity.x = bombX*owner.direction
			if i != 2:
				bomb_state = 'On'
			
			bomb.get_node('FSM').change_to(bomb_state, {velY = -100, velX = bombX*owner.direction, aim = 'player'})
			bombX -= 100
			
	if owner.sprite.frame == 4:
		state_machine.change_to('Platform_down')
