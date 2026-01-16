extends Node3D
class_name BuildingScene

var building: Building

var moneyMult: float = 1
var costMult: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()
	Global.count_all_stats()
	Global.enable_tooltip(self)

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
	if (building.upgrade_cost < 0 or Global.money < building.upgrade_cost*costMult):
		return
	Global.money -= building.upgrade_cost * costMult
	
	var temp_parent = building.parent
	building = building.upgrades[randi_range(0, len(building.upgrades)-1)].duplicate_deep()
	building.parent = temp_parent
	
	update()
	Global.count_all_stats()
	Global.enable_tooltip(self)

func count_stats():
	moneyMult = 1
	costMult = 1
	
	if building is Factory:
		Global.time += building.extra_time
	
	for b in Global.get_tiles(Vector2(get_parent().get_parent().position.x, get_parent().get_parent().position.z)):
		if b.building is Store:
			moneyMult *= 1 + b.building.productivity/100
		if b.building is Park and building.upgrade_cost > 0:
			costMult *= 1 - (b.building.discount/100)
