extends GameData

#var data = load_game()
var current_room = 1
	
func _ready():
	level_state_dict = load_game()
	save_game([])
	#save_game(level_state_dict)
	#data = await load_game()
	pass

func _process(_delta):
	pass
