extends Node

var money = 0
var time = 300
var map: Array[Tile]


func get_tiles(pos: Vector2) -> Array[Node3D]:
	var list: Array[Node3D]
	for t in map:
		if t.find_child("Structure").get_child_count() and pos.distance_to(Vector2(t.position.x, t.position.z)) < 3 and pos != Vector2(t.position.x, t.position.z):
			print("Structure Found")
			list.append(t.find_child("Structure").get_child(0))
	
	return list

func count_all_stats():
	time = 300
	for t in map:
		if t.find_child("Structure").get_child_count():
			t.find_child("Structure").get_child(0).count_stats()

func enable_tooltip(b: Node3D):
	#var t = load("res://Scenes/tooltip.tscn").instantiate()
	
	#get_tree().get_current_scene().add_child(t)
	var t = get_tree().get_current_scene().find_child("Tooltip")
	
	var building: Building = b.building
	
	t.type.text = building.get_tooltip_text()
	
	t.visible = true

func disable_tooltip():
	var t = get_tree().get_current_scene().find_child("Tooltip")
	
	t.visible = false
