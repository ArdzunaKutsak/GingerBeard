extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	enabled = false
	#$Timer.start()


func _on_timer_timeout():
	enabled = !enabled
