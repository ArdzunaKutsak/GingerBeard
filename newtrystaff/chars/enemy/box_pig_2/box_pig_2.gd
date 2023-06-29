extends Node2D
var pig_path = load("res://newtrystaff/chars/enemy/pig/pig.tscn")
func _ready():
	$agro/CollisionShape2D.set_deferred("disabled", false)
func add_pig():
	if get_node('Box'):
		var pig = pig_path.instantiate()
		get_parent().add_child(pig)
		pig.collision_mask = 0
		pig.global_position.x = global_position.x
		pig.global_position.y = $agro.global_position.y
		var direction = scale.x
		pig.out_of_box({'vel': Vector2(100*direction, -250), 'dir':direction})
	$agro/CollisionShape2D.set_deferred("disabled", true)
func _process(_delta):
	if has_node('Box') and get_child(1).is_on_floor:
		$agro.position.y = get_node('Box').position.y

