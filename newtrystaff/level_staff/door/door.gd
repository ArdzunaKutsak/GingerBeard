class_name Door
extends Area2D

@onready var label = $TextureRect
@onready var sprite = $AnimatedSprite2D
@onready var player = $"../../Player"

var next_room
var out_door : Area2D
var opened : bool = false
var need_key
func _ready():
	sprite.play("idle")
	
func _on_area_entered(area):
	if need_key and area.owner.door_key:
		opened = true
		area.owner.door_key = false
	if opened:
		opened = true
		sprite.play('open')
		$"TextureRect".visible = true
		$Button.disabled = false
		$open.play()
	else:
		$locked.play()
		$"TextureRect2".visible = true
		


func _on_area_exited(_area):
	if opened:
		$close.play()
		sprite.play('close')
		$"TextureRect".visible = false
		$Button.disabled = true
	$"TextureRect2".visible = false
	

func enter_door():
	if opened:
		out_door.opened = true
		player.position.x = position.x + 8
		player.FSM.change_to('DoorIn')
		await player.sprite.animation_finished
		player.position.x = out_door.position.x + 8
		player.position.y = out_door.position.y + 14
		player.visible = false
		player.FSM.change_to('EmptyState')
		await out_door.sprite.animation_finished
		player.FSM.change_to('DoorOut')
		player.visible = true
