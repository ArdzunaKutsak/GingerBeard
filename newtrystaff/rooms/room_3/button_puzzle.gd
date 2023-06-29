extends Node2D


func _ready():
	$wall_lighter12.sprite.play('off')
	$wall_lighter14.sprite.play('off')
	$platform_button.ref_func = first_btn
	$platform_button2.ref_func = second_btn
	$platform_button3.ref_func = third_btn

var first_btn = func():
	first_switch()
	
var second_btn = func():
	second_switch()
	
var third_btn = func():
	third_switch()
	
var empty_btn = func():pass

func first_switch():
	
	$wall_lighter9.sprite.play('off')
	$wall_lighter10.sprite.play('off')
	#$wall_lighter11.sprite.play('off')
	#$wall_lighter13.sprite.play('idle')
	#$wall_lighter12.sprite.play('idle')
	$wall_lighter14.sprite.play('idle')
	#$wall_lighter15.sprite.play('idle')
	#$wall_lighter16.sprite.play('off')
	
	
func second_switch():
	
	$wall_lighter9.sprite.play('idle')
	$wall_lighter10.sprite.play('idle')
	#$wall_lighter11.sprite.play('idle')
	#$wall_lighter13.sprite.play('idle')
	#$wall_lighter12.sprite.play('idle')
	#$wall_lighter14.sprite.play('off')
	#$wall_lighter15.sprite.play('idle')
	$wall_lighter16.sprite.play('idle')
	for child in $".".get_children():
		if child.name.contains('wall'):
			if child.sprite.animation != 'idle':
				return
	$platform_button.ref_func = empty_btn
	$platform_button2.ref_func = empty_btn
	$platform_button3.ref_func = empty_btn
	$"../slide_wall".can_shake = true
	$"../slide_wall".down_speed = 80
	$no_collision_bricks.modulate = Color(1,1,1,0.7)
	$"../../hide/room_4/no_collision_bricks".modulate = Color(1,1,1,0.7)
func third_switch():
	
	#$wall_lighter9.sprite.play('idle')
	#$wall_lighter10.sprite.play('idle')
	#$wall_lighter11.sprite.play('off')
	#$wall_lighter13.sprite.play('idle')
	$wall_lighter12.sprite.play('idle')
	#$wall_lighter14.sprite.play('idle')
	#$wall_lighter15.sprite.play('off')
	$wall_lighter16.sprite.play('off')
	
	
	print('DONE')
