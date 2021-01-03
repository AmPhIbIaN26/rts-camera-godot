extends Spatial

export(float) var area_percent = 0.1
export(int) var acc = 10
export(int) var dec = 25
export(int) var MAX_SPEED = 100
export(int) var ang_acc = 3
export(int) var ang_dec = 8
export(int) var MAX_ANG_SPEED = 50
export(float) var MOUSE_SENSITIVITY = 0.001

var angl = -1
var angr = 1
var speed = 0
var pos = Vector2(0,0)
var crsr = Vector2(0,0)
var dir = Vector3(0, 0, 0)

func _ready():
	set_process(true)	
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
func _input(event):
	if event is InputEventMouseMotion: 
		crsr = event.position
		
	if event is InputEventMouseButton and Input.is_mouse_button_pressed(BUTTON_MIDDLE):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		

	
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		self.rotate_y(event.relative.x * MOUSE_SENSITIVITY)

func _process(delta):
	var pos = get_viewport().get_visible_rect()
	
	var new_dir := Vector3.ZERO
	if mouse_in:
		if (crsr.x < int(pos.size.x*area_percent)):
			new_dir.x -= 1
		if (crsr.x > (pos.size.x-(pos.size.x*area_percent))):
			new_dir.x += 1
		if (crsr.y < int(pos.size.y*area_percent)):
			new_dir.z -= 1
		if (crsr.y > (pos.size.y-(pos.size.y*area_percent))):
			new_dir.z += 1
	
	if OS.is_window_focused():
		if Input.is_key_pressed(KEY_A):
			new_dir.x -= 1
		if Input.is_key_pressed(KEY_D):
			new_dir.x += 1
		if Input.is_key_pressed(KEY_W):
			new_dir.z -= 1
		if Input.is_key_pressed(KEY_S):
			new_dir.z += 1

	if new_dir.length() > 1:
		new_dir = new_dir.normalized()
	
	if new_dir and OS.is_window_focused():
		dir = new_dir
		speed += acc * delta
	else:
		speed -= dec * delta
	speed = clamp(speed,0,MAX_SPEED)
	translate_object_local(dir*delta*speed)
		
	if Input.is_key_pressed(KEY_E):
		
		angr += ang_acc * delta
		angr = clamp(angr,0,MAX_ANG_SPEED)
		rotate_y(angr*delta)
		
		
	elif Input.is_key_pressed(KEY_Q):
		
		angl += ang_acc * delta
		angl = clamp(angl,0,MAX_ANG_SPEED)
		rotate_y(-angl*delta)
		

	else:
		
		angr -= ang_dec * delta
		angr = clamp(angr,0,MAX_ANG_SPEED)
		rotate_y(angr*delta)
		angl -= ang_dec * delta
		angl = clamp(angl,0,MAX_ANG_SPEED)
		rotate_y(-angl*delta)		
