#death.gd

extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	#owner.player.kills += 1
	owner.health -= 1 #Это нужно чтобы в FSM не дать вызвать другие состояния, херовый костыль честно говоря
	owner.sprite.play('death')
	$"../../DeathTimer".start(1)
	$"../../Zones".queue_free()
	$"../../WaitTimer".queue_free()
	await $"../../DeathTimer".timeout
	
	owner.queue_free()



