extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func change():
	yield(get_tree().create_timer(1),"timeout")
	Transition.change_scene("res://Scene/Main/MainMenu.tscn")

func music():
	MusicController.BGM.volume_db = -15
	MusicController.sfxSedih()
