extends Node2D
class_name  Victoria

func _ready():
	pass

func _on_niveles_pressed():
	get_tree().change_scene_to_file("res://Escenas/selección_de_niveles.tscn")
