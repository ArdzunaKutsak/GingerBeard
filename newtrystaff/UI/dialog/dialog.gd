extends Control

var current_array_item = 0
var player_icon = load("res://newtrystaff/chars/Player/sprites/player_icon.png")
var cat_icon = load("res://newtrystaff/level_staff/cat/cat_icon.png")
var king_pig_icon = load("res://newtrystaff/every/Sprites/02-King Pig/Fall (38x28).png")
var array 
func create_dialog(speach_array):
	array = speach_array
	visible = true
	if current_array_item >= speach_array.size():
		current_array_item -= 1
	match speach_array[current_array_item]['icon']: # индекс сохраняется когда воспроизводишь новый диалог
		'player':
			$TextureRect.texture = player_icon
		'cat':
			$TextureRect.texture = cat_icon
		'king_pig':
			$TextureRect.texture = king_pig_icon
			
	$RichTextLabel.set_text(speach_array[current_array_item]['text'])
	current_array_item += 1
	get_tree().paused = true
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#get_tree().paused = visible


func _on_button_pressed():
	get_tree().paused = false
	if current_array_item >= array.size():
		visible = false
		current_array_item = 0
		#create_dialog(array)
	else:
		
		create_dialog(array)
		#visible = false
