extends Resource
class_name Building

@export var name: String
@export var question_pack: QuestionPack

@export var model: Array[PackedScene]
@export var upgrades: Array[Building]
@export var upgrade_cost: int


var parent: BuildingScene

func run():
	pass

func get_tooltip_text() -> String:
	return ""
