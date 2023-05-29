
extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	owner.velocity.y = -200
	enemy.get_child(0).play('jump')
	for child in $"../../Zones".get_children():
		child.get_child(0).disabled = true
		
func inner_physics_process(_delta):
	if enemy.is_on_floor:
		state_machine.change_to('Run')
	owner.move_and_slide()
	
func exit():
	for child in $"../../Zones".get_children():
		child.get_child(0).disabled = false
