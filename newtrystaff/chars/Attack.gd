#attack.gd
extends Node
@onready var player = get_owner()

func enter(_msg: Dictionary={}):
	$'../../Debug_data/VBox/L_state'.set_text(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func inner_physics_process(delta):
	player.animation.play('attack')
