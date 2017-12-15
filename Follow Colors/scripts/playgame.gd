extends Node

var packed_scene = load("res://scenes/main.tscn")

func _ready():
	pass

func _on_play_released():
	get_tree().change_scene_to(packed_scene)

