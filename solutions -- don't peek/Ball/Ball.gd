extends KinematicBody

export(float, .0, 50.0) var velocity := 7.0

onready var impulse = velocity * Vector3.LEFT

func _physics_process(delta):
	var collision = move_and_collide(impulse * delta)
	
	if collision:
		impulse = impulse.bounce(collision.normal)
