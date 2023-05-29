extends Node2D

var downed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if downed and position.y < 70:
		position.y += 3
		$EditorButton/Label2.set_text('ПОДНЯТЬ')
	if !downed and position.y > -20:
		$EditorButton/Label2.set_text('АВТОРЫ')
		position.y -= 3

func _on_editor_button_button_down():
	#if !downed:
	#	position.y += 90
	#if downed:
	#	position.y -= 90
	downed = !downed
