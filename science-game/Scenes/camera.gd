extends Camera3D

@export var move_speed : float = 5.0
@export var height_speed : float = 1.0
var camera_enabled: bool = true

var velocity : Vector3 = Vector3.ZERO

func _ready():
	rotation_degrees = Vector3(-45, 0, 0)  # 45 degrees downwards

func _process(delta):
	
	if !camera_enabled:
		return  # Skip movement if camera is disabled
	
	# Move the camera using WASD
	velocity = Vector3.ZERO

	if Input.is_action_pressed('forwards'):   # W key
		velocity.z -= 1
	if Input.is_action_pressed('backwards'):  # S key
		velocity.z += 1
	if Input.is_action_pressed('left'):  # A key
		velocity.x -= 1
	if Input.is_action_pressed('right'): # D key
		velocity.x += 1
	
	# Adjust height using E and Q
	if Input.is_action_pressed('up'):  # E key
		velocity.y += 1
	if Input.is_action_pressed('down'):  # Q key
		velocity.y -= 1
	
	# Normalize velocity to prevent diagonal speed boost
	velocity = velocity.normalized()

	# Apply movement
	global_transform.origin += velocity * move_speed * delta
	global_transform.origin.y = clamp(global_transform.origin.y, 0.3, 10)  # Don't allow going below ground
	#rotation_degrees += Vector3(0,)
