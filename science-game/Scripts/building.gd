extends Node3D

var building: Building

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update():
	for node in get_children():
		remove_child(node)
	set_mesh()
	building.run()

func set_mesh():
	var selected = building.model[randi_range(0, len(building.model)-1)].instantiate()
	add_child(selected)

func upgrade():
	if (building.upgrade_cost < 0 or Global.money < building.upgrade_cost):
		return
	Global.money -= building.upgrade_cost
	
	var temp_parent = building.parent
	building = building.upgrades[randi_range(0, len(building.upgrades)-1)]
	building.parent = temp_parent
	update()
