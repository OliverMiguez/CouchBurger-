extends Node2D
class_name MenuInicial

## Función que ejecuta el botón "Play" del Menu
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/selección_de_niveles.tscn")

## Función que cierra el juego
func _on_exit_pressed():
	get_tree().quit() #cierra el juego
