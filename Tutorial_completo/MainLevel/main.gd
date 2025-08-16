extends Node3D
class_name LevelManager
@onready var label: Label = $Camera3D/UI/Label
@export var Obstaculos : Node3D

#manejador de escena, matiene el conteo de score
var score = 0


func _ready() -> void:
	if Obstaculos != null:
		var obstaculos_array : Array = Obstaculos.get_children()
		for obstaculos in obstaculos_array:
			if obstaculos is Obstaculo:
				print(obstaculos)
				obstaculos.deSpawn.connect(add_point)


#reinicia la escena
func reset():
	get_tree().reload_current_scene()

#agrega un punto
func add_point(points):
	print("Entering Points!!!")
	score += points
	label.text=str("Score = ",score)
