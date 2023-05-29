extends GameData

var card_list
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $"cards".get_children():
		child.visible = false
	card_list = load_game()
	var card_amount = card_list.size()
	for i in card_amount:
		$"cards".get_child(i).gems = card_list[i]['gems']
		$"cards".get_child(i).visible = true
		$"cards".get_child(i).next_room = load("res://newtrystaff/rooms/room_"+str(i+1)+"/room_"+str(i+1)+".tscn")
		$"cards".get_child(i).number = str(i+1)
	$"cards".get_child(card_amount).visible = true
	$"cards".get_child(card_amount).next_room = load("res://newtrystaff/rooms/room_"+str(card_amount+1)+"/room_"+str(card_amount+1)+".tscn")
	$"cards".get_child(card_amount).number = str(card_amount+1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
