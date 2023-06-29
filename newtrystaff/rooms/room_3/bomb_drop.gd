extends Area2D

var bomb_path = load("res://newtrystaff/chars/enemy/bomb_pig/bomb/bomb.tscn")
var box_path = load("res://newtrystaff/level_staff/box/box.tscn")
var box_pig_path = load("res://newtrystaff/chars/enemy/box_pig_2/box_pig_2.tscn")
var camera
var start_camera_pos
var pools
var boss
var shake

var index1 = [
	{'what': bomb_path, 'where':0},
	{'what': bomb_path, 'where':3},
	{'what': box_path, 'where':1},
	{'what': box_path, 'where':2},
	{'what': box_pig_path, 'where':4},
]
var index2 = [
	{'what': bomb_path, 'where':1},
	{'what': bomb_path, 'where':2},
	{'what': box_path, 'where':0},
	{'what': box_path, 'where':3},
	{'what': box_pig_path, 'where':4},
]
var index3 = [
	{'what': bomb_path, 'where':4},
	{'what': bomb_path, 'where':3},
	{'what': box_path, 'where':1},
	{'what': box_path, 'where':0},
	{'what': box_pig_path, 'where':2},
]
var index4 = [
	{'what': bomb_path, 'where':0},
	{'what': bomb_path, 'where':4},
	{'what': box_path, 'where':3},
	{'what': box_path, 'where':2},
	{'what': box_pig_path, 'where':1},
]

var indexes = [
	index1,
	index2,
	index3,
	index4
]


func drop(list):
	for index in list:
		var what = index['what'].instantiate()
		pools.get_child(index['where']).add_child(what)
		#what.collision_layer = 0
		#what.position = pools.get_child(i).position
func shake_camera():
	camera.position.x += randi_range(-1,1)
	camera.position.y += randi_range(-1,1)
func _ready():
	shake = false
	boss = $"../../king_pig_3"
	camera = $"../../boss_camera"
	pools = $"../../pools"
	start_camera_pos = camera.position
func _process(_delta):
	if shake:
		shake_camera()
	if abs(abs(global_position.x) - abs(boss.global_position.x)) > 100:
		shake = false
		camera.position = start_camera_pos
		
'''
func _on_area_entered(area):
	area.owner.direction = -area.owner.direction
	area.owner.velocity.x = 300 * area.owner.direction
	shake = true
	drop(indexes[randi_range(0,3)] )
'''

func _on_body_entered(body):
	body.direction = -body.direction
	body.velocity.x = 300 * body.direction
	shake = true
	drop(indexes[randi_range(0,3)])
