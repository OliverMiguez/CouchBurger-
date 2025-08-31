extends CharacterBody2D

@export var speed: float = 200.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var dir := Vector2.ZERO

	# Movimiento según input
	if Input.is_action_pressed("ui_up"):
		dir.y = -1
		anim.play("Arriba")
	elif Input.is_action_pressed("ui_down"):
		dir.y = 1
		anim.play("Lado")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		dir.x = 1
		anim.play("Lado")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		dir.x = -1
		anim.play("Lado")
		anim.flip_h = true
	else:
		anim.play("Idle")

	# Normalizar y aplicar movimiento
	dir = dir.normalized()
	velocity = dir * speed
	move_and_slide()
