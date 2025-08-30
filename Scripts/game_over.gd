extends Node2D



func _on_button_pressed():
	#Reinicia la vida del player a 3 cada vez que se pierda y se reinicie el juego
	General.reiniciar_vida()
	get_tree().change_scene_to_file("res://Escenas/caida_libre.tscn")
