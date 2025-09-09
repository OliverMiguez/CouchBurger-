extends Node2D
class_name SeleccionNiveles

# Labels que indican el próximo nivel desbloqueado
@onready var label = $CanvasLayer/LabelsNiveles/Label
@onready var label_2 = $CanvasLayer/LabelsNiveles/Label2
@onready var label_3 = $CanvasLayer/LabelsNiveles/Label3
@onready var label_4 = $CanvasLayer/LabelsNiveles/Label4

var verificación_tutorial = 0 # Verifica que el tutorial se completara correctamente, para desbloquear el siguiente nivel
var verificacion_nivel_1 = 0
var nivel_seleccionado :int = 0 # Verificar en que nivel nos encontramos

## TUTORIAL
func _on_tutorial_pressed():
	SelecciónDeNiveles.verificación_tutorial = 1 # se utiliza de esta manera para guardarlo en el autoload
	Dialogic.start("res://Dialogic Plugin Extras/TimeLines/Tutorial.dtl")
	print("Tutorial Superado")
	if SelecciónDeNiveles.verificación_tutorial == 1: # Muestra un texto de que el nivel 1 está desbloqueado
		label.visible = true
		label_2.visible = false
		label_3.visible = false
		label_4.visible = false
		

## NIVEL 1
func _on_nivel_1_pressed():
	if SelecciónDeNiveles.verificación_tutorial == 1:
		verificacion_nivel_1 = 1 # verifica que el nivel 1 se ha superado
		SelecciónDeNiveles.nivel_seleccionado = 1# se utiliza de esta manera para guardarlo en el autoload y poder enviarlo a otros scripts
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")

#################################
##Verificar si el nivel 1 se ha superado para desbloquear nivel 2
#################################

## NIVEL 2
func _on_nivel_2_pressed():
	if SelecciónDeNiveles.verificación_tutorial == 1 and verificacion_nivel_1 == 1:
		SelecciónDeNiveles.nivel_seleccionado = 2
		get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
	else:
		Dialogic.start("res://Dialogic Plugin Extras/TimeLines/No_te_pasaste_el_anterior.dtl")
