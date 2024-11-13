extends Node2D



var rambut = false
var mata = false
var alis = false
var mulut = false
var total = 0
var next = 0
func _ready():
	start()
	starting()
func starting():
	MusicController.BGM.volume_db = -10
	$narasi.play()
	yield($narasi,"finished")
	MusicController.sfxTring()
	$AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(0.5),"timeout")
	$narasi.stream = load("res://Asset/Body Puzzle/audio/Bermain Puzzle Bagian Kepala.mp3")
	$narasi.play()
	yield($narasi,"finished")
	yield(get_tree().create_timer(0.3),"timeout")
	$narasi.stream = preload("res://Asset/Body Puzzle/audio/Pasanglah_20Anggota_20Tubuh_20yang_20Ada_20Sesuai_20Dengan_20Posisinya.mp3")
	$narasi.play()
	


func start():
	$alis.currentPos = $alis.position
	$rambut.currentPos = $rambut.position
	$mata2.currentPos = $mata2.position
	$mulut.currentPos = $mulut.position




func _on_rambut_lepas():
	if  rambut == true:
		$body/Panel/karakter.texture = load("res://Asset/Body Puzzle/boy/Full Head.png")
		$rambut.hide()
		$mata2.show()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		next_game()
	else:
		MusicController.sfxSalah()
		$rambut.move()
		total = 0

func _on_alis_lepas():
	if  alis == true:
		$body/Panel/karakter.texture = load("res://Asset/Body Puzzle/boy/Bagian/alis+mata.png")
		$alis.hide()
		$mulut.show()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		next_game()
	else:
		MusicController.sfxSalah()
		$alis.move()
		total = 0

func _on_mata2_lepas():
	if  mata == true:
		$body/Panel/karakter.texture = load("res://Asset/Body Puzzle/boy/Bagian/rambut+mata.png")
		$mata2.hide()
		$alis.show()
		$effect.emitting = true
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		next_game()
	else:
		$mata2.move()
		total = 0
		MusicController.sfxSalah()
func _on_mulut_lepas():
	if  mulut == true:
		$effect.emitting = true
		$mulut.hide()
		$body/Panel/karakter2.show()
		total += 1
		hasilSfx()
		MusicController.sfxTring()
		next += 1
		next_game()
	else:
		$mulut.move()
		total = 0
		MusicController.sfxSalah()
func _on_rambut_area_entered(area):
	rambut = true
# warning-ignore:unused_argument
func _on_rambut_area_exited(area):
	rambut = false


# warning-ignore:unused_argument
func _on_alis_area_entered(area):
	alis = true

# warning-ignore:unused_argument
func _on_alis_area_exited(area):
	alis = false

# warning-ignore:unused_argument
func _on_mata_area_entered(area):
	mata = true
# warning-ignore:unused_argument
func _on_mata_area_exited(area):
	mata = false

# warning-ignore:unused_argument
func _on_mulut_area_entered(area):
	mulut = true
# warning-ignore:unused_argument
func _on_mulut_area_exited(area):
	mulut = false


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

func next_game():
	if next == 4:
		yield(get_tree().create_timer(1),"timeout")
		MusicController.tring_next("res://Scene/GAme/BodyPuzze/bodyPuzzle2.tscn")
