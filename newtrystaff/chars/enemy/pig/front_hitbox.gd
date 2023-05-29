extends Area2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func hit():
	$".././FSM".change_to('Hit', {front=true})
