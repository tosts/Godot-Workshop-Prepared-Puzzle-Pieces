extends KinematicBody

export(NodePath) var first_target

onready var impulse = Vector3.ZERO
onready var target = get_node(first_target)

func reset_target(new_target: Node):
	target = new_target

func _physics_process(delta):
	if target:
		impulse = Vector3(
			.0,
			pow(target.translation.y - translation.y, 3),
			pow(target.translation.z - translation.z, 3));
	
	move_and_collide(impulse * delta)
