#pig.gd

class_name Enemy
extends CharacterBody2D
const SPEED = 50.0
const JUMP_VELOCITY = -200.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var attack_area = $Zones/Attack/CollisionShape2D
@onready var damage_area = $Zones/Damage/CollisionPolygon2D
@onready var player = $"../../Player"
@onready var agro = false
@onready var aim = self
@onready var can_damage = false
@onready var direction = -1
var just_turn = false
var health = 2

func out_of_box():
	$FSM.change_to('Jump')

func _process(delta):
	if health <= 0:
		for child in $FSM.get_children():
			if child.name == 'Agro' || child.name == 'Attack':
				child.queue_free()
	if not is_on_floor():
		velocity.y += delta * gravity

