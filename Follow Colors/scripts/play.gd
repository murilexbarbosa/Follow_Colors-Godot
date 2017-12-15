extends Area2D

var packed_scene = load("res://scenes/main.tscn")

func _ready():
	pass
	
func _on_playarea_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		get_tree().change_scene_to(packed_scene)