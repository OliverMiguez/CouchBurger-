extends Node2D

#Verifica que el tutorial se completara correctamente, para desbloquear el siguiente nivel
var verificación_tutorial = 0

##Botón que ejecuta el tutorial
func _on_tutorial_pressed():
	verificación_tutorial = 1
	Dialogic.start("res://Dialogic Plugin Extras/TimeLines/Tutorial.dtl")

##Script para activar el primer nivel
func _on_nivel_1_pressed():
	if verificación_tutorial == 1:
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")
		
		
