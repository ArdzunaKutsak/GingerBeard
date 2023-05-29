#attack.gd

extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	enemy.sprite.play('attack')
	$"../../DamageTimer".start(1)
func inner_physics_process(_delta):
	if enemy.sprite.frame == 2:
		$"../../Zones/Damage".collision_layer = 128
	if enemy.sprite.frame < 2 || enemy.sprite.frame > 2:
		$"../../Zones/Damage".collision_layer = 0
	if $"../../DamageTimer".is_stopped():
		enemy.sprite.play('attack')
		$"../../DamageTimer".start(1)

func exit():
	$"../../Zones/Damage".collision_layer = 0
	
