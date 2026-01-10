extends Node3D

@export var variant: HouseVariant

func _ready():
	if variant == null:
		push_warning("House variant not assigned")
		return

	# Remove old visuals (if any)
	for child in $Visual.get_children():
		child.queue_free()

	# Instantiate model
	var model_instance := variant.model.instantiate()
	$Visual.add_child(model_instance)
