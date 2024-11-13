extends TextureButton

export var word = "v"

var V = preload("res://Asset/BoysGirls/makingWord/V Button.png")
var A = preload("res://Asset/BoysGirls/makingWord/A Button.png")
var G = preload("res://Asset/BoysGirls/makingWord/G Button.png")
var I = preload("res://Asset/BoysGirls/makingWord/I Button.png")
var N = preload("res://Asset/BoysGirls/makingWord/N Button.png")
var P = preload("res://Asset/BoysGirls/makingWord/P Button.png")
var E = preload("res://Asset/BoysGirls/makingWord/E Button.png")
var S = preload("res://Asset/BoysGirls/makingWord/S Button.png")
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func change():
	if word == "v":
		self.texture_normal = V
	elif word == "a":
		self.texture_normal = A
	elif word == "g":
		self.texture_normal = G
	elif word == "i":
		self.texture_normal = I
	elif word == "n":
		self.texture_normal = N
	elif word == "p":
		self.texture_normal = P	
	elif word == "e":
		self.texture_normal = E
	elif word == "s":
		self.texture_normal = S

func masuk():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1, 1), Vector2(0, 0), 0.2, Tween.TRANS_BACK,Tween.EASE_OUT)
	$Tween.start()
	
func keluar():
	$Tween.interpolate_property(self, "rect_scale", Vector2(0, 0), Vector2(1, 1), 0.2, Tween.TRANS_BACK,Tween.EASE_OUT)
	$Tween.start()
