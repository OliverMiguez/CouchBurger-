##Escena de caida libre
extends Node2D
class_name caida_libre

func _ready():
	#LLama a las señales del script general para que cuando sean emitadas puedan ejecutarse
	General.daño_recibido.connect(_on_daño_recibido)
	General.detectar_muerte.connect(_on_muerte_detectada)
	
##Función que muestra lo que pasa cuando el player recibe daño
func _on_daño_recibido():
	print("recibimos daño")
##Función que muestra lo que pasa cuando el player muere
func _on_muerte_detectada():
	print("Muerto")
