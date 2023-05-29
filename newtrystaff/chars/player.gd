extends CharacterBody2D


const SPEED = 250
const JUMP_VELOCITY = -300.0
@onready  var sprite = $AnimatedSprite2D
@onready var cameraPoint = $Marker2D/cameraPoint
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumped = 0
var health = 3
var coyot_time = 0.15
var can_jump = false
var hog_jump = false
var direction
var move_press
var can_wall_jump
var wall_jump_timeout = true
var hit = false
var can_hit = true

#signal floor
#signal wall
#signal wall_jump
signal u_turn

func Not_on_floor_events(delta):
	if is_on_wall_only() && move_press:
		if !hog_jump && $HogTimer.is_stopped():
			velocity.y = - 50
			$HogTimer.start(0.15)
		elif hog_jump:
			velocity.y = 50
			switch_anima('wall_j')
			if (get_wall_normal()[0] == 1) && sprite.flip_h == false:
				sprite.flip_h = true
				u_turn.emit('left')
			if (get_wall_normal()[0] == -1) && sprite.flip_h == true:
				u_turn.emit('right')
				sprite.flip_h = false
	else:
		velocity.y += gravity * delta
		if velocity.y >= 0: 
			switch_anima("fall")
func On_floor_events():
	hog_jump = false
	can_jump = true
	$CoyotTimer.start(coyot_time)
	jumped = 0

	if velocity.x == 0:	
		switch_anima("idle")
	else:
		switch_anima("run")
func Jump():
	switch_anima("jump")
	jumped = 1
	velocity.y = JUMP_VELOCITY
func Dubble_jump():

	switch_anima("dubble_j")
	jumped = 2
	velocity.y = JUMP_VELOCITY
func Wall_jump():
	#wall_jump.emit()
	wall_jump_timeout = false
	$WallJumpTimer.start(0.5)

	switch_anima('wall_j')
	velocity.y = JUMP_VELOCITY
	velocity.x = direction * (100 - SPEED)	
	
func switch_anima(anima):
	if !can_hit:
		sprite.animation = 'hit'
	else:
		sprite.animation = anima

func _ready():
	sprite.play() 	
func _physics_process(delta):
	
	var press_left = Input.is_action_pressed("ui_left")
	var press_right = Input.is_action_pressed("ui_right")
	move_press = press_left || press_right
	can_wall_jump = is_on_wall_only()  && move_press
	direction = Input.get_axis("ui_left", "ui_right")
	if !is_on_floor():
		#floor.emit(false, delta)
		Not_on_floor_events(delta)
	if is_on_floor():
		#floor.emit(true, delta)
		On_floor_events()
		
	if Input.is_action_just_pressed("ui_up"):

		if can_wall_jump:
			Wall_jump()
		if jumped == 0 && (is_on_floor() || can_jump):
			Jump()
		if jumped < 2 && !can_wall_jump && !can_jump :
			Dubble_jump()
		
	if wall_jump_timeout:
		velocity.x = direction * SPEED
	if direction > 0 && !is_on_wall_only() && sprite.flip_h == true:
		u_turn.emit('right')
		sprite.flip_h = false
	elif direction < 0 && !is_on_wall_only() && sprite.flip_h == false:
		u_turn.emit('left')
		sprite.flip_h = true
	if Input.is_action_just_pressed('attack'):
		switch_anima('attack')
		await sprite.animation_finished
	move_and_slide()


func _on_coyot_timer_timeout():
	can_jump = false

func _on_hog_timer_timeout():
	hog_jump = true


func _on_wall_jump_timer_timeout():
	wall_jump_timeout = true


func get_hit(bool):
	hit = bool
	if can_hit && hit:
		if $BubbleTimer.is_stopped():
			$BubbleTimer.start(1)
			can_hit = false
			health -= 1
			notify_property_list_changed()
			if health < 1:
				get_tree().change_scene_to_file("res://newtrystaff/windows/death_window.tscn")

	
func _on_bubble_timer_timeout():
	can_hit = true
	if hit:
		get_hit(hit)
	print(health) #ТАймер вечно заводится сначала


func _on_saw_trap_body_entered(body):
	pass # Replace with function body.
