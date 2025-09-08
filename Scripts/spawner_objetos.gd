extends Node2D
class_name SpawnerObjetos

@export var obstacle_scenes: Array[PackedScene] # Escenas a spawnear
@export var spawn_interval: float = 1 # Intervalo inicial de spawn

@onready var tiempo_de_spawn = $Timer/TiempoDeSpawn
var timer_ticks_contador = 0

# Timers internos (solo para controlar dificultad)
var round := 0.0
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
			tiempo_de_spawn.wait_time = spawn_interval # empieza en 1
			tiempo_de_spawn.start()
		2:
			tiempo_de_spawn.wait_time = spawn_interval # también 0.7, puedes ajustarlo distinto
			tiempo_de_spawn.start()
		_:
			print("Nivel no válido:", nivel)

# ------------------ MANEJO DE DIFICULTAD ------------------
func _process(delta):
	var nivel = SelecciónDeNiveles.nivel_seleccionado
	# Velocidad a la que spawnean los objetos
	match nivel:
		1:
			round += delta
			if round >= 20:
				tiempo_de_spawn.wait_time = 1
				round = 0.0

		2:
			round += delta
			if round >= 10:
				tiempo_de_spawn.wait_time = 0.02
				round = 0.0

			dificil_dificil += delta
			if dificil_dificil >= 20:
				tiempo_de_spawn.wait_time = 0.01

# ------------------ TIMEOUT DEL TIMER ------------------
func _on_tiempo_de_spawn_timeout():
	var nivel = SelecciónDeNiveles.nivel_seleccionado
	match nivel:
		1:
			timer_ticks_contador += 1 # <-- No spawnea objetos cada segundo
			print("Contador:", timer_ticks_contador)
			match timer_ticks_contador:
				1:spawn_patron_1()
				2:spawn_patron_2()
				3:spawn_patron_3()
				4:spawn_patron_4()
				5:spawn_patron_5()
				6:spawn_patron_6()
				7:spawn_patron_7()
				8:spawn_patron_8()
				9:spawn_patron_9()
				10:spawn_patron_1()
				11:spawn_patron_2()
				12:spawn_patron_3()
				13:spawn_patron_4()
				14:spawn_patron_5()
				15:spawn_patron_6()
					
			
		2:
			spawn_obstacle()
 
# ------------------ SPAWNEO DE OBJETOS FUNCIONAMIENTO ------------------
func spawn_obstacle():
	if obstacle_scenes.size() == 0: 
		return

	var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs = scene.instantiate()
	add_child(obs)
	obs.position = Vector2(randi_range(0, 1152), 700)
# -------------------- SPAWNER DE OBJETOS -----------------
func spawn_pattern(posicion: Array):
	if obstacle_scenes == null: # Si no hay objetos en el array de obstáciulos
		return
	else:
		for pos in posicion:
			var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
			var obs = scene.instantiate()
			add_child(obs)
			obs.position = Vector2(pos, 700)
		
	

# ------------------ SPAWNEO DE OBJETOS NIVEL 1 ------------------

func spawn_patron_1():
	print("Patrón 1 lanzado")
	spawn_pattern([izquierda, derecha])

func spawn_patron_2():
	print("Patrón 2 lanzado")
	spawn_pattern([entre_medias_izquierda, entre_medias_derecha])

func spawn_patron_3():
	print("Patrón 3 lanzado")
	spawn_pattern([izquierda, derecha, entre_medias_izquierda, entre_medias_derecha])

func spawn_patron_4():
	print("Patrón 4 lanzado")
	spawn_pattern([centro_pantalla_x, izquierda, derecha])

func spawn_patron_5():
	print("Patrón 5 lanzado")
	spawn_pattern([izquierda, entre_medias_izquierda, centro_pantalla_x])

func spawn_patron_6():
	print("Patrón 6 lanzado")
	spawn_pattern([derecha, entre_medias_derecha, centro_pantalla_x])

func spawn_patron_7():
	print("Patrón 7 lanzado (rápido)")
	spawn_pattern([izquierda, derecha]) # patrón 1
	spawn_pattern([entre_medias_izquierda, entre_medias_derecha]) # patrón 2
	tiempo_de_spawn.wait_time = 0.3

func spawn_patron_8():
	print("Patrón 8 lanzado")
	spawn_pattern([izquierda, entre_medias_izquierda, centro_pantalla_x, entre_medias_derecha])

func spawn_patron_9():
	print("Patrón 9 lanzado")
	spawn_pattern([izquierda, entre_medias_izquierda, entre_medias_derecha, derecha])
# __________ PATRÓN SPAWNEO NIVEL 2 __________________________________
