extends Node2D

enum {
	boys,
	girls
}

var gender = boys

enum {
	centang,
	silang
}
var current = silang
var depan = 0

var touch = false
var notTouch = false


var kepala = false
var dada = false
var tangan = false
var kemaluan = false
var mulut = false
var pantat = false

var silangOBJ = preload("res://Scene/GAme/goodTouch/silang.tscn")
var silangItem = null
var total = 0
func _ready():
		MusicController.BGM.volume_db = -10
		starting()
		randomize()
		gender = pick_random_state([boys, girls])
		match gender:
			boys:
				$Panah.position = Vector2(455, 300)
			girls:
				$Panah.position = Vector2(452, 305)
				$Control/karakterDepan.texture = load("res://Asset/goodTouch/Perempuan Good Touch Depan.png")
				$Control/karakterBelakang.texture = load("res://Asset/goodTouch/Perempuan Good Touch Belakang.png")
	

func starting():
	$starting2.play()
	yield($starting2,"finished")
	$AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(0.5),"timeout")
	$Panah.show()
	$Panah4.show()
	$Panah3.show()
	$Panah2.show()
	$Panah5.show()
	$Panah6.show()
	silangSpawn()
	$starting2.stream = preload("res://Asset/goodTouch/audio/Letakkan_20Tanda_20Silang_20di_20Bagian_20yang_20Tidak_20Boleh_20Disentuh.mp3")
	$starting2.play()
	yield($starting2,"finished")
	yield(get_tree().create_timer(0.3),"timeout")
	$starting2 .stream = preload("res://Asset/goodTouch/audio/Bagian_20Tubuh_20yang_20Tidak_20Boleh_20di_20Sentuh.mp3")
	$starting2.play()
	yield($starting2,"finished")
	yield(get_tree().create_timer(0.3),"timeout")
	$starting2 .stream = preload("res://Asset/goodTouch/audio/Jadi_2C_20Bagian-bagian_20Itu_20Tidak_20Boleh.mp3")
	$starting2.play()
func disappear(lokasi):
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(1,1), Vector2(0,0), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()
		
# warning-ignore:unused_argument
func _on_kepala_body_entered(body):
	mulut = true
# warning-ignore:unused_argument
func _on_kepala_body_exited(body):
	mulut = false


# warning-ignore:unused_argument
func _on_dada_body_entered(body):
	dada = true
# warning-ignore:unused_argument
func _on_dada_body_exited(body):
	dada = false


# warning-ignore:unused_argument
func _on_tangan_body_entered(body):
	tangan = true
# warning-ignore:unused_argument
func _on_tangan_body_exited(body):
	tangan = false


# warning-ignore:unused_argument
func _on_Kemaluan_body_entered(body):
	kemaluan = true
# warning-ignore:unused_argument
func _on_Kemaluan_body_exited(body):
	kemaluan = false


# warning-ignore:unused_argument
func _on_kepala2_body_exited(body):
	kepala = false
# warning-ignore:unused_argument
func _on_kepala2_body_entered(body):
	kepala = true


# warning-ignore:unused_argument
func _on_pantat_body_entered(body):	
	pantat = true
# warning-ignore:unused_argument
func _on_pantat_body_exited(body):
	pantat = false





	



func silangSpawn():
	var a  = silangOBJ.instance()
	a.position = $object/silang.position
	a.connect("lepas", self, "silangLepas" )
	$object.add_child(a)
	silangItem = a
	
func silangLepas():
	if mulut == true:
		$AREA/mulut/CollisionShape2D.set_deferred("disabled", true)
		silangItem.currentPos = $AREA/mulut.position
		silangItem.shape.set_deferred("disabled", true)
		MusicController.sfxDop()
		silangItem = null
		mulut = false
		total += 1
		next_game()
		silangSpawn()
	elif dada == true:
		$AREA/dada/CollisionShape2D.set_deferred("disabled", true)
		silangItem.currentPos = $AREA/dada.position
		silangItem.shape.set_deferred("disabled", true)
		MusicController.sfxDop()
		silangItem = null
		dada = false
		total += 1
		next_game()
		silangSpawn()
	elif tangan == true:
		$AudioStreamPlayer.play()
		tangan = false
		
	elif kemaluan == true:
		$AREA/Kemaluan/CollisionShape2D.set_deferred("disabled", true)
		silangItem.currentPos = $AREA/Kemaluan.position
		silangItem.shape.set_deferred("disabled", true)
		silangItem = null
		kemaluan = false
		total += 1
		MusicController.sfxDop()
		next_game()
		silangSpawn()
	elif pantat == true:
		$AREA/pantat/CollisionShape2D.set_deferred("disabled", true)
		silangItem.currentPos = $AREA/pantat.position
		silangItem.shape.set_deferred("disabled", true)
		silangItem = null
		pantat = false
		total += 1
		MusicController.sfxDop()
		next_game()
		silangSpawn()
		
	elif kepala == true:
		kepala = false
		$AudioStreamPlayer.play()
	

func next_game():
	if total == 4:
		MusicController.tring_next("res://Scene/GAme/MazeRun/mazeRun.tscn")
		
func pick_random_state(state_list):
	
	state_list.shuffle()
	return state_list.pop_front()
