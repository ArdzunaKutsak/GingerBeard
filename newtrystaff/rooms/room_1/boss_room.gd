extends SaveLoad

@onready var next_room = load("res://newtrystaff/rooms/room_2/room_2.tscn")

func _ready():
	$boss_door.next_room = next_room
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
