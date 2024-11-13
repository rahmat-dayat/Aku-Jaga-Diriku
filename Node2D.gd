extends Node2D

func _ready():
	pass


func _on_Button_pressed():
	MusicController.BGM.stream_paused = true
	Transition.change_scene("res://video.tscn")
	
