extends CharacterBody2D

@onready var bomb = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")
@onready var sprite = get_child(0)
@onready var player = $"../../Player"
@onready var dialog = $"../../Player/UI/dialog"

var health = 1
var start_fight = false
var direction = -1
var death = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speach_array = [
	{'icon':'king_pig','text':'Не ожидал, что мы ещё встретимся.'},
	{'icon':'player','text':'Ты поплатишься за всё содеяное!'},
	{'icon':'king_pig','text':'Ха-ха-ха, как ты глуп, человек.'},
	{'icon':'king_pig','text':'Хоть ты и король, но нам уже ничто не помешает!'},
	{'icon':'king_pig','text':'Приготовься к смерти!'},
]
var death_speach_array = [
	{'icon':'king_pig','text':'Я недооценивал тебя...'},
	{'icon':'king_pig','text':'Но впредь, я не совершу такой ошибки.'},
	{'icon':'player','text':'Собрался сбежать, трус!?'},
	{'icon':'king_pig','text':'Настоящая битва только впереди!'},
]
func ready():
	sprite.start()
	
func _physics_process(delta):
	if direction == -1:
		transform.x = Vector2(1,0)
	if direction == 1:
		transform.x = Vector2(-1,0)
	if start_fight:
		$"../../Player/Camera2D".enabled = false
		$"../../boss_camer".enabled = true
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()


func _on_hitbox_area_entered(_area):
	$FSM.change_to('Hit')
	
func win():
	var win_window = load("res://newtrystaff/rooms/middle_window/win_window.tscn")
	var win_window_item = win_window.instantiate()
	win_window_item.next_room = load("res://newtrystaff/rooms/room_2/room_2.tscn")
	win_window_item.gems = $"../../Player".gems
	$"../../Player/UI".add_child(win_window_item)
	win_window_item.position.x = 320
	win_window_item.position.y = 132
	get_tree().paused = true
