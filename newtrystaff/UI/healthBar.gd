extends Control



func _ready():
	owner.health_count.connect(hearts_draw)
	hearts_draw()
func hearts_draw():
	match owner.health:
		3:
			$Heart1.visible = true
			$Heart2.visible = true
			$Heart3.visible = true
		2:
			$Heart1.visible = false
			$Heart2.visible = true
			$Heart3.visible = true
			
		1:
			$Heart1.visible = false
			$Heart2.visible = false
			$Heart3.visible = true
		0:
			$Heart1.visible = false
			$Heart2.visible = false
			$Heart3.visible = false
