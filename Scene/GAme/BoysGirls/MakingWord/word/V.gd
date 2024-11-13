extends KinematicBody2D

var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite
export var value = "v"

var currentPos = Vector2()
var pos
signal lepas
var areaMasuk = false
onready var shape = $CollisionShape2D
func _ready():
	
	pass


# warning-ignore:unused_argument
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset






# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_word_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if can_grab == false:	
			emit_signal("lepas")
			move()
			self.z_index = 0
			
		else:
			$suara.play()
			self.z_index = 1

func move():
	$Tween.interpolate_property(self, "position", position, currentPos, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
