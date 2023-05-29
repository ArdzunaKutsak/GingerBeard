extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	match owner.gems:
		0:
			$"1".play("off")
			$"2".play("off")
			$"3".play("off")
		1:
			$"1".play("on")
			$"2".play("off")
			$"3".play("off")
		2:
			$"1".play("on")
			$"2".play("on")
			$"3".play("off")
		3:
			$"1".play("on")
			$"2".play("on")
			$"3".play("on")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
