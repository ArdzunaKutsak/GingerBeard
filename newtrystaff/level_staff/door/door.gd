class_name Door
extends Area2D

@onready var label = $TextureRect
@onready var sprite = $AnimatedSprite2D
@onready var player = $"../../Player"
var next_room
var out_door : Area2D
var opened : bool = false

func _ready():
	pass
func _on_area_entered(area):
	if area.owner.door_key || opened:
		#area.owner.door_key = false
		opened = true
		sprite.play('open')
		$"TextureRect".visible = true
		$Button.disabled = false


func _on_area_exited(_area):
	if opened:
		sprite.play('close')
		$"TextureRect".visible = false
		$Button.disabled = true
