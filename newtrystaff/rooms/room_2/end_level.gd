extends Area2D

var speach_array = [{'icon':'player', 'text':'Вот и проявилась твоя трусливая натура!'}]
func _ready():
	pass # Replace with function body.



func _on_area_entered(area):
	area.owner.dialog(speach_array)

