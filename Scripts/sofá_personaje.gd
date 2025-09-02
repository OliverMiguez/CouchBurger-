extends CharacterBody2D
class_name Personaje

@export var speed: float = 400.0 # velocidad de movimiento lateral

func _physics_process(delta):
	var direction = 0 # Propiedad para calcular los movimiento laterales
	# Scripts de movimientos
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1

	velocity.x = direction * speed # Velocidad de movimiento del player 
	velocity.y = 0  # si no hay gravedad

	move_and_slide() # Permite el movimiento del player

## Función para llamar al player en otras escenas
func player():
	pass
