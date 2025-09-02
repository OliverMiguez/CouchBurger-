##ESTE SCRIPT ES AUTOLOAD
extends Node2D
class_name SeleccionNiveles
#Verifica que el tutorial se completara correctamente, para desbloquear el siguiente nivel
var verificación_tutorial = 0
var nivel_seleccionado :int = 0 #<---- El Código del spawner recibe este valor en vez del nuevo
##Botón que ejecuta el tutorial
func _on_tutorial_pressed():
	SelecciónDeNiveles.verificación_tutorial = 1
	Dialogic.start("res://Dialogic Plugin Extras/TimeLines/Tutorial.dtl")
	print("Tutorial Superado")

##Script para activar el primer nivel
func _on_nivel_1_pressed():
	if SelecciónDeNiveles.verificación_tutorial == 1:
		SelecciónDeNiveles.nivel_seleccionado = 1
		print("Nivel seleccionado en el selector de niveles:",nivel_seleccionado)
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")

#################################
##Verificar si el nivel 1 se ha superado para desbloquear nivel 2
#################################
