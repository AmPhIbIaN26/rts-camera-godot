extends ClippedCamera

export(float) var zoom_factor = 1
export(int) var max_zoom = 50
export(int) var min_zoom = 5
export(bool) var invert_zooming = true
export(bool) var invert_rotation = false
export(bool) var zoom_to_cursor = true
export(bool) var enable_rotations = false
export(int) var rotation_max_speed = 100
export(int) var ang_acc = 1
export(int) var ang_dec = 5
export(float) var MOUSE_SENSITIVITY = 0.001

var previous_loc = Vector3.ZERO
var zoom = 3
var ang_ud_speed = 0 # angle up down speed
var ang_lr_speed = 0 # angle left right speed
var ud_dir = Vector3()
var lr_dir = Vector3()

func _input(event):
	if event is InputEventScreenPinch:
		if event.relative < 0: # zoom in
#			print(event.relative / 64)
			zoom -= round(event.relative / 64) * (1 if invert_zooming else -1)
		elif event.relative > 0: # zoom out
			zoom += round(event.relative / 64) * (-1 if invert_zooming else 1)
		previous_loc = transform.origin
		zoom = clamp(zoom, min_zoom, max_zoom)
	
	if event is InputEventMouseMotion:
		if event.is_action_released("camera_look_around") and Input.is_key_pressed(KEY_SHIFT):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and Input.is_key_pressed(KEY_SHIFT):
		global_rotate(Vector3(0, 1, 0), event.relative.y * MOUSE_SENSITIVITY)


func _process(delta: float) -> void:
	if get_parent().get_parent().is_panning:
		return
	if Input.is_action_pressed("camera_zoom_in"):
		zoom -= 1
	elif Input.is_action_pressed("camera_zoom_out"):
		zoom += 1
	previous_loc = transform.origin
	var pointing_at = _get_3D_mouse_pos()
	zoom = clamp(zoom, min_zoom, max_zoom)
	if previous_loc.z != lerp(translation.z, zoom, zoom_factor * delta):
		translation.z = lerp(translation.z, zoom, zoom_factor * delta)
	
	if zoom_to_cursor and pointing_at:
		realign_camera(pointing_at)
	
	var new_ud_dir = Vector3()
	var new_lr_dir = Vector3()
	# rotations
	if enable_rotations:
		if Input.is_action_pressed("camera_rotate_up"):
			new_ud_dir.x = 1
		elif Input.is_action_pressed("camera_rotate_down"):
			new_ud_dir.x = -1
		
		if Input.is_action_pressed("camera_rotate_left"):
			new_lr_dir.y = 1
		elif Input.is_action_pressed("camera_rotate_right"):
			new_lr_dir.y = -1
		
		if new_ud_dir and OS.is_window_focused():
			ud_dir = new_ud_dir
			ang_ud_speed += ang_acc * delta
		else:
			ang_ud_speed -= ang_dec * delta
			
		if new_lr_dir and OS.is_window_focused():
			lr_dir = new_lr_dir
			ang_lr_speed += ang_acc * delta
		else:
			ang_lr_speed -= ang_dec * delta
	
		ang_lr_speed = clamp(ang_lr_speed, 0, rotation_max_speed)
		ang_ud_speed = clamp(ang_ud_speed, 0, rotation_max_speed)
		
		if ud_dir:
			global_rotate(-ud_dir, ang_ud_speed*delta)
		if lr_dir:
			global_rotate(lr_dir, ang_lr_speed*delta)
		
	
func _get_3D_mouse_pos():
	var mouse_pointer = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_pointer)
	var to = from + project_ray_normal(mouse_pointer) * 1000
	return get_world().direct_space_state.intersect_ray(from, to).get('position')

func realign_camera(pointing_at):
	var new_point = _get_3D_mouse_pos()
#	print(new_point)
	if new_point:
		get_parent().get_parent().translation += pointing_at - new_point
