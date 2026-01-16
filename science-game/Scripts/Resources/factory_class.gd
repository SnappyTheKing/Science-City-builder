class_name Factory
extends Building

@export var extra_time: float = 5

func run():
	pass

func get_tooltip_text() -> String:
	var s := name
	s += "\nExtra Time: " + str(extra_time)
	s += "\nUpgrade Cost: " + str(upgrade_cost * parent.costMult)
	return s
