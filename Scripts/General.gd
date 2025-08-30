##Script General que administra las señales con los objetos y el jugador
extends Node

# señales que otros pueden emitir o escuchar
signal daño_recibido  
signal detectar_muerte

#Vidas totales del jugador
var vida := 3

##Quita una vida al jugador cuando recibe daño
func recibir_daño():
	vida -= 1
	emit_signal("daño_recibido") #Envia los nuevos datos de vida a la señal daño_recibido
	if vida <= 0 :
		muerte()
##Cuando el jugador no tiene vidas
func muerte():
		emit_signal("detectar_muerte") #Cuando el jugador no tiene vidas emite la señal de muerte
##Restablece la vida del jugador cada vez que se pierda y se pulse reiniciar
func reiniciar_vida():
	vida = 3
	
