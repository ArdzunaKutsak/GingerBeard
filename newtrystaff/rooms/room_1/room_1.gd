extends GameData
'''
var needles_ref = func ref():
	needles_switch()
var bomb_drop_ref = func ref():
	bomb_drop()
	
func needles_switch():
	if $traps/long_needles.position.y == 0:
		$traps/long_needles.position.y = 8
	else:
		$traps/long_needles.position.y = 0
func bomb_drop():
	print('Bomb drop')
'''
func _ready():
	$"doors/Door".out_door = $"doors/Door2"
	$"doors/Door2".out_door = $"doors/Door"
	$"doors/Door3".out_door = $"doors/Door4"
	$"doors/Door4".out_door = $"doors/Door3"
	$"doors/Door".need_key = true
	$"doors/Door2".opened = true
	$"doors/Door3".opened = true
	$"doors/Door4".opened = true
	$trigger.ref_func = func():
		$profil_door.open()
		
	$sign.speach_array = [{'icon':'null','text':'Ниже этажом, есть тайный проход'}]
	#$traps/platform_button.ref_func = funcref('needles_switch')
func _process(_delta):
	
	pass
	

