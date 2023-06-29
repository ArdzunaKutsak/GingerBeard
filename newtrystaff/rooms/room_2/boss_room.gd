extends Node2D

@onready var saw_path = load("res://newtrystaff/level_staff/traps/traps_to_call/saw.tscn")

var first_trigger_used = false
var second_trigger_used = false 
var third_trigger_used = false 
var fourth_trigger_used = false 
var saw_pos
var high = 0
var plat1_pos
var plat2_pos
var needles_platform_pos

var first_trigger = func():
	saw_and_up()
var second_trigger = func():
	cannon_and_up()
var third_trigger = func():
	saw_and_needles()
var fourth_trigger = func():
	end()
	
var first_player_trigger = func():
	platform_call()
func cannon_and_up():
	for child in get_children():
		if child.name.contains('cannon'):
			child.get_node('FSM').change_to('Idle')
	second_trigger_used = true
func end():
	$profil_door.open()
	$king_pig_2.get_node('FSM').change_to('Run')
	fourth_trigger_used = true
func saw_and_up():
	saw_pos = $king_pig_2.position
	first_trigger_used = true
func saw_and_needles():
	needles_platform_pos = [
		$long_needles14.position, 
		$long_needles15.position,
		$long_needles16.position,
		$long_needles17.position]	
	third_trigger_used = true
func platform_call():
	$"2_cell_platform11".position = plat1_pos
	$"2_cell_platform10".position = plat2_pos
	$"2_cell_platform10".visible = true
	$"2_cell_platform11".visible = true
	
func _ready():
	$boss_trig.ref_func = first_trigger
	$boss_trig.get_node('Area2D').collision_mask = 128
	$boss_trig2.ref_func = first_player_trigger
	$boss_trig3.ref_func = second_trigger
	$boss_trig3.get_node('Area2D').collision_mask = 128
	$boss_trig4.ref_func = third_trigger
	$boss_trig4.get_node('Area2D').collision_mask = 128
	$boss_trig5.ref_func = fourth_trigger
	$boss_trig5.get_node('Area2D').collision_mask = 128
	plat2_pos = $"2_cell_platform10".position
	plat1_pos = $"2_cell_platform11".position
	$"2_cell_platform10".position.y -= 300
	$"2_cell_platform11".position.y -= 300
	$"2_cell_platform10".visible = false
	$"2_cell_platform11".visible = false
	$saw_trap.move_dir = 'left-right'
	$saw_trap.time = 3.4
	$saw_trap2.move_dir = 'left-right'
	$saw_trap2.time = 3.4
	$saw_trap2.move_vel = -80
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if first_trigger_used:
		if !has_node('saw'):
			var delta_x = 0
			for i in 5:
					var saw = saw_path.instantiate()
					add_child(saw)
					saw.position.x = saw_pos.x - delta_x
					saw.position.y = saw_pos.y + 200 + delta_x
					saw.velocity = Vector2(0,-600-(delta_x*1.3))
					delta_x += 80
		if high < 100:
			$king_pig_2.position.y -= 1
			$"4_cell_platform2".position.y -= 1
			$boss_camera.position.y -= 1
			high += 1
	if second_trigger_used and high < 200:
		$king_pig_2.position.y -= 1
		$"4_cell_platform2".position.y -= 1
		$boss_camera.position.y -= 1
		high += 1
	if third_trigger_used:
		if $saw_trap.body.velocity.x < 0 and $long_needles14.position.y == needles_platform_pos[0].y:# and $long_needles15.position.y != needles_platform_pos[1]:
			$long_needles14.position.y -= 8
			$long_needles14.position.x = needles_platform_pos[0].x
			
			$long_needles15.position.y = needles_platform_pos[1].y
			$long_needles15.position.x -= 1000
			
			$long_needles16.position.y -= 8
			$long_needles16.position.x = needles_platform_pos[2].x
			
			$long_needles17.position.y = needles_platform_pos[3].y
			$long_needles17.position.x -= 1000
			
			
		if $saw_trap.body.velocity.x > 0 and $long_needles14.position.y != needles_platform_pos[0].y:# and $long_needles15.position.y == needles_platform_pos[1]:
			$long_needles14.position.y = needles_platform_pos[0].y
			$long_needles14.position.x -= 1000
			
			$long_needles15.position.y -= 8
			$long_needles15.position.x = needles_platform_pos[1].x
			
			$long_needles16.position.y = needles_platform_pos[2].y
			$long_needles16.position.x -= 1000
			
			$long_needles17.position.y -= 8
			$long_needles17.position.x = needles_platform_pos[3].x
		if high < 300:
			$king_pig_2.position.y -= 1
			$"4_cell_platform2".position.y -= 1
			$boss_camera.position.y -= 1
			high += 1
	if fourth_trigger_used and high < 400:
		$boss_camera.position.y -= 1
		high += 1
