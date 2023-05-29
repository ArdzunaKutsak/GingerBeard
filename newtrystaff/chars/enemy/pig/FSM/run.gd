#run.gd
extends EnemyStateEnemy


func enter(_msg: Dictionary={}):
	enemy.get_child(0).play('run')
	
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
		
	if enemy.health <= 0:
			state_machine.change_to('Death')
			return
	enemy.velocity.x = enemy.SPEED * enemy.direction
	enemy.move_and_slide()
	if enemy.is_on_wall():
		enemy.direction = -enemy.direction
	
#func _on_walk_timer_timeout():
	#if !enemy.agro:
		#enemy.direction = -enemy.direction





	


