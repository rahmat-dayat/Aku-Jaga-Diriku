extends Control

var maxLoading = 100
var loading = 0
var chane = false
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	loading += 1
	if loading >= 100:
		loading = 100
		if chane == false:
			chane = true
			change()
	$ColorRect/bar.rect_size.x = 565 * loading / maxLoading
	
func change():

		Transition.change_scene("res://Scene/Main/MainMenu.tscn")
