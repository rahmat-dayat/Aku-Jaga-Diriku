extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func change():
	Transition.change_scene("res://Scene/animasi/scene15/scene15.tscn")

func tegang():
	MusicController.sfxTegang()
