extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_pause_pressed():
	if $VideoPlayer.paused == false:
		$VideoPlayer.paused = true
		$pause.modulate = Color(1,1,1,1)
		$GUI.modulate = Color(1,1,1,1)
	else:
		$VideoPlayer.paused = false
		$pause.modulate = Color(1,1,1,0)
		$GUI.modulate = Color(1,1,1,0)


func _on_VideoPlayer_finished():
	MusicController.BGM.stream_paused = false
	Transition.change_scene("res://Scene/Main/MainMenu.tscn")
