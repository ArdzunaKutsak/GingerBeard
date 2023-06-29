extends BaseState

#@onready var saw_path = load("res://newtrystaff/level_staff/traps/traps_to_call/saw.tscn")

func enter(_msg: Dictionary={}):
	sprite.play('attack')
	$"../../zones/attack/CollisionShape2D".disabled = false
func inner_physics_process(_delta):
	if sprite.frame == 5:
		$"../../zones/attack/CollisionShape2D".disabled = true
		'''
		var delta_x = 0
		for i in 5:
			var saw = saw_path.instantiate()
			owner.owner.add_child(saw)
			saw.position.x = owner.position.x - delta_x
			saw.position.y = owner.position.y + 200 + delta_x
			saw.velocity = Vector2(0,-500-(delta_x*1.3))
			delta_x += 80
		'''
		state_machine.change_to("Idle")
		$"../../Timer".start(4)


	
