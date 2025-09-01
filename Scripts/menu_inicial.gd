extends Node2D

var nivel_seleccionado


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/selección_de_niveles.tscn")#Va al menu de selección de niveles

func _on_exit_pressed():
	get_tree().quit() #cierra el juego
