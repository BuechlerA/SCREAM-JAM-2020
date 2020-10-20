extends Node2D

func _ready():
	$Viewport.size = get_viewport_rect().size
	$Viewport/Camera/Camera.scale.y = -$Viewport/Camera/Camera.scale.y
	$Sprite.texture = $Viewport.get_texture()
	$Sprite.position = Vector2.ZERO + $Viewport.size / 2
	$Sprite.scale = Vector2.ONE
