extends Node

var packed_scene = load("res://scenes/main.tscn")
var packed_scene_more = load("res://scenes/more.tscn")

func _ready():
	pass

func _on_play_released():
	get_tree().change_scene_to(packed_scene)

func _on_quit_released():
	get_tree().quit()

func _on_more_released():
	get_tree().change_scene_to(packed_scene_more)
