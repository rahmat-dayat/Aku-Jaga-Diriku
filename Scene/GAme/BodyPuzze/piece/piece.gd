extends KinematicBody2D

var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite
export var value = "a"
var currentPos = Vector2()
signal lepas
export var suara = preload("res://Asset/Body Puzzle/audio/Alis.mp3")
export var suara2 = false
func _ready():
	$AudioStreamPlayer.stream = suara
	currentPos = position


# warning-ignore:unused_argument
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset







# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_piece_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if can_grab == false:
			
			emit_signal("lepas")
			move()
			#$Sprite.scale = Vector2(0.3, 0.3)
		else:
			
			if $AudioStreamPlayer.playing == false:
				if suara2 == true:
		
					$AudioStreamPlayer.stream = load("res://Asset/Body Puzzle/audio/Mata.mp3")
					$AudioStreamPlayer.play()
				else:
					$AudioStreamPlayer.play()
					yield($AudioStreamPlayer,"finished")
			
			#$Sprite.scale = Vector2(0.5, 0.5)
func move():
	$Tween.interpolate_property(self, "position", position, currentPos, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
