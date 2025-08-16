extends Node3D
class_name LevelManager
@onready var label: Label = $Camera3D/UI/Label
@export var Obstaculos : Node3D

#manejador de escena, matiene el conteo de score
var score = 0

#conectamos la señal de los obstaculos a la funcion de agregar puntos y reinicio
func _ready() -> void:
	if Obstaculos != null:
		var obstaculos_array : Array = Obstaculos.get_children()
		for obstaculos in obstaculos_array:
			if obstaculos is Obstaculo:
				#print(obstaculos)
				obstaculos.deSpawn.connect(add_point)
				obstaculos.gameOver.connect(reset)


#reinicia la escena
func reset():
	get_tree().call_deferred("reload_current_scene")

#agrega un punto
func add_point(points):
	#print("Entering Points!!!")
	score += points
	label.text=str("Score = ",score)
