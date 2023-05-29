#base.gd
class_name EnemyBase
extends CharacterBody2D

@onready var player = $"../../Player"
@onready var sprite = get_child(0)
@onready var normal_scale = scale

const SPEED = 50
const JUMP_VELOCITY = -200.0

var health = 2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var agro = false
var aim = self
var can_damage = false
var direction = -1
var just_turn = false
func _physics_process(_delta):
	move_and_slide()
