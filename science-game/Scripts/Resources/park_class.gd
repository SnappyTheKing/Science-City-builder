class_name Park
extends Building

@export var discount: float = 10

func run():
	pass

func get_tooltip_text() -> String:
	var s := name
	s += "\nDiscount: " + str(discount) + "%"
	s += "\nUpgrade Cost: " + str(upgrade_cost * parent.costMult)
	return s
