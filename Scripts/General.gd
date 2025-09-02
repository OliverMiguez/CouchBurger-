##Script General que administra las señales con los objetos y el jugador
extends Node

# señales que otros pueden emitir o escuchar
signal daño_recibido  
signal detectar_muerte

# Vidas totales del jugador
var vida := 3

## Función que permite quitar vida al Player cuando recibe daño
func recibir_daño():
	vida -= 1
	emit_signal("daño_recibido") # Envia los nuevos datos de vida a la señal daño_recibido
	if vida <= 0 :
		muerte()

## Función que se ejecuta cuando el Player no tiene vida
func muerte():
	emit_signal("detectar_muerte") # Cuando el jugador no tiene vidas emite la señal de muerte
	
## Función que reinicia la vida del player tras reiniciar ronda
func reiniciar_vida():
	vida = 3
