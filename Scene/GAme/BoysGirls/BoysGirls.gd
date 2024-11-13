extends Control

export var scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.resetSound()
	yield(get_tree().create_timer(0.2),"timeout")
	appear($Panel/TextureButton)
	yield(get_tree().create_timer(0.2),"timeout")
	appear($Panel/TextureButton2)
	yield(get_tree().create_timer(0.2),"timeout")
	$AnimationPlayer.play("appera")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	disabled()
	MusicController.tring_next("res://Scene/GAme/BoysGirls/MakingWord/makingWord1.tscn")


func _on_TextureButton2_pressed():
	disabled()
	MusicController.tring_next("res://Scene/GAme/antrian/antrianToilet.tscn")

func appear(lokasi):
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()

func disabled():
	
	$Panel/TextureButton.disabled = true
	$Panel/TextureButton2.disabled = true
