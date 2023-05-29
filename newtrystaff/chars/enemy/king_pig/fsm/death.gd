extends EnemyState

func enter(_msg: Dictionary={}):
	owner.get_child(0).play('death')
	owner.dialog.current_array_item = 0
	owner.player.dialog(owner.death_speach_array)
func inner_physics_process(_delta):
	owner.owner.save_game({'room': 1,'win': true, 'gems':owner.player.gems})
	await owner.get_child(0).animation_finished
	owner.death = true
	owner.win()
	
	
	#queue_free()
