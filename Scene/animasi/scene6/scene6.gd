extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next():
	Transition.change_scene("res://Scene/animasi/scene7_8/scene7.tscn")
