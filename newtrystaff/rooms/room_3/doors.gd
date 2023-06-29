extends Node2D


func _ready():
	$Door.out_door = $Door2
	$Door2.out_door = $Door
	$Door3.out_door = $Door4
	$Door4.out_door = $Door3
	$Door5.out_door = $Door6
	$Door6.out_door = $Door5
	
	$Door5.need_key = true
	
	$Door.opened = true
	$Door3.opened = true
	
	
	'''
	$Door6.out_door = $Door5
	$Door5.out_door = $Door6
	$Door4.out_door = $Door
	$Door.out_door = $Door4
	$Door2.opened = true
	$Door3.opened = true
	$Door4.opened = true
	$Door5.opened = true
	$Door6.opened = true
	'''

func _process(_delta):
	if $Door2.opened == true:
		$"../hide/room_1/no_collision_bricks".modulate = Color(1,1,1,0.7)
	if $Door4.opened == true:
		$"../hide/room_2/no_collision_bricks".modulate = Color(1,1,1,0.7)
	
