extends Node3D
@onready var label: Label = $Camera3D/UI/Label

#manejador de escena, matiene el conteo de score
var score = 0

#reinicia la escena
func reset():
	get_tree().reload_current_scene()

#agrega un punto
func add_point(points):
	score += points
	label.text=str("Score = ",score)
