##Spawnea todos los objetos en la escena
extends Node2D
@export var obstacle_scenes: Array[PackedScene]
@export var spawn_interval: float = 0.7
var timer := 0.0
var dificil_round := 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_obstacle()
		
	dificil_round += delta
	if dificil_round >= 5:
		spawn_interval = 0.2

	
func spawn_obstacle():
	if obstacle_scenes.size() == 0:
		return  # por si no se asignaron escenas

	var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs = scene.instantiate()
	add_child(obs)
	obs.position = Vector2(randi_range(0, 1152), 700)
	
