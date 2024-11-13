extends Node2D

var girlImg = preload("res://Asset/Body Puzzle/girls/Perempuan TK.png")
var boyImg = preload("res://Asset/Body Puzzle/boy/Laki-laki TK.png")

var word
var currentWord

enum {
	boys,
	girls
}

var current = boys

onready var slot1 = $Control/Panel/word/word1
onready var slot2 = $Control/Panel/word/word2
onready var slot3 = $Control/Panel/word/word3
onready var slot4 = $Control/Panel/word/word4
onready var slot5 = $Control/Panel/word/word5
onready var slot6 = $Control/Panel/word/word6


var item1 = null
var item2 = null
var item1word
var item2word

var girlWord = ['v', 'a', 'g', 'i', 'n', 'a']
var boyWord = ['p', 'e', 'n', 'i', 's']
func _ready():
	MusicController.BGM.volume_db = -10
	starting()
	randomize()
	current = pick_random_state([boys, girls])
	match current:
		boys:
			slot1.word = boyWord[0]
			slot2.word = boyWord[1]
			slot3.word = boyWord[2]
			slot4.word = boyWord[3]
			slot5.word = boyWord[4]
			
			slot1.change()	
			slot2.change()
			slot3.change()
			slot4.change()
			slot5.change()
			
			$Control/TextureRect2.texture = boyImg
			slot6.hide()
			word = "penis"
			disable()
			yield(get_tree().create_timer(1),"timeout")
			able()
			$Control/submit.disabled = false
			boyWord.shuffle()
			slot1.word = boyWord[0]
			slot2.word = boyWord[1]
			slot3.word = boyWord[2]
			slot4.word = boyWord[3]
			slot5.word = boyWord[4]
			
			slot1.change()	
			slot2.change()
			slot3.change()
			slot4.change()
			slot5.change()
			
		girls:
			$Control/TextureRect2.texture = girlImg
			word = "vagina"
			disable()
			yield(get_tree().create_timer(1),"timeout")
			$Control/submit.disabled = false
			able()
			girlWord.shuffle()
			slot1.word = girlWord[1]
			slot2.word = girlWord[0]
			slot3.word = girlWord[2]
			slot4.word = girlWord[3]
			slot5.word = girlWord[4]
			slot6.word = girlWord[5]
			slot1.change()	
			slot2.change()
			slot3.change()
			slot4.change()
			slot5.change()
			slot6.change()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func starting():
	$narasi.play()
	yield($narasi,"finished")
	MusicController.sfxTring()
	$AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(0.5),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Susunlah_20Huruf_20di_20Bawah_20Ini_20Menjadi_20Kata_20yang_20Benar.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.2),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Teman-teman_20Semua_2C_20Ternyata_20Laki-laki_20dan_20Perempuan_20Itu_20Berbeda_20Lho.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.2),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Perempuan_20Memiliki_20Vagina_2C_20SedangkanLaki-laki_20Memiliki_20Penis.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.2),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Vagina_20Adalah_20Bagian_20Dari_20Alat_20Kelamin_20Perempuan_20yang_20Tertutupi_20Pakaian_20Dalam.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.2),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Sedangkan_2C_20Penis_20Adalah_20Bagian_20Dari_20Alat_20Kelamin_20Laki-laki_20yang_20Tertutupi_20Pakaian_20Dalam.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.2),"timeout")
	$narasi.stream = preload("res://Asset/BoysGirls/makingWord/audio/Teman-teman_20Harus_20Ingat_20Ya_2C_20Tidak_20Ada_20yang_20Boleh_20Menyentuh_20Alat_20Kelamin_20Kita.mp3")
	$narasi.play()
func _on_submit_pressed():
	MusicController.sfxSoundcopy()
	if current == girls:
		currentWord = slot1.word + slot2.word + slot3.word + slot4.word + slot5.word + slot6.word  
		if currentWord == word:
			$benar.play()
			yield($benar,"finished")
			MusicController.tring_next("res://Scene/GAme/BoysGirls/MakingWord/makingWord2.tscn")
		else:
			MusicController.sfxSalah()
			
	elif current == boys:
		currentWord = slot1.word + slot2.word + slot3.word + slot4.word + slot5.word
		if currentWord == word:
			$benar.play()
			yield($benar,"finished")
			MusicController.tring_next("res://Scene/GAme/BoysGirls/MakingWord/makingWord2.tscn")
		else:
			MusicController.sfxSalah()


func check(tujuan):
	if item1 == null:
		item1 = tujuan
		item1.disabled = true
		item1word = item1.word
		MusicController.sfxDop()
	elif item2 == null:
		item2 = tujuan
		item2.disabled = true
		item2word = item2.word
		MusicController.sfxDop()
		move()
		
func move():
	item1.word = item2word
	item2.word = item1word
	MusicController.sfxDop()
	masuk(item1)
	masuk(item2)
	
	yield($Tween,"tween_completed")
	hilang()
	keluar(item1)
	keluar(item2)
	item1.change()
	item2.change()
	item1.disabled = false
	item2.disabled = false
	MusicController.sfxDop()
	item1 = null
	item2 = null
	
	
	

	
func _on_word1_pressed():
	check(slot1)
	$Control/Slot1.show()
func _on_word2_pressed():
	check(slot2)
	$Control/Slot2.show()
func _on_word3_pressed():
	check(slot3)
	$Control/Slot3.show()
func _on_word4_pressed():
	check(slot4)
	$Control/Slot4.show()
func _on_word5_pressed():
	check(slot5)
	$Control/Slot5.show()
func _on_word6_pressed():
	check(slot6)
	$Control/Slot6.show()

func masuk(item):
	$Tween.interpolate_property(item, "rect_scale", Vector2(1, 1), Vector2(0, 0), 0.2, Tween.TRANS_BACK,Tween.EASE_OUT)
	$Tween.start()
	
func keluar(item):
	$Tween.interpolate_property(item, "rect_scale", Vector2(0, 0), Vector2(1, 1), 0.2, Tween.TRANS_BACK,Tween.EASE_OUT)
	$Tween.start()

func hilang():
	$Control/Slot1.hide()
	$Control/Slot2.hide()
	$Control/Slot3.hide()
	$Control/Slot4.hide()
	$Control/Slot5.hide()
	$Control/Slot6.hide()

func disable():
	slot1.disabled = true
	slot2.disabled = true
	slot3.disabled = true
	slot4.disabled = true
	slot5.disabled = true
	slot6.disabled = true
func able():
	slot1.disabled = false
	slot2.disabled = false
	slot3.disabled = false
	slot4.disabled = false
	slot5.disabled = false
	slot6.disabled = false
func pick_random_state(state_list):
	
	state_list.shuffle()
	return state_list.pop_front()




func _on_TextureButton_pressed():
	pass # Replace with function body.
