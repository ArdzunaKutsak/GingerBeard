#pig.gd

class_name Enemy
extends CharacterBody2D
const SPEED = 50.0
const JUMP_VELOCITY = -200.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var sprite
var attack_area
var damage_area
var player
var agro
var aim
var can_damage
var direction
var just_turn
var health

func _ready():
	sprite = $AnimatedSprite2D
	attack_area = $Zones/Attack/CollisionShape2D
	damage_area = $Zones/Damage/CollisionPolygon2D
	player = $"../../Player"
	agro = false
	aim = self
	can_damage = false
	direction = -1
	just_turn = false
	health = 2
	
func out_of_box(jump_data: Dictionary = {}):
	for child in $Zones.get_children():
		child.get_child(0).set_deferred('disabled', true)
	$FSM.change_to('Jump', jump_data)

func _process(delta):
	#if health <= 0:
		#for child in $FSM.get_children():
			#if child.name == 'Agro' || child.name == 'Attack':
				#child.queue_free()
	
	if not is_on_floor():
		velocity.y += delta * gravity

