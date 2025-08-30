##Escena de caida libre
extends Node2D
class_name caida_libre
@onready var hamburguesa = $UI/Hamburguesa

#Cuando el frame de la hamburguesa sea mayor a 2 la elimina
var contador_hamburguesa = 0

func _ready():
	#LLama a las señales del script general para que cuando sean emitadas puedan ejecutarse
	General.daño_recibido.connect(_on_daño_recibido)
	General.detectar_muerte.connect(_on_muerte_detectada)
	
##Función que muestra lo que pasa cuando el player recibe daño
func _on_daño_recibido():
	print("recibimos daño")
	hamburguesa.frame += 1
	contador_hamburguesa += 1
	if hamburguesa.frame == 2 and contador_hamburguesa == 3:
		hamburguesa.queue_free()
##Función que muestra lo que pasa cuando el player muere
func _on_muerte_detectada():
	print("Muerto")
