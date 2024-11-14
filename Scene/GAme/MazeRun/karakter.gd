extends Navigation2D

export(float) var CHARACTER_SPEED = 400.0
var path = []
var soal_on = false

# The 'click' event is a custom input action defined in
# Project > Project Settings > Input Map tab
func _input(event):
	if event.is_action_pressed('left') and soal_on == false or event is InputEventScreenTouch and soal_on == false:
		
		MusicController.sfxSoundcopy()
		_update_navigation_path($KinematicBody2D.position, get_local_mouse_position())


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class
	# it returns a PoolVector2Array of points that lead you from the
	# start_position to the end_position
	path = get_simple_path(start_position, end_position, true)
	# The first point is always the start_position
	# We don't need it in this example as it corresponds to the character's position
	path.remove(0)
	set_process(true)


func _process(delta):
	var walk_distance = CHARACTER_SPEED * delta
	move_along_path(walk_distance)


func move_along_path(distance):
	var last_point = $KinematicBody2D.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])

		# the position to move to falls between two points
		if distance <= distance_between_points:
			$KinematicBody2D.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return

		# the position is past the end of the segment
		
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)

	# the character reached the end of the path
	$KinematicBody2D.position = last_point
	set_process(false)
