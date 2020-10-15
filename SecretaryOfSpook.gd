extends Node

enum SPOOK_LEVEL {
	LOW,
	MED,
	HIGH
}

export(SPOOK_LEVEL) var current_spook := SPOOK_LEVEL.LOW

onready var low_spooks := $LOW.get_children()
onready var med_spooks := $MED.get_children()
onready var high_spooks := $HIGH.get_children()

var should_spook := false

func _ready():
	randomize()

func _process(delta):
	#we gotta figure out how to set this
	if should_spook:
		var random = randi() % len(low_spooks) + 1
		add_child(low_spooks[random].create())