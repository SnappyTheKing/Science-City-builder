extends Resource
class_name Building

@export var name: String
@export var model: Array[PackedScene]
@export var upgrades: Array[Building]
@export var upgrade_cost: int


var parent: Node

func run():
	pass
