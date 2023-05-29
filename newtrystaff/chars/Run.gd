extends Node

#@onready var player = owner
#@onready var sprite = get_node('../AnimatedSprite2D')
#@onready var jumpScript = get_node('../Jump')

#const SPEED = 300
#var direction 
#var can_run = true
#var is_floor
#var is_wall = false

#func _ready():
#	player.floor.connect(_is_floor)
#	player.wall.connect(_is_wall)
#	jumpScript.wall_jump.connect(_can_run)

#func _process(delta):
#	direction = Input.get_axis("ui_left", "ui_right")
#	if can_run:
#		player.velocity.x = direction * SPEED
#	if direction > 0 && !is_wall && sprite.flip_h == true:
#		sprite.flip_h = false
#	if direction < 0 && !is_wall && sprite.flip_h == false:
#		sprite.flip_h = true
		
#func _is_wall(bool):
#	is_wall = bool
#func _is_floor(bool, delta):
#	is_floor = bool
#	if bool and player.velocity.y == 0:
#		if player.velocity.x == 0:	
#			sprite.animation = 'idle'
#		else:
#			sprite.animation = 'run'
#func _can_run():
#	can_run = false
#func _on_wall_jump_timer_timeout():
#	can_run = true
