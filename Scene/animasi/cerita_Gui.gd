extends Control
export (String, FILE , "*.tscn") var back_scene = ""
export (String, FILE , "*.tscn") var next_scene = ""

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureRect_pressed():
	Transition.change_scene(back_scene)


func _on_TextureRect2_pressed():
	Transition.change_scene("res://Scene/Main/MainMenu.tscn")


func _on_TextureRect3_pressed():
	Transition.change_scene(next_scene)
