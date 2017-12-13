extends Node2D

onready var somvermelho = get_node("player/controle/SomVermelho")
onready var somverde = get_node("player/controle/SomVerde")
onready var somamarelo = get_node("player/controle/SomAmarelo")
onready var somazul = get_node("player/controle/SomAzul")

onready var botaovermelho =  get_node("player/controle/btnvermelho")
onready var botaoverde =  get_node("player/controle/btnverde")
onready var botaoamarelo =  get_node("player/controle/btnamarelo")
onready var botaoazul =  get_node("player/controle/btnazul")

onready var animvermelho =  get_node("player/controle/AnimVermelho")
onready var animverde =  get_node("player/controle/AnimVerde")
onready var animamarelo =  get_node("player/controle/AnimAmarelo")
onready var animazul =  get_node("player/controle/AnimAzul")

onready var timerGeraSequencia = get_node("timerGeraSequencia")

var sequenciaPC = []
var sequenciaPlayer = []
var rodada = 0
var estado = 3
var NumCorSequencia =0
var ValorSequencia
var ExecutandoTimer = true
var _thread


const JOGANDO = 1
const PERDENDO = 2
const GERANDO = 3

func _ready():
	randomize()
	set_process(true)
	timerGeraSequencia.start()


# FUNCOES PARA O CLIQUE DO BOTAO
func _on_btnvermelho_pressed():
	somvermelho.play()
func _on_btnverde_pressed():
	somverde.play()
func _on_btnamarelo_pressed():
	somamarelo.play()
func _on_btnazul_pressed():
	somazul.play()
################################
	
func bloqueia_botoes():
	botaovermelho.hide()
	botaoverde.hide()
	botaoamarelo.hide()
	botaoazul.hide()

func libera_botoes():
	botaovermelho.show()
	botaoverde.show()
	botaoamarelo.show()
	botaoazul.show()
	
# ANIMAÇÕES
func playvermelho(): #0
	somvermelho.play()
	animvermelho.play("show_hide")
func playverde(): #1
	somverde.play()
	animverde.play("show_hide")
func playamarelo(): #2
	somamarelo.play()
	animamarelo.play("show_hide")
func playazul(): #3
	somazul.play()
	animazul.play("show_hide")
##############################################


func playseq(num):
	print("playseq: "+str(num))
	if num == 0:
		playvermelho()
	elif num == 1:
		playverde()
	elif num == 2:
		playamarelo()
	elif num == 3:
		playazul()

func gerasequecia():

	if (estado == GERANDO):	
		sequenciaPC.append(int(rand_range(0,4)))
		sequenciaPC.append(int(rand_range(0,4)))
		sequenciaPC.append(int(rand_range(0,4)))
		sequenciaPC.append(int(rand_range(0,4)))
		
		for NumCorSequencia in sequenciaPC:
			print("NumCorSequencia:  "+str(NumCorSequencia))
			ValorSequencia = NumCorSequencia
			_thread = Thread.new()
			#_thread.start(self, "thread_playseq",ValorSequencia)
			_thread.wait_to_finish()

			
			#timerGeraSequencia.start()
			#if ExecutandoTimer == true:
			#	ValorSequencia = NumCorSequencia
			
			#playseq(ValorSequencia)
		estado = JOGANDO
		print("estado:  "+str(estado))
	if ((estado == JOGANDO) and (rodada <= sequenciaPC.size())):
		_thread.start(self, "thread_playseq",sequenciaPC[rodada])
		rodada +=1
		
	
func _on_timerGeraSequencia_timeout():
	bloqueia_botoes()
	gerasequecia()
	set_process_input(true)
	libera_botoes()	
	
func thread_playseq(userdata):
	print("entrou thread")
	print("valor :   " + str(userdata))
	playseq(userdata)