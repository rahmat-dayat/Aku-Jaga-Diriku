extends Node2D


var pakaian = []
var pos = []
var baju = false
var celana = false

var bajuOBJ = null
var celanaOBJ = null
enum {
	boys,
	girl
}

var current = boys
func _ready():
	starting()
	randomize()
	current = pick_random_state([boys,girl])
	
	for i in $object.get_children():
		pakaian.append(i)
	for p in $position.get_children():
		pos.append(p)
	
	
	match current:
		boys:
			$Control/Panel/karakter.texture = load("res://Asset/dressUP/boys/Laki-laki Dress Up.png")
			$Control/Panel/celana.rect_position = Vector2(130, 232)
			$Control/Panel/baju.rect_position = Vector2(116, 153)
			$Control/Panel/celana.rect_size = Vector2(69, 59)
			$Control/Panel/baju.rect_size = Vector2(97, 89)
			$Control/Panel/gaun.hide()
			$object/baju1.boy = true
			$object/baju2.boy = true
			$object/baju3.boy = true
			$object/baju4.boy = true
			$object/baju5.boy = true
			$object/baju6.boy = false
			$object/baju7.boy = false
			$object/baju8.boy = false
		girl:
			$Control/Panel/karakter.texture = load("res://Asset/dressUP/girl/Perempuan Dress Up.png")
			$Control/Panel/celana.rect_position = Vector2(138, 230)
			$Control/Panel/baju.rect_position = Vector2(128, 143)
			$Control/Panel/celana.rect_size = Vector2(83, 59)
			$Control/Panel/baju.rect_size = Vector2(103, 89)
			$object/baju1.boy = false
			$object/baju2.boy = true
			$object/baju3.boy = true
			$object/baju4.boy = true
			$object/baju5.boy = false
			$object/baju6.boy = false
			$object/baju7.boy = false
			$object/baju8.boy = false
			
	randomPos()	
func randomPos():
	pos.shuffle()
	for i in pos.size():
		pakaian[i].currentPos = pos[i].position
		pakaian[i].move()
		pakaian[i].change()

func starting():
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.3),"timeout")
	$narasi.stream = preload("res://Asset/dressUP/Pilih_20Busana_20yang_20Sesuai_20Dengan_20Laki-laki_20Atau_20Perempuan.mp3")
	$narasi.play()
func _on_baju1_lepas():
	if baju == true:
		if current == boys:
			if $object/baju1.boy == true:
				$Control/Panel/baju.texture = $object/baju1.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju1.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju1.boy == false:
				$Control/Panel/baju.texture = $object/baju1.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				bajuOBJ = $object/baju1.pakaianNow
				MusicController.sfxTring()
			else:
				MusicController.sfxSalah()
func _on_baju2_lepas():
	if baju == true:
		if current == boys:
			if $object/baju2.boy == true:
				$Control/Panel/baju.texture = $object/baju2.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju2.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju2.boy == false:
				$Control/Panel/baju.texture = $object/baju2.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju2.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju3_lepas():
	if baju == true:
		if current == boys:
			if $object/baju3.boy == true:
				$Control/Panel/baju.texture = $object/baju3.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju3.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju3.boy == false:
				$Control/Panel/baju.texture = $object/baju3.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju3.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju4_lepas():
	if celana == true:
		if current == boys:
			if $object/baju4.boy == true:
				$Control/Panel/celana.texture = $object/baju4.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju4.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju4.boy == false:
				$Control/Panel/celana.texture = $object/baju4.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju4.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju5_lepas():
	if celana == true:
		if current == boys:
			if $object/baju5.boy == true:
				$Control/Panel/celana.texture = $object/baju5.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju5.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju5.boy == false:
				$Control/Panel/celana.texture = $object/baju5.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju5.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju6_lepas():
	if baju == true:
		if current == boys:
			if $object/baju6.boy == true:
				$Control/Panel/baju.texture = $object/baju6.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju6.boy == false:
				$Control/Panel/gaun.texture = $object/baju6.pakaianNow
				$Control/Panel/gaun.show()
				$Control/Panel/celana.hide()
				$Control/Panel/baju.hide()
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju6.pakaianNow
				celanaOBJ = $object/baju6.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju7_lepas():
	if baju == true:
		if current == boys:
			if $object/baju7.boy == true:
				$Control/Panel/baju.texture = $object/baju7.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju7.boy == false:
				$Control/Panel/gaun.texture = $object/baju7.pakaianNow
				$Control/Panel/gaun.show()
				$Control/Panel/celana.hide()
				$Control/Panel/baju.hide()
				$effect.emitting = true
				MusicController.sfxTring()
				bajuOBJ = $object/baju7.pakaianNow
				celanaOBJ = $object/baju7.pakaianNow
			else:
				MusicController.sfxSalah()
func _on_baju8_lepas():
	if celana == true:
		if current == boys:
			if $object/baju8.boy == true:
				$Control/Panel/celana.texture = $object/baju8.pakaianNow
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju8.pakaianNow
			else:
				MusicController.sfxSalah()
		elif current == girl:
			if $object/baju8.boy == false:
				$Control/Panel/celana.texture = $object/baju8.pakaianNow
				$Control/Panel/gaun.hide()
				$Control/Panel/celana.show()
				$Control/Panel/baju.show()
				$effect.emitting = true
				MusicController.sfxTring()
				celanaOBJ = $object/baju8.pakaianNow
			else:
				MusicController.sfxSalah()





# warning-ignore:unused_argument
func _on_baju_area_entered(area):
	baju = true
	
# warning-ignore:unused_argument
func _on_baju_area_exited(area):
	baju = false

# warning-ignore:unused_argument
func _on_celana_area_entered(area):
	celana = true
# warning-ignore:unused_argument
func _on_celana_area_exited(area):
	celana = false



func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()



func _on_submit_pressed():
	if bajuOBJ != null and celanaOBJ != null:
		$narasi.stream = preload("res://Asset/dressUP/Wah_2C_20Pilihan_20mu_20Bagus_20Sekali_2C_20Saya_20Suka_2C_20Terima_20Kasih.mp3")
		$narasi.play()
		$Control/submit.disabled = true
		yield($narasi,"finished")
		$CanvasLayer/GUI.PopUP()
		
	else:
		MusicController.sfxSalah()
