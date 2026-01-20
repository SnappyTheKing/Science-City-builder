class_name Store
extends Building

@export var productivity: float = 10

func run():
	pass

func get_tooltip_text() -> String:
	var s := name
	s += "\nMoney Boost: " + str(productivity) + "%"
	if upgrade_cost > 0:
		s += "\nUpgrade Cost: " + str(upgrade_cost * parent.costMult)
	return s
