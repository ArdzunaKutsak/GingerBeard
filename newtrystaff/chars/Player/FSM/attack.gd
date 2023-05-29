#attack.gd
extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../Zones/Attack".collision_mask = 2
	$"../../Zones/Attack".collision_layer = 64
	if player.sprite.flip_h:
		player.attack_zone.set_scale(Vector2(-1, 1 ))
		player.attack_zone.position.x = -14
	if !player.sprite.flip_h:
		player.attack_zone.set_scale(Vector2(1, 1 ))
		player.attack_zone.position.x = 0
	player.can_attack = false
	player.velocity.y = 0
	player.velocity.x = player.velocity.x 
	player.sprite.play('attack')
	$"../../CanAttackTimer".start(0.6)
	$"../../ProgressBar".play('charge')
	$"../../ProgressBar".visible = true
	
	
	
func inner_physics_process(_delta):
	if player.sprite.frame == 1:
		$"../../Zones/Attack".monitoring = true
		$"../../Zones/Attack".set_deferred('monitorable', true)
		$"../../Zones/Attack".collision_mask = 2
		$"../../Zones/Attack".collision_layer = 64
	else:
		$"../../Zones/Attack".collision_mask = 0
		$"../../Zones/Attack".collision_layer = 0
		$"../../Zones/Attack".monitoring = false
		$"../../Zones/Attack".set_deferred('monitorable', false)
	if player.sprite.frame == 2:
		state_machine.change_to('Idle')

func exit():
	$"../../Zones/Attack".collision_mask = 0
	$"../../Zones/Attack".collision_layer = 0

func _on_animated_sprite_2d_animation_finished():
	pass


