extends Node2D
class_name caida_libre

@onready var hamburguesa = $UI/Hamburguesa # Sprite Hamburguesa
@onready var contador = $Contador # Label que muestra el tiempo de ronda
@onready var timer_contador = $TimerContador # Contador que administra el tiempo total de ronda

var contador_hamburguesa = 0 # Administra los frames del sprite de la hamburguesa

func _ready():
	# LLama a las señales del script general para que cuando sean emitadas puedan ejecutarse
	General.daño_recibido.connect(_on_daño_recibido)
	General.detectar_muerte.connect(_on_muerte_detectada)

func _process(delta):
	contador.text = str(round(timer_contador.time_left)) # Muestra en cada momento el tiempo de la partida##Muestra en cada momento el tiempo de la partida

## Función que maneja el daño recibido por el jugador
func _on_daño_recibido():
	print("recibimos daño")
	hamburguesa.frame += 1 # Son 3 frames 0,1,2
	contador_hamburguesa += 1 
	if hamburguesa.frame == 1 and contador_hamburguesa == 3: # Elimina la hamburguesa cuando ya no tenga mas frames de la animación
		hamburguesa.queue_free()
		# Activar escena de muerte
		_on_muerte_detectada()

## Función que se ejecuta cuando el player muere
func _on_muerte_detectada():
	print("Muerto")
	get_tree().change_scene_to_file("res://Escenas/game_over.tscn")

## Cuando el tiempo de la ronda finaliza
func _on_timer_contador_timeout():
	print("Victoria")
	#Cambiar a la escena de Victoria
	
