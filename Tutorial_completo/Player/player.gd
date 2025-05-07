class_name Player
extends CharacterBody3D


const SPEED = 17.0
const JUMP_VELOCITY = 34


func _physics_process(delta: float) -> void:
	# Transformamos las teclas presionadas o inputs a un vector:
									  #-x            +x        -y        +y
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	# efectos de gravedad.
	if not is_on_floor():
		velocity += get_gravity() * 2 * delta
		
		#si presiona hacia abajo (y+) se acelera la caida
		if direction.y > 0 and velocity.y < 0:
			velocity.y += -direction.y * SPEED / 10

		#si presiona hacia abajo (y-) se frena la caida
		if direction.y < 0 and velocity.y < 0:
			velocity.y += -direction.y * SPEED / 50

	# Salto, si se sostiene presionado saltas mas alto.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Al liberar la tecla, se frena al jugador, o si ya va lento, mantiene su velocidad
	if Input.is_action_just_released("ui_accept"):
		velocity.y = min(velocity.y, JUMP_VELOCITY / 2)

	# Manejar el movimiento horizontal
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 7)
		
	move_and_slide()
