#state_player.gd
class_name  EnemyStateEnemy
extends EnemyState

var enemy: Enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = owner as Enemy
