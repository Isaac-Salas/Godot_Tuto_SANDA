extends Camera3D

@onready var player: CharacterBody3D = $"../Player"
@onready var center: Node3D = $"../Center"

func _process(delta: float) -> void:
	look_at(player.global_position * 0.1 + center.global_position)
