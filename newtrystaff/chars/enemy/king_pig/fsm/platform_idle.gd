#platform_idle.gd

extends EnemyState

func enter(_msg: Dictionary={}):
	$"../../zones/hitbox".collision_layer = 2
	$"../../zones/hitbox".collision_mask = 64
	owner.get_child(0).play('idle')
	$"../../Timer".start(3)
func inner_physics_process(_delta):
	if $"../../Timer".is_stopped():
		state_machine.change_to('Bomb_attack')
	
