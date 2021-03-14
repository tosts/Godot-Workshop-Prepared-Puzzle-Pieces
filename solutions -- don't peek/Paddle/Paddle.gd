extends KinematicBody

export(float, .0, 50.0) var velocity := 6.0
export(float, .01, 1.0) var acceleration := .2

onready var impulse = Vector3.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
		impulse = impulse.linear_interpolate(velocity * Vector3.UP, acceleration)
	if Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_up"):
		impulse = impulse.linear_interpolate(velocity * Vector3.DOWN, acceleration)
	if !Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_up") or \
		Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		impulse = impulse.linear_interpolate(Vector3.ZERO, acceleration / 2)
	
	move_and_collide(impulse * delta)
