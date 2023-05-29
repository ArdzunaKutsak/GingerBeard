extends Node

#@onready var player = owner
#@onready var sprite = get_node('../AnimatedSprite2D')
#@onready var wallJumpTimer = get_node('../WallJumpTimer')
#@onready var hogTimer = get_node('../HogTimer')
#@onready var coyotTimer = get_node('../CoyotTimer')
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#const SPEED = 300
#var is_floor = false
#var is_wall = false
#var wall_jump_timeout = true
#const JUMP_VELOCITY = -300
#var countOfJump = 0
#var direction
#var hog_jump = false
#var coyot_jump = true

#var move_press
#signal wall_jump

#func _ready():
#	player.floor.connect(_is_floor)
#	player.wall.connect(_is_wall)
"""
func _is_floor(bool,delta):
	is_floor = bool
	if is_floor:
		hog_jump = false
		coyot_jump = true
		coyotTimer.start(0.15)
		countOfJump = 0
	if !is_floor:
		
		if is_wall && move_press:
			if !hog_jump && hogTimer.is_stopped():
				player.velocity.y = -50
				hogTimer.start(0.15)
			elif hog_jump && wall_jump_timeout:
				player.velocity.y = 50
				sprite.animation = 'wall_j'
				if (player.get_wall_normal()[0] == 1) && sprite.flip_h == false:
					sprite.flip_h = true
				if (player.get_wall_normal()[0] == -1) && sprite.flip_h == true:
					sprite.flip_h = false
		else:	
			player.velocity.y += gravity * delta
			if player.velocity.y >= 0: 
				sprite.animation = 'fall'
	
func _is_wall(bool):
	is_wall = bool
	
func Jump():
	sprite.animation = 'jump'
	countOfJump = 1
	player.velocity.y = JUMP_VELOCITY
	
func Dubble_jump():
	sprite.animation = "dubble_j"
	countOfJump = 2
	player.velocity.y = JUMP_VELOCITY + 25
func Wall_jump():
	player.velocity.y = JUMP_VELOCITY
	player.velocity.x = direction * (100 - SPEED)
	wall_jump.emit()
	wall_jump_timeout = false
	wallJumpTimer.start(0.5)
	sprite.animation = 'wall_j'
	
	
	
	
			
func _process(delta):
	direction = Input.get_axis("ui_left", "ui_right")
	move_press = Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")
	if Input.is_action_just_pressed("ui_up"):
		if move_press && is_wall:
			Wall_jump()
		if countOfJump == 0 && (is_floor || coyot_jump):
			Jump()
		if countOfJump < 2 && !is_wall && !coyot_jump :
			Dubble_jump()
		

func _on_hog_timer_timeout():
	hog_jump = true 


func _on_coyot_timer_timeout():
	coyot_jump= false
"""
