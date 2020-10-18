extends Spatial

export(NodePath) var ani_player
export(String) var action
#export(String) var delay = 0.0
var delay = 0.0

func _ready():
	#check LOOP option on .anim file
	delay = randf() * 2.0
	yield(get_tree().create_timer(delay), "timeout")
	get_node(ani_player).play(action)
