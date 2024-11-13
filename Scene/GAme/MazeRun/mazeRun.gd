extends Control


var narasiSoal
var pilihanA
var pilihanB

var guru = false
var dokter = false
var orangAsing = false
var orangTua = false

var panelA 
var panelB

enum {
	guruState,
	orangAState,
	orangTuaState,
	dokterState
}
var current = guruState

var pilihan = 0

func _ready():
	panelA = $Control/QUIZ/jawabanA.rect_position
	panelB = $Control/QUIZ/jawabanB.rect_position
	$starting.play()
func stateJawaban():
	match current:
		# 0 = A // 1 = B
		guruState:
			if pilihan == 0:
				disappear($Control/QUIZ)
				
				$Benar.play()
				MusicController.sfxTring()
			elif pilihan == 1:
				disappear($Control/QUIZ)
				MusicController.sfxSalah()
				$salah.play()
				reset()
		orangAState:
			if pilihan == 1:
				disappear($Control/QUIZ)
				
				$Benar.play()
				MusicController.sfxTring()
			elif pilihan == 0:
				disappear($Control/QUIZ)
				MusicController.sfxSalah()
				$salah.play()
				reset()
		orangTuaState:
			if pilihan == 0:
				disappear($Control/QUIZ)
			
				$Benar.play()
				MusicController.sfxTring()
			elif pilihan == 1:
				disappear($Control/QUIZ)
				MusicController.sfxSalah()
				$salah.play()
				reset()
		dokterState:
			if pilihan == 1:
				disappear($Control/QUIZ)
				
				$Benar.play()
				MusicController.sfxTring()
			elif pilihan == 0:
				disappear($Control/QUIZ)
				MusicController.sfxSalah()
				$salah.play()
				reset()
			

		
func appear(lokasi):
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()
	
func disappear(lokasi):
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(1,1), Vector2(0, 0), 0.5, Tween.TRANS_BACK, Tween.TRANS_LINEAR)  
	$Tween.start()
	yield($Tween,"tween_completed")
	$Navigation2D.soal_on = false
	$Control/QUIZ/jawabanA.rect_scale = Vector2(0,0)
	$Control/QUIZ/jawabanB.rect_scale = Vector2(0,0)
# warning-ignore:unused_argument
func _on_guru_body_entered(body):
	if guru == false:
		current = guruState
		guru = true
		$Control/QUIZ/kalimatSoal/label.text = "jika di sekolah kita bertemu orang asing yang mencurigakan, apa yang harus kita lakukan?"
		$soal.stream = preload("res://Asset/goodTouch/audio/_5B_20_5D_20Jika_20di_20sekolah_20kita_20bertemu_20orang_20asing_20yang_20mencurigakan_2C_20apa_20yang_20harus_20kita_20lakukan_1.mp3")
		pilihanA = preload("res://Asset/MazeRun/jawaban/A._20Lari_20dan_20beritahu_20guru_2.mp3")
		pilihanB = preload("res://Asset/MazeRun/jawaban/b._20mendekati_20orang_20asing_20tersebut_6.mp3")
		$Control/QUIZ/jawabanA/label.text = "A. Lari dan beritahu guru"
		$Control/QUIZ/jawabanB/label.text = "B. Mendekati orang asing tersebut"
		appear($Control/QUIZ)
		$Navigation2D.soal_on = true
		$Navigation2D.set_process(false)
		suaraQuiz(pilihanA, pilihanB)

# warning-ignore:unused_argument
func _on_orangA_body_entered(body):
	if orangAsing == false:
		$Control/QUIZ/jawabanA.rect_position = panelB
		$Control/QUIZ/jawabanB.rect_position = panelA
		current = orangAState
		orangAsing = true
		$Control/QUIZ/kalimatSoal/label.text = "Apa yang harus kita lakukan saat orang asing ingin menyentuh kita"
		$soal.stream = preload("res://Asset/goodTouch/audio/Apa_20yang_20harus_20kita_20lakukan_20saat_20orang_20asing.mp3")
		pilihanA = preload("res://Asset/MazeRun/jawaban/a._20membiarkan_2.mp3")
		pilihanB = preload("res://Asset/MazeRun/jawaban/B._20Menolak_20dan_20lari_2.mp3")
		$Control/QUIZ/jawabanA/label.text = "B. Menolak dan Lari"
		$Control/QUIZ/jawabanB/label.text = "A. Membiarkan"
		appear($Control/QUIZ)
		$Navigation2D.soal_on = true
		$Navigation2D.set_process(false)
		suaraQuiz(pilihanA, pilihanB, true)
# warning-ignore:unused_argument
func _on_orangTua_body_entered(body):
	if orangTua == false:
		$Control/QUIZ/jawabanA.rect_position = panelA
		$Control/QUIZ/jawabanB.rect_position = panelB
		current = orangTuaState
		orangTua = true
		$Control/QUIZ/kalimatSoal/label.text ="Jika bertemu orang asing mencurigakan, siapa yang harus kita harus beritahu?"
		$soal.stream = preload("res://Asset/goodTouch/audio/[ ] Jika bertemu orang asing mencurigakan, siapa yang harus kita beritahu_1 (1).mp3")
		pilihanA = preload("res://Asset/MazeRun/jawaban/A._20Orangtua_20atau_20dokter_2.mp3")
		pilihanB = preload("res://Asset/MazeRun/jawaban/(Dipakek)_20b._20tidak_20ada_202_2.mp3")
		$Control/QUIZ/jawabanA/label.text = "A. Orang Tua"
		$Control/QUIZ/jawabanB/label.text = "B. Tidak ada"
		appear($Control/QUIZ)
		$Navigation2D.soal_on = true
		$Navigation2D.set_process(false)
		suaraQuiz(pilihanA, pilihanB)
# warning-ignore:unused_argument
func _on_Dokter_body_entered(body):
	if dokter == false:
		$Control/QUIZ/jawabanA.rect_position = panelB
		$Control/QUIZ/jawabanB.rect_position = panelA
		current = dokterState
		dokter = true
		$Control/QUIZ/kalimatSoal/label.text ="Apakah dokter boleh menyentuh bagian privasi kita jika diperlukan"
		$soal.stream = preload("res://Asset/goodTouch/audio/Apakah_20dokter_20boleh_20menyentuh.mp3")
		pilihanA = preload("res://Asset/MazeRun/jawaban/a._20tidak_20boleh_2.mp3")
		pilihanB = preload("res://Asset/MazeRun/jawaban/b._20boleh_20(Dipakek)_2.mp3")
		$Control/QUIZ/jawabanA/label.text = "B. Boleh"
		$Control/QUIZ/jawabanB/label.text = "A. Tidak Boleh"
		appear($Control/QUIZ)
		$Navigation2D.soal_on = true
		$Navigation2D.set_process(false)
		suaraQuiz(pilihanA, pilihanB, true)

func suaraQuiz(A, B , dibalik = false ):
	if dibalik == false:
		$Control/QUIZ/ButtonA.disabled = true
		$Control/QUIZ/ButtonB.disabled = true
		$soal.play()
		yield($soal,"finished")
		yield(get_tree().create_timer(0.5),"timeout")
		appear($Control/QUIZ/jawabanA)
		$jawaban.stream = A
		$jawaban.play()
		yield($jawaban,"finished")
		appear($Control/QUIZ/jawabanB)
		$jawaban.stream = B
		$jawaban.play()
		yield($jawaban,"finished")
		$Control/QUIZ/ButtonA.disabled = false
		$Control/QUIZ/ButtonB.disabled = false
	else:
		$Control/QUIZ/ButtonA.disabled = true
		$Control/QUIZ/ButtonB.disabled = true
		$soal.play()
		yield($soal,"finished")
		yield(get_tree().create_timer(0.5),"timeout")
		appear($Control/QUIZ/jawabanB)
		$jawaban.stream = A
		$jawaban.play()
		yield($jawaban,"finished")
		appear($Control/QUIZ/jawabanA)
		$jawaban.stream = B
		$jawaban.play()
		yield($jawaban,"finished")
		$Control/QUIZ/ButtonA.disabled = false
		$Control/QUIZ/ButtonB.disabled = false
func reset():
	$Navigation2D/KinematicBody2D.position = Vector2(1056, 647)
	guru = false
	dokter = false
	orangAsing = false
	orangTua = false
	


func _on_ButtonA_pressed():
	pilihan = 0
	stateJawaban()
	$Control/QUIZ/ButtonA.disabled = true
	$Control/QUIZ/ButtonB.disabled = true
func _on_ButtonB_pressed():
	pilihan = 1
	stateJawaban()
	$Control/QUIZ/ButtonA.disabled = true
	$Control/QUIZ/ButtonB.disabled = true


# warning-ignore:unused_argument
func _on_finish_body_entered(body):
	
	$CanvasLayer/GUI.PopUP()
