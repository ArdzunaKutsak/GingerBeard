#hit.gd
extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	enemy.health -= 1
	enemy.sprite.play("hit")
	#$"../../Zones/HitBox".set_deferred('monitoring', false)
func inner_physics_process(_delta):
	await enemy.sprite.animation_finished
	#$"../../Zones/HitBox".set_deferred('monitoring', true)
	if enemy.health <= 0:
		state_machine.change_to('Death')
	if enemy.can_damage:
		state_machine.change_to('Attack')
	else:
		state_machine.change_to('Agro')
#func exit():
	#$"../../Zones/HitBox".set_deferred('monitoring', true)
