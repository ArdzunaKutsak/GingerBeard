extends GameData

@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	$sign.speach_array = [{'icon':'null', 'text':'Отринь страх, стой на своём до конца!'}]


