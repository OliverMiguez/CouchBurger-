extends Node2D

#Verifica que el tutorial se completara correctamente, para desbloquear el siguiente nivel
var verificación_tutorial = 0

#Para que el spawner verifique en que nivel estamos y spawnee objetos de manera personalizada
signal nivel_seleccionado(nivel:int)
var nivel_seleccionado_boton

##Botón que ejecuta el tutorial
func _on_tutorial_pressed():
	verificación_tutorial = 1
	Dialogic.start("res://Dialogic Plugin Extras/TimeLines/Tutorial.dtl")

##Script para activar el primer nivel
func _on_nivel_1_pressed():
	if verificación_tutorial == 1:
		nivel_seleccionado_boton = 1
		emit_signal("nivel_seleccionado",nivel_seleccionado_boton) #envia el valor del nivel obtenido
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")

#################################
##Verificar si el nivel 1 se ha superado para desbloquear nivel 2
#################################
