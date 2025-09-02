extends Node2D
class_name SeleccionNiveles


var verificación_tutorial = 0 # Verifica que el tutorial se completara correctamente, para desbloquear el siguiente nivel
var nivel_seleccionado :int = 0 # Verificar en que nivel nos encontramos

## TUTORIAL
func _on_tutorial_pressed():
	SelecciónDeNiveles.verificación_tutorial = 1 # se utiliza de esta manera para guardarlo en el autoload
	Dialogic.start("res://Dialogic Plugin Extras/TimeLines/Tutorial.dtl")
	print("Tutorial Superado")

## NIVEL 1
func _on_nivel_1_pressed():
	if SelecciónDeNiveles.verificación_tutorial == 1:
		SelecciónDeNiveles.nivel_seleccionado = 1# se utiliza de esta manera para guardarlo en el autoload y poder enviarlo a otros scripts
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")

#################################
##Verificar si el nivel 1 se ha superado para desbloquear nivel 2
#################################

## NIVEL 2
func _on_nivel_2_pressed():
	if SelecciónDeNiveles.verificación_tutorial == 1:
		SelecciónDeNiveles.nivel_seleccionado = 2
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")
