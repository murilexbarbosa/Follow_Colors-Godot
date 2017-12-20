extends Node2D

var packed_scene = load("res://scenes/menugame.tscn")

func _ready():
	pass


func _on_Return_released():
	get_tree().change_scene_to(packed_scene)
