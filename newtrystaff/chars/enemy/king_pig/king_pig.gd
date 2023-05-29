extends Node2D

@onready var bomb = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")
@onready var boss = $CharacterBody2D
var health = 10
var start_fight = false
var direction = -1


func _ready():
	pass


func _process(_delta):
	if direction == -1:
		boss.transform.x = Vector2(1,0)
	if direction == 1:
		boss.transform.x = Vector2(-1,0)
	if start_fight:
		$"../../Player/Camera2D".enabled = false
		$"../../boss_camer".enabled = true
