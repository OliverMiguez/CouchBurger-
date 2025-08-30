##Clase del jugador que manejamos

extends CharacterBody2D
class_name Personaje

#velocidad de movimiento lateral
@export var speed: float = 400.0

func _physics_process(delta):
	var direction = 0 #para calcular los movimiento laterales
	#Scripts de movimientos
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1

	velocity.x = direction * speed
	velocity.y = 0  # si no hay gravedad

	move_and_slide()
	
func player():
	pass
