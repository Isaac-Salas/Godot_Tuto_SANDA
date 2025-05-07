extends Camera3D

@onready var player: CharacterBody3D = $"../Player"


func _process(delta: float) -> void:
	look_at((Vector3(player.global_position))*0.04 + Vector3(0,9,0))
