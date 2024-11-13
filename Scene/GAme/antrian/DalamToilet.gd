extends Node2D


var toilet = false
var wastafel = false
var tisu = false
var sampah = false
func _ready():
	if Stat.boy == true:
		$Control/TextureRect.texture = load("res://Asset/antrian/Toilet Urinal.png")
	else:
		$Control/TextureRect.texture = load("res://Asset/antrian/Toilet Duduk.png")
	$Karakter.sprte.texture = Stat.sprite
	starting()
func starting():
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.3),"timeout")
	$narasi.stream = preload("res://Asset/antrian/audio/Gunakanlah_20Toilet.wav")
	$narasi.play()
	showing($Control/toilet)
	$CPUParticles2D.show()
func showing(target):
	$Tween.interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield(get_tree().create_timer(2.5),"timeout")
	$Tween.interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
# warning-ignore:unused_argument
func _on_toilet_area_entered(area):
	toilet = true
# warning-ignore:unused_argument
func _on_toilet_area_exited(area):
	toilet = false

# warning-ignore:unused_argument
func _on_wastafel_area_entered(area):
	wastafel = true
# warning-ignore:unused_argument
func _on_wastafel_area_exited(area):
	wastafel = false
	
	
# warning-ignore:unused_argument
func _on_tisu_area_entered(area):
	tisu = true
# warning-ignore:unused_argument
func _on_tisu_area_exited(area):
	tisu = false
	
	
# warning-ignore:unused_argument
func _on_tongSampah_area_entered(area):
	sampah = true
# warning-ignore:unused_argument
func _on_tongSampah_area_exited(area):
	sampah = false


func _on_Karakter_lepas():
	MusicController.sfxDop()
	if toilet == true:
		toilet = false
		$CPUParticles2D.hide()
		$Node2D/toilet/CollisionShape2D.set_deferred("disabled", true)
		$Karakter.currentPos = $Node2D/toilet.position
		$sfx.play()
		yield($sfx,"finished")
		$CPUParticles2D.position =  $Node2D/wastafel.position
		$CPUParticles2D.show()
		$narasi.stream = preload("res://Asset/antrian/audiodalamToilet/Ayo_20Cuci_20Tanganmu.mp3")
		$narasi.play()
		showing($Control/wastafel)
		$Node2D/wastafel/CollisionShape2D.set_deferred("disabled", false)
	elif wastafel == true:
		wastafel = false
		$CPUParticles2D.hide()
		$Node2D/wastafel/CollisionShape2D.set_deferred("disabled", true)
		$Karakter.currentPos = $Node2D/wastafel.position
		$sfx.stream = preload("res://Asset/antrian/audiodalamToilet/suara_20mengambil_20sabun.mp3")
		$sfx.play()
		yield($sfx,"finished")
		$sfx.stream = preload("res://Asset/antrian/audiodalamToilet/suara_20keran_20dan_20air.mp3")
		$sfx.play()
		yield($sfx,"finished")
		$CPUParticles2D.position =  $Node2D/tisu.position
		$CPUParticles2D.show()
		$narasi.stream = preload("res://Asset/antrian/audiodalamToilet/Keringkan_20Tangan_20Menggunakan_20Tisu.mp3")
		$narasi.play()
		showing($Control/tisu)
		$Node2D/tisu/CollisionShape2D.set_deferred("disabled", false)
	elif tisu == true:
		tisu = false
		$CPUParticles2D.hide()
		$sfx.volume_db = 5
		$Node2D/tisu/CollisionShape2D.set_deferred("disabled", true)
		$Karakter.currentPos = $Node2D/tisu.position
		$sfx.stream = preload("res://Asset/antrian/audiodalamToilet/suara_20ambil_20tisu.mp3")
		$sfx.play()
		yield(get_tree().create_timer(2),"timeout")
		$CPUParticles2D.position =  $Node2D/tongSampah.position
		$CPUParticles2D.show()
		$narasi.stream = preload("res://Asset/antrian/audiodalamToilet/Membuang_20Sampah_20ke_20Tempat_20Sampah.mp3")
		$narasi.play()
		showing($Control/sampah)
		$Node2D/tongSampah/CollisionShape2D.set_deferred("disabled", false)
	elif sampah == true:
		sampah = false
		$CPUParticles2D.hide()
		$Karakter.currentPos = $Node2D/tongSampah.position
		$Node2D/tongSampah/CollisionShape2D.set_deferred("disabled", true)
		$sfx.stream =preload("res://Asset/antrian/audiodalamToilet/membuang_20sampah.mp3")
		$sfx.play()
		yield(get_tree().create_timer(3),"timeout")
		$CanvasLayer/GUI.PopUP()
		
