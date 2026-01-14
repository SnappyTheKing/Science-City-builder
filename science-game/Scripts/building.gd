extends Node3D

var building: Building

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_mesh()
	building.run()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_mesh():
	var selected = building.model[randi_range(0, len(building.model)-1)].instantiate()
	add_child(selected)
