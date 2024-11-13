extends Area2D

var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite
export var value = "centang"
var currentPos = Vector2()
signal lepas

var boleh = false
export var pakaianNow = preload("res://Asset/goodTouch/12.png")
export var pakaianBoys = preload("res://Asset/goodTouch/12.png")
export var pakaianGirl= preload("res://Asset/goodTouch/12.png")
export var boy = false
func _ready():
	currentPos = position
	

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
			#$Sprite.scale = Vector2(0.3, 0.3)
		else:
			self.z_index = 1
			pass
			#$Sprite.scale = Vector2(0.5, 0.5)
func move():
	$Tween.interpolate_property(self, "position", position, currentPos, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()

func change():
	if boy == false:
		pakaianNow = pakaianGirl
		sprte.texture = pakaianGirl
	else:
		pakaianNow = pakaianBoys
		sprte.texture = pakaianBoys
