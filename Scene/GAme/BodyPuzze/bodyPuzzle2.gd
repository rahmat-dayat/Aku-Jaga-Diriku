extends Node2D


var wajah = false
var tkiri = false
var tkanan = false
var kaki = false
var total = 0
var next = 0
func _ready(): starting()

func starting():
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0,3),"timeout")
	$narasi.stream = preload("res://Asset/Body Puzzle/audio/Pasanglah_20Anggota_20Tubuh_20yang_20Ada_20Sesuai_20Dengan_20Posisinya.mp3")
	$narasi.play()
func _on_wajah_lepas():
	if wajah == true:
		$body/Panel/wajah.show()
		$piece/wajah.hide()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		selesai()
	else:
		total = 0
		MusicController.sfxSalah()
func _on_tkanan_lepas():
	if tkanan == true:
		$body/Panel/tkanan.show()
		$piece/tkanan.hide()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		selesai()
	else:
		total = 0
		MusicController.sfxSalah()
func _on_tkiri_lepas():
	if tkiri == true:
		$body/Panel/tkiri.show()	
		$piece/tkiri.hide()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		selesai()
	else:
		total = 0
		MusicController.sfxSalah()
func _on_kaki_lepas():
	if kaki == true:
		$body/Panel/kaki.show()
		$piece/kaki.hide()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		selesai()
	else:
		total = 0
		MusicController.sfxSalah()
# warning-ignore:unused_argument
func _on_wajah_area_entered(area):
	wajah = true
# warning-ignore:unused_argument
func _on_wajah_area_exited(area):
	wajah = false

	
# warning-ignore:unused_argument
func _on_tkanan_area_entered(area):
	tkanan = true
# warning-ignore:unused_argument
func _on_tkanan_area_exited(area):
	tkanan = false


# warning-ignore:unused_argument
func _on_tkiri_area_entered(area):
	tkiri = true	
# warning-ignore:unused_argument
func _on_tkiri_area_exited(area):
	tkanan = false

# warning-ignore:unused_argument
func _on_kaki_area_entered(area):
	kaki = true
# warning-ignore:unused_argument
func _on_kaki_area_exited(area):
	kaki = false


func hasilSfx():
	if total == 1:
		$hasil.stream = load("res://Asset/Body Puzzle/audio/Benar.mp3")
		$hasil.play()
	elif total == 2:
		$hasil.stream = load("res://Asset/Body Puzzle/audio/Hebat.mp3")
		$hasil.play()
	elif total == 3:
		$hasil.stream = load("res://Asset/Body Puzzle/audio/Mengagumkan.mp3")
		$hasil.play()
	elif total == 4:
		$hasil.stream = load("res://Asset/Body Puzzle/audio/Luar%20biasa.mp3")
		$hasil.play()

func selesai():
	if next == 4:
		yield(get_tree().create_timer(2),"timeout")
		$CanvasLayer/GUI.PopUP()


