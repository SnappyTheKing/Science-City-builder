extends RigidBody3D

# TODO Revamp so that the camera can be turned

@export var move_speed : float = 5.0
@export var height_speed : float = 1.0
var camera_enabled: bool = true

var velocity : Vector3 = Vector3.ZERO

func _ready():
	position = Vector3(25,6,40)
	rotation_degrees = Vector3(-35, 0, 0)  # 45 degrees downwards

func _process(delta):
	
	if !camera_enabled:
		return  # Skip movement if camera is disabled
	
	# Move the camera using WASD
	velocity = Vector3.ZERO

	if Input.is_action_pressed('forwards'):   # W key
		velocity.x -= sin(rotation.y)
		velocity.z -= cos(rotation.y)
	if Input.is_action_pressed('backwards'):  # S key
		velocity.x += sin(rotation.y)
		velocity.z += cos(rotation.y)
	if Input.is_action_pressed('left'):  # A key
		velocity.x += sin(rotation.y - PI/2)
		velocity.z += cos(rotation.y - PI/2)
	if Input.is_action_pressed('right'): # D key
		velocity.x += sin(rotation.y + PI/2)
		velocity.z += cos(rotation.y + PI/2)
	
	if Input.is_action_pressed('rotate_right'):  # E key
		rotation.y -= PI/100
	if Input.is_action_pressed('rotate_left'):  # Q key
		rotation.y += PI/100
	
	# Adjust height using E and Q
	if Input.is_action_pressed('up'):  # E key
		velocity.y += 1
	if Input.is_action_pressed('down'):  # Q key
		velocity.y -= 1
	
	# Normalize velocity to prevent diagonal speed boost
	velocity = velocity.normalized()
	velocity *= move_speed

	# Apply movement
	move_and_collide(velocity * delta)
	
	#global_transform.origin += velocity * move_speed * delta
	#global_transform.origin.y = clamp(global_transform.origin.y, 0.3, 10)  # Don't allow going below ground
	#rotation_degrees += Vector3(0,)
