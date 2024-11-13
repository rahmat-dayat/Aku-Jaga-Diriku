extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func change_scene(path):
	self.play("change")
	yield(self, "animation_finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene(path)
	#Musiccontroller.play_end()
	self.play_backwards("change")
	#Musiccontroller.play_in()
	
func change_scene_to(path):
	self.play("change")
	yield(self, "animation_finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(path)
	#Musiccontroller.play_end()
	self.play_backwards("change")
	#Musiccontroller.play_in()
