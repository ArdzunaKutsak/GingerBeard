extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	if _msg.has('vel'):
		owner.velocity = _msg['vel']
		owner.direction = _msg['dir']
	else:
		owner.velocity.y = -250
	enemy.get_child(0).play('jump')
	
		
func inner_physics_process(_delta):
	if enemy.direction < 0 and enemy.sprite.flip_h:
		enemy.sprite.flip_h = false
		enemy.sprite.position.x = 0
		enemy.attack_area.position.x = -11.5
		enemy.damage_area.position.x = -10
		enemy.damage_area.set_scale(Vector2(1,1))
		#$"../../no_fall_shit".position.x = -5
		#$"../../no_fall_shit/CollisionShape2D".position.y = 10
		$"../../Zones/NoFallBox".position.x = -2
	if enemy.direction > 0 and !enemy.sprite.flip_h:
		enemy.sprite.flip_h = true
		enemy.sprite.position.x = 7
		enemy.attack_area.position.x = 22
		enemy.damage_area.position.x = 21
		enemy.damage_area.set_scale(Vector2(-1,1))
		#$"../../no_fall_shit/CollisionShape2D".position.x = 11
		#$"../../no_fall_shit/CollisionShape2D".position.y = 10
		$"../../Zones/NoFallBox".position.x = 20
	if owner.velocity.y >= 0:
		owner.collision_mask = 257
	if enemy.is_on_floor():
		state_machine.change_to('Run')
	owner.move_and_slide()
	
func exit():
	for child in $"../../Zones".get_children():
		child.get_child(0).set_deferred('disabled', false)
