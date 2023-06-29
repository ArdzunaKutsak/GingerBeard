extends Control

var current_array_item = 0
var player_icon = load("res://newtrystaff/chars/Player/sprites/player_icon.png")
var king_pig_icon = load("res://newtrystaff/chars/enemy/king_pig/king_pig_icon.png")
var sir_icon = load("res://newtrystaff/chars/npc/sir_icon.png")
var monk_icon = load("res://newtrystaff/chars/npc/monk_icon.png")
var priest_icon = load("res://newtrystaff/chars/npc/priest_icon.png")
var mage_icon = load("res://newtrystaff/chars/npc/mage_icon.png")
var knight_icon = load("res://newtrystaff/chars/npc/knight/knight_icon.png")

var array 
func create_dialog(speach_array):
	array = speach_array
	visible = true
	if current_array_item >= speach_array.size():
		current_array_item -= 1
	match speach_array[current_array_item]['icon']: # индекс сохраняется когда воспроизводишь новый диалог
		'player':
			$TextureRect.texture = player_icon
		'king_pig':
			$TextureRect.texture = king_pig_icon
		'sir':
			$TextureRect.texture = sir_icon
		'monk':
			$TextureRect.texture = monk_icon
		'priest':
			$TextureRect.texture = priest_icon
		'mage':
			$TextureRect.texture = mage_icon
		'knight':
			$TextureRect.texture = knight_icon
			
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
