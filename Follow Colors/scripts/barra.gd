extends Node2D

onready var marc = get_node("barra")
onready var main = get_node("Game")

var perc = 1

signal perdeu_tempo

func _ready():
	set_process(true)

func _process(delta):
	if perc > 0:
		perc -= 0.04*delta
		marc.set_region_rect(Rect2(0, 0, perc*170.330536, 37.07753))
		marc.set_pos(Vector2(-(1-perc)*170.330536/2, 0))
	else:
		emit_signal("perdeu_tempo")

func add(delta):
	perc += delta
	if perc > 1:perc = 1
