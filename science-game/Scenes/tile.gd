extends Node3D

var house = preload("res://house.tscn")

func _ready() -> void:
	pass


func _on_ground_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			assign_type()

func assign_type():
	var h = house.instantiate()
	if($Building.get_child_count()):
		$Building.get_child(0).queue_free()
	$Building.add_child(h)
