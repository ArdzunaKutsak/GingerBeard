extends Node2D

var player = null
var speach_array

func _ready():
	$Sign.play('idle')
	$TouchScreenButton.disabled = true

func _on_touch_screen_button_button_down():
	player.dialog(speach_array)


func _on_area_2d_area_entered(area):
	$Sign.play('touch')
	player = area.owner
	$TouchScreenButton.set_deferred('disabled', false)


func _on_area_2d_area_exited(_area):
	$Sign.play('idle')
	player = null
	$TouchScreenButton.set_deferred('disabled', true)
