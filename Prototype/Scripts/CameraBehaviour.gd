extends Spatial

export var follow_distance = 4.0
export var follow_height = 2.0
export var follow_enabled = false

var player

func _ready():
	player = get_node("../CharacterController")
	set_physics_process(true)
	set_as_toplevel(true)
	
func _physics_process(delta):
	var target = player.get_global_transform().origin
	var curr_pos = get_global_transform().origin
	var up_dir = Vector3(0,1,0)
	if follow_enabled:
		var offset = curr_pos - target
		offset = offset.normalized() * follow_distance
		offset.y  = follow_height
		
		curr_pos = target + offset
		
		look_at_from_position(curr_pos,target, up_dir)
	elif !follow_enabled:
		look_at(target, up_dir)
