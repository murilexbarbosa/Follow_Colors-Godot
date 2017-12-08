extends Node2D

onready var somvermelho = get_node("SomVermelho")
onready var somverde = get_node("SomVerde")
onready var somamarelo = get_node("SomAmarelo")
onready var somazul = get_node("SomAzul")

func _ready():
	pass

func _on_btnvermelho_pressed():
	somvermelho.play()

func _on_btnverde_pressed():
	somverde.play()

func _on_btnamarelo_pressed():
	somamarelo.play()

func _on_btnazul_pressed():
	somazul.play()
