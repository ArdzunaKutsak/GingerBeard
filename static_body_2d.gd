extends StaticBody2D
var is_collide = false
var velY = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var is_collide = move_and_collide(Vector2(0, velY))
	
	if !is_collide:
		velY += delta * 9.80
	else: velY= 0
	pass
