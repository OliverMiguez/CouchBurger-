extends Node2D
class_name Gato

@export var speed = 300 # Velocidad a la que sube el obstaculo

func _ready(): 
	# Animaciones
	$AnimationPlayer.play("girar")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("girar")

func _process(delta):
	# Método que permite al obstáculo ascender
	position.y -= speed * delta
	# Elimina el objeto cuando llega al límite del mapa
	if position.y < -60:
		queue_free()
		#print("Objeto eliminado")

## Deteccion del Player
func _on_detección_body_entered(body):
	if body.has_method("player"):
		General.recibir_daño()
		queue_free()
