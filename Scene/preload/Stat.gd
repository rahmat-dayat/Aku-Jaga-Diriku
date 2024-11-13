extends Node


var detik = 0 
var menit = 0
onready var TIMER = $Timer

var boy 
var sprite

func _on_Timer_timeout():
	detik += 1
	if detik > 59:
		menit += 1
		detik = 0
