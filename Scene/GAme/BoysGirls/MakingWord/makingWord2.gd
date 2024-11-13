extends Node2D

enum {
	boys,
	girls
}


var boysIMG = preload("res://Asset/Body Puzzle/boy/Laki-laki TK.png")
var girlsIMG =preload("res://Asset/Body Puzzle/girls/Perempuan TK.png")
var word
var current = girls
var currentWord

var slot1 = false
var slot2 = false
var slot3 = false
var slot4 = false
var slot5 = false
var slot6 = false


var slot1item = null
var slot2item = null
var slot3item = null
var slot4item = null
var slot5item = null
var slot6item = null

onready var pos1 = $position/pos1.position
onready var pos2 = $position/pos2.position
onready var pos3 = $position/pos3.position
onready var pos4 = $position/pos4.position
onready var pos5 = $position/pos5.position
onready var pos6 = $position/pos6.position

onready var wordE = $word/E
onready var wordA = $word/A
onready var wordP = $word/P
onready var wordS = $word/S
onready var wordA2 = $word/A2
onready var wordI = $word/I
onready var wordV = $word/V
onready var wordN = $word/N
onready var wordG = $word/G




var startPos = []
var words=[]
func _ready():
	
	randomize()
	for i in $startWord.get_children():
		startPos.append(i)
	for i in $word.get_children():
		words.append(i)
	

	randomPos()
	current = pick_random_state([boys, girls])
	match current:
		boys:
			word = "penis"
			$Control/TextureRect2.texture = boysIMG
			$Control/Panel/GridContainer/slot6.hide()
			$position/pos6/slot6/CollisionShape2D.set_deferred("disabled", true)
		girls:
			word = "vagina"
			$Control/TextureRect2.texture = girlsIMG
			




func _on_Submit_pressed():
	MusicController.sfxSoundcopy()
	if current == girls:
		if slot1item and slot2item and slot3item and slot4item and slot5item and slot6item != null:
			currentWord = slot1item.value + slot2item.value + slot3item.value + slot4item.value + slot5item.value + slot6item.value
			if currentWord == word:
				$benar.play()
				yield($benar,"finished")
				MusicController.tring_next("res://Scene/GAme/BoysGirls/DressUp/DressUp.tscn")
			else:
				MusicController.sfxSalah()
				reset()	
				$cobaLagi.play()
				
		else:
			MusicController.sfxSalah()
			reset()	
	
	elif current == boys:
		if slot1item and slot2item and slot3item and slot4item and slot5item  != null:
			currentWord = slot1item.value + slot2item.value + slot3item.value + slot4item.value + slot5item.value
			if currentWord == word:
				$benar.play()
				yield($benar,"finished")
				MusicController.tring_next("res://Scene/GAme/BoysGirls/DressUp/DressUp.tscn")
			else:
				MusicController.sfxSalah()
				$cobaLagi.play()
				reset()
				
		else:
			MusicController.sfxSalah()
			reset()	

# warning-ignore:unused_argument
func _on_slot1_body_entered(body):
	
	slot1 = true
			
# warning-ignore:unused_argument
func _on_slot2_body_entered(body):
	
	slot2 = true
	
# warning-ignore:unused_argument
func _on_slot3_body_entered(body):
	slot3 = true
	
	
# warning-ignore:unused_argument
func _on_slot4_body_entered(body):
	slot4 = true
	
# warning-ignore:unused_argument
func _on_slot5_body_entered(body):
	slot5 = true
	
# warning-ignore:unused_argument
func _on_slot6_body_entered(body):
	slot6 = true
	
		
# warning-ignore:unused_argument
func _on_slot1_body_exited(body):
	slot1 = false
	
# warning-ignore:unused_argument
func _on_slot2_body_exited(body):
	slot2 = false
# warning-ignore:unused_argument
func _on_slot3_body_exited(body):
	slot3 = false
# warning-ignore:unused_argument
func _on_slot4_body_exited(body):
	slot4 = false
# warning-ignore:unused_argument
func _on_slot5_body_exited(body):
	slot5 = false
# warning-ignore:unused_argument
func _on_slot6_body_exited(body):
	slot6 = false

func randomPos():
	startPos.shuffle()
	for i in startPos.size():
		
		words[i].currentPos = startPos[i].position
		words[i].move()
		words[i].shape.set_deferred("disabled", false)


func _on_reset_pressed():
	MusicController.sfxSoundcopy()
	randomPos()
	slot1item = null
	slot2item = null
	slot3item = null
	slot4item = null
	slot5item = null
	slot6item = null
func reset():
	randomPos()
	slot1item = null
	slot2item = null
	slot3item = null
	slot4item = null
	slot5item = null
	slot6item = null	
func masukkan(item):
	MusicController.sfxDop()
	if slot1 == true:
		if slot1item == null:
			slot1item = item
			slot1item.currentPos = pos1	
			slot1 = false
			slot1item.shape.set_deferred("disabled", true)
	elif slot2 == true:
		if slot2item == null:
			slot2item = item
			slot2item.currentPos = pos2	
			slot2 = false
			slot2item.shape.set_deferred("disabled", true)
		
	elif slot3:
		if slot3item == null:
			slot3item = item
			slot3item.currentPos = pos3
			slot3 = false
			
			slot3item.shape.set_deferred("disabled", true)
	elif slot4:
		if slot4item == null:
			slot4item = item
			slot4item.currentPos = pos4	
			slot4 = false
			slot4item.shape.set_deferred("disabled", true)
	elif slot5:
		if slot5item == null:
			slot5item = item
			slot5item.currentPos = pos5
			slot5 = false
			slot5item.shape.set_deferred("disabled", true)
	elif slot6:
		if slot6item == null:
			slot6item = item
			slot6item.currentPos = pos6
			slot6 = false
			slot6item.shape.set_deferred("disabled", true)
func _on_E_lepas():
	var E
	E = wordE
	masukkan(E)

func _on_S_lepas():
	var S
	S = wordS
	masukkan(S)


func _on_A2_lepas():
	var a
	a = wordA2
	masukkan(a)


func _on_A_lepas():
	var S
	S = wordA
	masukkan(S)

func _on_N_lepas():
	var S
	S = wordN
	masukkan(S)


func _on_P_lepas():
	var S
	S = wordP
	masukkan(S)


func _on_I_lepas():
	var S
	S = wordI
	masukkan(S)


func _on_V_lepas():
	var S
	S = wordV
	masukkan(S)

func _on_G_lepas():
	var S
	S = wordG
	masukkan(S)


func pick_random_state(state_list):
	
	state_list.shuffle()
	return state_list.pop_front()
