extends Node2D


func _ready():
	MusicController.BGM.volume_db = -10
	$CanvasLayer/GUI.timerStart()

func tring():
	MusicController.sfxTring()


func _on_Button_pressed():
	tring()
	$AnimationPlayer2.play("skip")
	$start/Button.disabled = true

func penjelasan2():
	$penjelasan.stream = preload("res://Asset/antrian/audio/Pilihlah_20Toilet_20yang_20Sesuai_20Dengan_20Gender_20Karakter.mp3")
	$penjelasan.play()
	
