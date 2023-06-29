extends CharacterBody2D
var sound_played = false
func _physics_process(_delta):
	if velocity != Vector2(0,0) and not sound_played:
		$move.play()
		sound_played = true
	if velocity == Vector2(0,0):
		$move.stop()
		sound_played = false
		
		
	move_and_slide()
	
