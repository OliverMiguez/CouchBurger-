##Spawnea todos los objetos en la escena
extends Node2D
@export var obstacle_scenes: Array[PackedScene] #recoge todos los objetos a spawnear
@export var spawn_interval: float = 0.7 #Tiempo que tarda en spawnear al siguiente obstaculo
var timer := 0.0 #Timer que verifica el spawneo inicial
var dificil_round := 0.0 #Aumenta el indice del spawneo
var dificil_dificil := 0.0#Igual que dificil_round

func _ready():
	#señal recibida del selector de niveles con el dato del nivel seleccionado 
	SelecciónDeNiveles.nivel_seleccionado.connect(_on_nivel_seleccionado)

##Funcionamiento del spawneo de objetos
func _process(delta):
	#Primera ronda (creo que no deberia cambiarse)
	timer += delta #acumula el valor del tiempo que ocurre en cada frame(para saber cuando spawnear un nuevo objeto)
	#si el valor del timer supera al del spawneo automaticamente spawnea el objeto y se reinicia
	if timer >= spawn_interval:
		timer = 0
		spawn_obstacle()
		
	#A lo largo del juego, su progresión de spawneo
	dificil_round += delta
	if dificil_round >= 10:
		spawn_interval = 0.2
		dificil_round = 0.0
	
	dificil_dificil += delta
	if dificil_dificil >= 20:
		spawn_interval = 0.09

func spawn_obstacle():
	if obstacle_scenes.size() == 0:
		return  # por si no se asignaron escenas(en caso de estar vacío el array)
		##La función que ejecuta el RETURN es la de parar la función en este punto en caso de que el array estea vacío
		
	#Selecciona un objeto ramdon del array y lo spawnea en una posición aleatoira entre las seleccionadas
	var scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obs = scene.instantiate()
	add_child(obs)
	obs.position = Vector2(randi_range(0, 1152), 700)

func _on_nivel_seleccionado(nivel:int) -> void:
	print(nivel)
	
