extends Control



func _ready():
	owner.gems_count.connect(gems_draw)
	gems_draw()
func gems_draw():
	match owner.gems:
		3:
			$Gem1.visible = true
			$Gem2.visible = true
			$Gem3.visible = true
		2:
			$Gem1.visible = true
			$Gem2.visible = true
			$Gem3.visible = false
			
		1:
			$Gem1.visible = true
			$Gem2.visible = false
			$Gem3.visible = false
		0:
			$Gem1.visible = false
			$Gem2.visible = false
			$Gem3.visible = false
