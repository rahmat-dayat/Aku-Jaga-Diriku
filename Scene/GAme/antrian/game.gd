extends Control

var toiletLaki = false
var toiletPerempuan = false

var masukLaki = false
var masukPerempuan = false


var total = 0
func _on_boy1_lepas():
	if masukLaki == true:
		if toiletLaki == false:
			masukLaki = false
			toiletLaki = true
			MusicController.sfxDop()
			$Karakter/boy1.currentPos = $Node2D/laki.position
			masukToilet($Karakter/boy1, true)
		else:
			$AnimationPlayer.play("lakiNotice")
	elif masukPerempuan == true:
		MusicController.sfxSalah()
func _on_boy2_lepas():
	if masukLaki == true:
		if toiletLaki == false:
			masukLaki = false
			toiletLaki = true
			MusicController.sfxDop()
			$Karakter/boy2.currentPos = $Node2D/laki.position
			masukToilet($Karakter/boy2, true)
		else:
			$AnimationPlayer.play("lakiNotice")
	elif masukPerempuan == true:
		MusicController.sfxSalah()
func _on_boy3_lepas():
	if masukLaki == true:
		if toiletLaki == false:
			masukLaki = false
			toiletLaki = true
			MusicController.sfxDop()
			$Karakter/boy3.currentPos = $Node2D/laki.position
			masukToilet($Karakter/boy3, true)
		else:
			$AnimationPlayer.play("lakiNotice")
	elif masukPerempuan == true:
		MusicController.sfxSalah()


func _on_girl1_lepas():
	if masukPerempuan == true:
		if toiletPerempuan == false:
			masukPerempuan = false
			toiletPerempuan = true
			MusicController.sfxDop()
			$Karakter/girl1.currentPos = $Node2D/prempuan.position
			masukToilet($Karakter/girl1)
		else:
			$AnimationPlayer.play("girlNotice")
	elif masukLaki == true:
		MusicController.sfxSalah()
func _on_girl2_lepas():
	if masukPerempuan == true:
		if toiletPerempuan == false:
			masukPerempuan = false
			toiletPerempuan = true
			MusicController.sfxDop()
			$Karakter/girl2.currentPos = $Node2D/prempuan.position
			masukToilet($Karakter/girl2)
		else:
			$AnimationPlayer.play("girlNotice")
	elif masukLaki == true:
		MusicController.sfxSalah()





# warning-ignore:unused_argument
func _on_laki_area_entered(area):
	masukLaki = true
# warning-ignore:unused_argument
func _on_laki_area_exited(area):
	masukLaki = false

# warning-ignore:unused_argument
func _on_prempuan_area_entered(area):
	masukPerempuan = true
# warning-ignore:unused_argument
func _on_prempuan_area_exited(area):
	masukPerempuan = false

func masukToilet(target, boy = false):
	target.disabled()
	if total <  4:
		yield(get_tree().create_timer(0.3),"timeout")
		
		total += 1
		$masuk.play()
		$Tween.interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween,"tween_completed")
		target.senang()
		yield(get_tree().create_timer(3.5),"timeout")
		
		$masuk.play()
		if boy == false:
			toiletPerempuan = false
		else:
			toiletLaki  = false
		$Tween.interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield(get_tree().create_timer(0.8),"timeout")
		if boy == false:
			$Tween.interpolate_property(target, "position", $Node2D/prempuan.position , $Node2D/posPerempuan.position, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
			$Tween.start()
		else:
			$Tween.interpolate_property(target, "position", $Node2D/laki.position , $Node2D/posLaki.position, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
			$Tween.start()
	elif total == 4:
		yield(get_tree().create_timer(0.3),"timeout")
		$masuk.play()
		target.senang()
		Stat.boy = boy
		Stat.sprite = target.sprte.texture
		$Tween.interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		
		yield($Tween,"tween_completed")
		
		Transition.change_scene("res://Scene/GAme/antrian/DalamToilet.tscn")
	
