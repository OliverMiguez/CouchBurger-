extends Node2D

#Velocidad a la que sube el obstaculo
@export var speed = 300



func _ready(): 
	#Animaciones
	$AnimationPlayer.play("girar")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("girar")

##Se ejecuta en cada frame
func _process(delta):
	#hace que el objeto ascienda
	position.y -= speed * delta
	#Elimina el objeto cuando llega al limite del mapa
	if position.y < -60:
		queue_free()
		print("Objeto eliminado")
	
##Deteccion del Player
func _on_detección_body_entered(body):
	if body.has_method("player"):
		General.recibir_daño()
		queue_free()
		
	
