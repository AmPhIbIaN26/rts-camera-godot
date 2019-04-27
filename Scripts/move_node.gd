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
var dir = Vector3(0,0,0)
var pos = Vector2(0,0)
var crsr = Vector2(0,0)

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
	pos = get_viewport().size
	
	if (crsr.x < int(pos.x*area_percent)) or Input.is_key_pressed(KEY_A):

		dir = Vector3(0,0,0)
		dir.x += 1
		speed += acc * delta
		speed = clamp(speed,0,MAX_SPEED)
		translate(dir*delta*speed)
	
	elif (crsr.x > (pos.x-(pos.x*area_percent))) or Input.is_key_pressed(KEY_D):

		dir = Vector3(0,0,0)
		dir.x -= 1
		speed += acc * delta
		speed = clamp(speed,0,MAX_SPEED)
		translate(dir*delta*speed)
	
	elif (crsr.y < int(pos.y*area_percent)) or Input.is_key_pressed(KEY_W):

		dir = Vector3(0,0,0)
		dir.z += 1
		speed += acc * delta
		speed = clamp(speed,0,MAX_SPEED)
		translate(dir*delta*speed)
	
	elif (crsr.y > (pos.y-(pos.y*area_percent))) or Input.is_key_pressed(KEY_S):

		dir = Vector3(0,0,0)
		dir.z -= 1
		speed += acc * delta
		speed = clamp(speed,0,MAX_SPEED)
		translate(dir*delta*speed)
	
	else:

		speed -= dec * delta
		speed = clamp(speed,0,MAX_SPEED)
		translate(dir*delta*speed)
		
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
