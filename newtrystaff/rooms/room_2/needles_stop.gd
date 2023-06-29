extends Area2D

func _on_body_entered(body):
	body.velocity = Vector2(0,0)

