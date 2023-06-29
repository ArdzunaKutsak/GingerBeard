extends Area2D

var text_array = [
		{'icon':'mage', 'text':'Как видите, ваше величество. Мы подготовлены'},
		{'icon':'mage', 'text':'Эти наглые зелёные орко-свиньи не проникнут!'},
]
func _on_area_entered(area):
	area.owner.dialog(text_array)
	$"../../enemy".walk()
	queue_free()
