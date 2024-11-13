extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.resetSound()
	yield(get_tree().create_timer(0.2),"timeout")
	appear($CenterContainer/bodyPuzzle)
	yield(get_tree().create_timer(0.3),"timeout")
	appear($"CenterContainer/by&girl")
	yield(get_tree().create_timer(0.3),"timeout")
	appear($CenterContainer/goodTouch)
	yield(get_tree().create_timer(0.2),"timeout")
	$AnimationPlayer.play("New Anim")
	$CenterContainer/bodyPuzzle.disabled = false
	$"CenterContainer/by&girl".disabled = false
	$CenterContainer/goodTouch.disabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_permainanButton_pressed():
	Transition.change_scene("res://Scene/Main/gameMenu.tscn")
	
func appear(lokasi):
	
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()



func _on_bodyPuzzle_pressed():
	disabled()
	MusicController.tring_next("res://Scene/GAme/BodyPuzze/bodyPuzzle.tscn")
	

func _on_bygirl_pressed():
# warning-ignore:return_value_discarded
	disabled()
	MusicController.sfxSound("res://Scene/GAme/BoysGirls/BoysGirls.tscn")



func _on_goodTouch_pressed():
	disabled()
	MusicController.tring_next("res://Scene/GAme/goodTouch/goodTouch.tscn")
	
func disabled():
	$CenterContainer/bodyPuzzle.disabled = true
	$"CenterContainer/by&girl".disabled = true
	$CenterContainer/goodTouch.disabled = true
