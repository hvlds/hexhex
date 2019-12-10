extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 10
var angle = 0.1
var camera 

func _ready():
	camera = get_node("/root/World/CameraBody/Camera")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			if event.pressed:
				camera.translate(Vector3(0, 0, -1))
		if event.button_index == BUTTON_WHEEL_DOWN:
			if event.pressed:
				camera.translate(Vector3(0, 0, 1))

func _physics_process(delta):
	
	var angle_camera = (PI * 55) / 180
	# Move Camera
	if Input.is_action_pressed("ui_right"):
		camera.translate(Vector3(1, 0, 0))
	elif Input.is_action_pressed("ui_left"):
		camera.translate(Vector3(-1, 0, 0))

	if Input.is_action_pressed("ui_up"):
		camera.translate(Vector3(0, 1, -1))
	elif Input.is_action_pressed("ui_down"):
		camera.translate(Vector3(0, -1, 1))
	
	# Zoom
	if Input.is_action_pressed("scroll_up"):
		camera.translate(Vector3(0, 1, 1))
	elif Input.is_action_pressed("scroll_down"):
		camera.translate(Vector3(0, -1, -1))
	
	# Rotate Camera
	if Input.is_action_pressed("rotation_right"):
		var old_pos = global_transform.origin
		angle = 0.1
		var new_pos = Vector3(
			old_pos.x * cos(angle) + old_pos.z * sin(angle),
			old_pos.y,
			(-1) * old_pos.x * sin(angle) + old_pos.z * cos(angle) 
		)
		global_transform.origin = new_pos
		camera.rotate(Vector3(0, 1, 0), 0.1)
	elif Input.is_action_pressed("rotation_left"):
		var old_pos = global_transform.origin
		angle = -0.1
		var new_pos = Vector3(
			old_pos.x * cos(angle) + old_pos.z * sin(angle),
			old_pos.y,
			(-1) * old_pos.x * sin(angle) + old_pos.z * cos(angle) 
		)
		global_transform.origin = new_pos
		camera.rotate(Vector3(0, 1, 0), -0.1)
				