extends Camera

export(float) var zoom_factor = 1
export(int) var max_zoom = 15
export(int) var min_zoom = 7

var dir = Vector3(0,0,0)
var loc = transform.origin

	
func _input(event):
	loc = transform.origin

	if event is InputEventMouseButton:
		dir = Vector3(0,0,0)
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				if loc.z > min_zoom:
					dir.z -= 1
					translate(dir*zoom_factor)

			elif event.button_index == BUTTON_WHEEL_DOWN:
				if loc.z < max_zoom:
					dir.z += 1
					translate(dir*zoom_factor)
