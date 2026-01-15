extends Node3D
class_name Tile

var building_scene = load("res://Scenes/building.tscn")
var building: BuildingScene

func _ready() -> void:
	pass


func _on_ground_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and position.y > 0:
			assign_type()

func assign_type():
	if ($Building.get_child_count()):
		building.upgrade()
		return
	
	building = building_scene.instantiate()
	
	building.building = load("res://Scenes/Buildings/house.tres")
	building.building.parent = self
	$Building.add_child(building)
