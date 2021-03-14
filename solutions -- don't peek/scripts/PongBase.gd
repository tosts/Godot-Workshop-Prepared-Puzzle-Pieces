extends Spatial

export(PackedScene) var ball_scene = preload("res://solutions -- don\'t peek/Ball/Ball.tscn")

onready var endzone = $Area # maybe call it "EndzonePlayer1" & "EndzonePlayer2"
onready var original_velocity = $Ball.velocity

func _ready():
	endzone.connect("body_entered", self, "ball_is_out")

func ball_is_out(body):
	body.queue_free()
	
	var new_ball = ball_scene.instance()
	new_ball.velocity = 0.0
	new_ball.translation.x = 5.0
	add_child(new_ball)
	
	yield(get_tree().create_timer(1.0), "timeout")
	new_ball.velocity = original_velocity
	new_ball.impulse = original_velocity * Vector3.LEFT + 4 * Vector3.UP
