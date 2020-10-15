extends KinematicBody

var gravity = -50.0
var velocity = Vector3()
var camera
var character

export(float) var speed = 4
var isJumping = false

func _physics_process(delta):
	move_and_slide(Vector3(0, gravity * delta, 0), Vector3.UP)
	translation.x = 0
	translation.z = 0
