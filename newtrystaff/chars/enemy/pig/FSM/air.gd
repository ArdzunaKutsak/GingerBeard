#air.gd

extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	$"../../Debug_data/VBox/state".set_text('air')
	enemy.sprite.play('jump')
	
	
func inner_physics_process(delta):
	if enemy.health <= 0:
			state_machine.change_to('Death')
			return
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()
	if enemy.is_on_floor():
		state_machine.change_to('Run')

