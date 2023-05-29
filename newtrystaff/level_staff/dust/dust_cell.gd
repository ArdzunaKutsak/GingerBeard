extends Sprite2D


var start_modulate = randf_range(0,1)
var delta_modulate = 0.01
var modulate_direction = randi_range(-1,1)
func _ready():
	modulate = Color(start_modulate,start_modulate,start_modulate,1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(start_modulate,'/',delta_modulate,'/',modulate_direction)
	if start_modulate >= 1:
		modulate_direction = -1
	if start_modulate <= -1:
		modulate_direction = 1
	if start_modulate > 0.7:
		delta_modulate = 0.005
	if start_modulate < 0.7:
		delta_modulate = 0.03
	if modulate_direction == 0 || modulate_direction == -1:
		start_modulate -= delta_modulate
	if modulate_direction == 1:
		start_modulate += delta_modulate
	modulate = Color(start_modulate,start_modulate,start_modulate,1)
	
