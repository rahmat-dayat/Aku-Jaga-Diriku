extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func sedih():
	MusicController.sfxTegang()

func change():
	Transition.change_scene("res://Scene/animasi/scene17/scene17.tscn")
