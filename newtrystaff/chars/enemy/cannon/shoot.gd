extends BaseState

var ball_path = load("res://newtrystaff/chars/enemy/cannon/cannon_ball.tscn")
var shooted 
func enter(_msg: Dictionary={}):
	sprite.play('shoot')
	$"../../AnimatedSprite2D2".visible = false
	shooted = true
func inner_physics_process(_delta):
	if shooted:
		shooted = false
		var ball = ball_path.instantiate()
		owner.owner.add_child(ball)
		ball.position = owner.position
		ball.velocity.x *= owner.direction
		await sprite.animation_finished
		state_machine.change_to('Idle')
		
