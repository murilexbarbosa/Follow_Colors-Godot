extends Node2D
 
onready var marc = get_node("Marcador")

var perc = 1

signal perdeu_tempo

func _ready():
	set_process(true)

func _process(delta):
	if (get_parent().estado == get_parent().JOGANDO):
		if (perc > 0):
			perc -= 0.12*delta
			marc.set_region_rect(Rect2(0, 0, perc*188, 23))
			marc.set_pos(Vector2(-(1-perc)*188/2, 0))
		else:
			emit_signal("perdeu_tempo",-1)
	elif (get_parent().estado != get_parent().PERDENDO):
		perc = 1
		marc.set_region_rect(Rect2(0, 0, perc*188, 23))
		marc.set_pos(Vector2(-(1-perc)*188/2, 0))

func add(delta):
	perc += delta
	if perc > 1:perc = 1
