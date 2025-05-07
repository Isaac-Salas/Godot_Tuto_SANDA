extends Area3D
signal gameOver
@export var speed : float = 5

func _ready() -> void:
	global_position.x += randf_range(-8.5, 8.5)
	global_position.z -= 15
	
func _on_body_entered(body: Player) -> void:
	if body is Player:
		gameOver.emit()

func _physics_process(delta: float) -> void:
	global_position.z += speed * delta
	if global_position.z > 4:
		_ready()
