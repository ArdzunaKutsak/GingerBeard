extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health
var direction

func _ready():
	direction = 1
	health = 3
	#scale.x = - direction
	
func _process(_delta):
	if direction == scale.y:
		scale.x = -direction
	if direction == -1:
		scale = Vector2(1,1)
		rotation = 0
		
	#if is_on_wall():
		#print('yes')
	
func _physics_process(delta):
	if not is_on_floor():
		#collision_layer = 0
		velocity.y += gravity * delta
	if is_on_floor():
		#collision_layer = 8192
		pass
		#$CollisionShape2D.disabled = false
	move_and_slide()
