extends KinematicBody

var gravity = -10.0
var velocity = Vector3()
var camera
var character

var speed = 4
var acceleration = 3
var deacceleration = 5
var jumpSpeed = 6
var isJumping = false

func _ready():
	camera = get_node("../Camera").get_global_transform()
	character = get_node(".")

func _physics_process(delta):
	var dir =  Vector3()
	var is_moving = false
	
	if Input.is_action_pressed("move_left"):
		dir += -camera.basis[0]
		is_moving = true
	if Input.is_action_pressed("move_right"):
		dir += camera.basis[0]
		is_moving = true
	if Input.is_action_pressed("move_forward"):
		dir += -camera.basis[2]
		is_moving = true
	if Input.is_action_pressed("move_backward"):
		dir += camera.basis[2]
		is_moving = true
	
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += gravity * delta
	
	var hv = velocity
	hv.y = 0 
	
	var new_pos = dir * speed
	var accel = deacceleration
	
	if(dir.dot(hv) > 0):
		accel = acceleration
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var char_rot = character.get_rotation()
		char_rot.y = angle
		character.set_rotation(char_rot)
