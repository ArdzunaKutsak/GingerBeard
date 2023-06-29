#player.gd
class_name Player
extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var shape = $CollisionShape2D
@onready var attack_zone = $Zones/Attack
@onready var collect_box = $Zones/CollectBox
@onready var door_box = $Zones/DoorBox
@onready var FSM = $FSM
#@onready var next_room = owner.next_room
var death_window = load("res://newtrystaff/rooms/middle_window/death_window.tscn")
var win_window = load("res://newtrystaff/rooms/middle_window/win_window.tscn")

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var can_attack = true
var can_dubble_jump = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 3
var previous_state = null
var gems = 0
var kills = 0
var door_key = false
var direction = 0
var velocity_dict = {velX=0, velY=0, direction=0,}
signal health_count(lose: bool)
signal gems_count(lose: bool)

func _ready():
	
	$ProgressBar.visible = false
	sprite.play()
func not_monitorable_attack():
	$Zones/Attack.set_deferred('monitorable', false)

func _on_can_attack_timer_timeout():
	$ProgressBar.visible = false
	can_attack = true
	
func dialog(array):
	$UI/dialog.create_dialog(array)

func win():
	var win_window_item = win_window.instantiate()
	add_child(win_window_item)
