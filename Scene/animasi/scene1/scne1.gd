extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.BGM.volume_db = -15

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_narasi_finished():
	yield(get_tree().create_timer(0.5),"timeout")
	Transition.change_scene("res://Scene/animasi/scene2/scene2.tscn")
