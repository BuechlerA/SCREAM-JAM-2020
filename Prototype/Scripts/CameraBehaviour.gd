extends Spatial

export(float) var rot_speed = 3.0
export(float) var fall_speed = 3.0

func _physics_process(delta):
	translation.y = $PlayerPos/Player.global_transform.origin.y
	if Input.is_action_pressed("move_left"):
		rotate_y(rot_speed * delta)
		translation.y -= fall_speed * delta
	if Input.is_action_pressed("move_right"):
		rotate_y(-rot_speed * delta)
		translation.y += fall_speed * delta
