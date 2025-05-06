extends CharacterBody3D


const SPEED = 20.0
const JUMP_VELOCITY = 34


func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var direction := (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 2 * delta
		if direction.y > 0 and velocity.y < 0:
			velocity.y += -direction.y * SPEED /10
		if direction.y < 0 and velocity.y < 0:
			velocity.y += -direction.y * SPEED /50

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# Transformamos las teclas presionadas o inputs a un vector:
									  #-x            +x        -y        +y     (y ignorada)

	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 7)

	
	var collided = move_and_slide()
