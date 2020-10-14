extends KinematicBody

var gravity = Vector3.DOWN * 12
var moveSpeed = 4
var jumpSpeed = 6

var velocity = Vector3()

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	
func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("move_left"):
		velocity.x += moveSpeed
	if Input.is_action_pressed("move_right"):
		velocity.x -= moveSpeed
	if Input.is_action_pressed("move_up"):
		velocity.z += moveSpeed
	if Input.is_action_pressed("move_down"):
		velocity.z -= moveSpeed
