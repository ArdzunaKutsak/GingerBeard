#death.gd

extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	#owner.player.kills += 1
	owner.health -= 1 #Это нужно чтобы в FSM не дать вызвать другие состояния, херовый костыль честно говоря
	owner.sprite.play('death')
	$"../../DeathTimer".start(1)
	$"../../Zones".queue_free()
	#$"../../WaitTimer".queue_free()
	if _msg.has('vel'):
		owner.velocity = _msg['vel']
	await $"../../DeathTimer".timeout
	owner.queue_free()

func inner_physics_process(delta):
	if owner.velocity.x > 0:
		owner.velocity.x -= 1
	if not owner.is_on_floor():
		owner.velocity.y += delta * owner.gravity
	if owner.is_on_floor() and owner.sprite.frame == 9 and owner.sprite.animation == 'death':
		owner.queue_free()
	owner.move_and_slide()


