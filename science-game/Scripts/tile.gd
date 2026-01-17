extends Node3D
class_name Tile

var building_scene = load("res://Scenes/building.tscn")
var building: BuildingScene



func _ready() -> void:
	pass


func _on_ground_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and position.y > 0:
			if($Structure.get_child_count()):
				building.chosen_upgrade = randi_range(0, len(building.building.upgrades)-1)
				if not building.buy_upgrade():
					return
			Global.ask_question(self)


func assign_type():
	if ($Structure.get_child_count()):
		building.upgrade()
		return
	
	building = building_scene.instantiate()
	
	building.building = load("res://Scenes/Buildings/house.tres").duplicate(true)
	building.building.parent = building
	$Structure.add_child(building)


func _on_ground_mouse_entered() -> void:
	if building:
		Global.enable_tooltip(building)

func _on_ground_mouse_exited() -> void:

	Global.disable_tooltip()
