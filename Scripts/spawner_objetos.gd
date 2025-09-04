extends Node2D
class_name SpawnerObjetos

@export var obstacle_scenes: Array[PackedScene] # Escenas a spawnear
@export var spawn_interval: float = 0.7 # Intervalo inicial de spawn

@onready var tiempo_de_spawn: Timer = $Timer/TiempoDeSpawn

# Timers internos (solo para controlar dificultad)
var dificil_round := 0.0
var dificil_dificil := 0.0

# Posiciones de spawneo
var centro_pantalla_x = 576
var centro_pantalla_y = 600
var izquierda = 152
var derecha = 1000
var entre_medias_izquierda = 364
var entre_medias_derecha = 788

func _ready():
	# Configuramos el timer inicial según el nivel
	var nivel = SelecciónDeNiveles.nivel_seleccionado

	match nivel:
		1:
			tiempo_de_spawn.wait_time = spawn_interval # empieza en 0.7
			tiempo_de_spawn.start()
		2:
			tiempo_de_spawn.wait_time = spawn_interval # también 0.7, puedes ajustarlo distinto
			tiempo_de_spawn.start()
		_:
			print("Nivel no válido:", nivel)

# ------------------ MANEJO DE DIFICULTAD ------------------
func _process(delta):
	var nivel = SelecciónDeNiveles.nivel_seleccionado

	match nivel:
		1:
			dificil_round += delta
			if dificil_round >= 10:
				tiempo_de_spawn.wait_time = 0.2
				dificil_round = 0.0

			dificil_dificil += delta
			if dificil_dificil >= 20:
				tiempo_de_spawn.wait_time = 0.09

		2:
			dificil_round += delta
			if dificil_round >= 10:
				tiempo_de_spawn.wait_time = 0.02
				dificil_round = 0.0

			dificil_dificil += delta
			if dificil_dificil >= 20:
				tiempo_de_spawn.wait_time = 0.01

# ------------------ TIMEOUT DEL TIMER ------------------
func _on_tiempo_de_spawn_timeout():
	var nivel = SelecciónDeNiveles.nivel_seleccionado

	match nivel:
		1:
			spawn_patron_1()
		2:
			spawn_obstacle()

# ------------------ SPAWNEO DE OBJETOS ------------------
func spawn_obstacle():
	if obstacle_scenes.size() == 0: 
		return

	var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs = scene.instantiate()
	add_child(obs)
	obs.position = Vector2(randi_range(0, 1152), 700)

# ------------------ SPAWNEO DE OBJETOS NIVEL 1 ------------------
func spawn_patron_1():
	if obstacle_scenes.size() == 0:
		return
		
	# Ejemplo: spawnea 1 objeto a la izquierda y 1 a la derecha
	var objeto_izquierda_1 = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs_izquierda_1 = objeto_izquierda_1.instantiate()
	add_child(obs_izquierda_1)
	obs_izquierda_1.position = Vector2(izquierda, 700)
	
	var objeto_derecha_1 = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs_derecha_1 = objeto_derecha_1.instantiate()
	add_child(obs_derecha_1)
	obs_derecha_1.position = Vector2(derecha, 700)
