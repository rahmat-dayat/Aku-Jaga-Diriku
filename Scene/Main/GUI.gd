extends Control



export var backScene : PackedScene
export var gameScene : PackedScene
export(bool)var  startTimer = false
var mainMenu = false
func _ready():
	if startTimer == true:
		timerStart()
		

	

func timerStart():
	Stat.detik = 0
	Stat.menit = 0
	Stat.TIMER.start()

func PopUP():
	$PopupScoreGame.show()
	get_tree().paused = true
	if Stat.menit >= 15:
		$PopupScoreGame/star/star5.hide()
		$PopupScoreGame/star/star4.hide()
		$PopupScoreGame/star/star3.hide()
		$PopupScoreGame/star/star2.hide()
		$PopupScoreGame/kalimat/Label.text = "Usahamu luar biasa, ayo coba lagi!"
		$PopupScoreGame/narasi.stream = load("res://Asset/audio/popUP/Usahamu%20Luar%20Biasa%2C%20Ayo%20Coba%20Lagi.mp3")
		$PopupScoreGame/narasi.play()
	elif Stat.menit >= 12:
		$PopupScoreGame/star/star5.hide()
		$PopupScoreGame/star/star4.hide()
		$PopupScoreGame/star/star3.hide()
		$PopupScoreGame/kalimat/Label.text ="Jangan menyerah, kamu pasti bisa!"
		$PopupScoreGame/narasi.stream = load("res://Asset/audio/popUP/Jangan%20Menyerah%2C%20Kamu%20Pasti%20Bisa.mp3")
		$PopupScoreGame/narasi.play()
		
	elif Stat.menit >= 10:
		$PopupScoreGame/star/star5.hide()
		$PopupScoreGame/star/star4.hide()
		$PopupScoreGame/kalimat/Label.text = "Kerja bagus, ayo tingkatkan lagi!"
		$PopupScoreGame/narasi.stream = load("res://Asset/audio/popUP/Kerja%20Bagus%2C%20Ayo%20Tingkatkan%20Lagi.mp3")
		$PopupScoreGame/narasi.play()
	elif Stat.menit > 5:
		$PopupScoreGame/star/star5.hide()
		$PopupScoreGame/kalimat/Label.text ="Hebat, kamu yang terbaik!"
		$PopupScoreGame/narasi.stream = load("res://Asset/audio/popUP/Hebat%2C%20Kamu%20yang%20Terbaik.mp3")
		$PopupScoreGame/narasi.play()
	elif Stat.menit <= 5 :
		$PopupScoreGame/kalimat/Label.text ="Selamat, kamu sungguh luar biasa!"
		$PopupScoreGame/narasi.stream = preload("res://Asset/audio/popUP/Selamat_2C_20Kamu_20Sungguh_20Luar_20Biasa.mp3")
		$PopupScoreGame/narasi.play()
		
	$PopupScoreGame/sfx.play()
	yield($PopupScoreGame/sfx,"finished")
	$PopupScoreGame/sfx.stream = preload("res://Asset/audio/popUP/tepuk_20tangan.mp3")
	$PopupScoreGame/sfx.play()	
func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	MusicController.sfxSoundcopy()
	get_tree().change_scene_to(backScene)


func _on_TextureButton3_pressed():
	MusicController.sfxSoundcopy()
	if $popUpCredit.visible == false:
		$popUpCredit.show()
	else:
		$popUpCredit.hide()


func _notification(what):
	
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# For Windows
		$Quit.show()
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST: 
		# For android
		if mainMenu == true:
			$Quit.show()
		else:
# warning-ignore:return_value_discarded
			get_tree().change_scene_to(backScene)






func _on_quit_pressed():
	MusicController.sfxSoundcopy()
	get_tree().quit()


func _on_batal_pressed():
	MusicController.sfxSoundcopy()
	$Quit.hide()


func _on_restart_pressed():
	MusicController.sfxSoundcopy()
	get_tree().paused = false
	Transition.change_scene_to(gameScene)


func _on_keluar_pressed():
	MusicController.sfxSoundcopy()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scene/Main/gameMenu.tscn")


func _on_Button_pressed():
	MusicController.sfxSoundcopy()
	$popUpCredit.hide()
