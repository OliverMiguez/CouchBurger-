extends Node2D
class_name SpawnerObjetos

@export var obstacle_scenes: Array[PackedScene] # Escenas a spawnear
@export var spawn_interval: float = 0.7 # Intervalo inicial de spawn

# Timers internos
var timer := 0.0
var dificil_round := 0.0
var dificil_dificil := 0.0

func _ready():
	# Reiniciar timers cada vez que se carga la escena
	timer = 0.0
	dificil_round = 0.0
	dificil_dificil = 0.0

func _process(delta):
	var nivel = SelecciónDeNiveles.nivel_seleccionado  # Leer siempre el Autoload/Global de selección de niveles

	if nivel == 0 or nivel == null:
		# Nivel no seleccionado
		print("Nivel actual:", nivel)
		return

	match nivel:
		1:
			spawn_level_1(delta)
		2:
			spawn_level_2(delta)
		_:
			# Otros niveles futuros
			pass

# ------------------ NIVEL 1 ------------------
func spawn_level_1(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_obstacle()

	dificil_round += delta
	if dificil_round >= 10:
		spawn_interval = 0.2
		dificil_round = 0.0

	dificil_dificil += delta
	if dificil_dificil >= 20:
		spawn_interval = 0.09

# ------------------ NIVEL 2 ------------------
func spawn_level_2(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_obstacle()

	dificil_round += delta
	if dificil_round >= 10:
		spawn_interval = 0.02
		dificil_round = 0.0

	dificil_dificil += delta
	if dificil_dificil >= 20:
		spawn_interval = 0.01

# ------------------ SPAWNEO DE OBJETOS ------------------
func spawn_obstacle():
	if obstacle_scenes.size() == 0:
		return

	var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs = scene.instantiate()
	add_child(obs)
	obs.position = Vector2(randi_range(0, 1152), 700)
