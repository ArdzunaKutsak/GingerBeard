extends GameData

var card_list
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in $cards.get_children().size():
		$cards.get_child(i).number = i+1
	card_list = load_game()
	var card_amount = card_list.size()
	for i in card_amount:
		$"cards".get_child(i).get_child(0).play('open')
		$"cards".get_child(i).get_node('chains').visible = false
		$"cards".get_child(i).next_room = load("res://newtrystaff/rooms/room_"+str(i+1)+"/room_"+str(i+1)+".tscn")
		$"cards".get_child(i).modulate = Color(1,1,1,1)
		$"cards".get_child(i).draw_gems(card_list[i]['gems'])
	$"cards".get_child(card_amount).get_child(0).play('open')
	$"cards".get_child(card_amount).get_node('chains').visible = false
	$"cards".get_child(card_amount).modulate = Color(1,1,1,1)
	$"cards".get_child(card_amount).next_room = load("res://newtrystaff/rooms/room_"+str(card_amount+1)+"/room_"+str(card_amount+1)+".tscn")
	#$"cards".get_child(card_amount).number = str(card_amount+1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
