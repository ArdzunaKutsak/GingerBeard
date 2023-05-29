extends StaticBody2D

func _on_candle_property_list_changed():
	queue_free() 


func _on_candle_2_property_list_changed():
	queue_free() 
