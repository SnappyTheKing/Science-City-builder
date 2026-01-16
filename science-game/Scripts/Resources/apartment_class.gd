class_name Apartment
extends Building

@export var income: float = 50
@export var interval: float = 5

func run():
	var t = Timer.new()
	t.wait_time = interval
	t.autostart = true
	t.one_shot = false
	t.timeout.connect(timer_elapsed)
	parent.add_child(t)

func timer_elapsed():
	Global.money += income * parent.moneyMult

func get_tooltip_text() -> String:
	var s := name
	s += "\nIncome: " + str(income * parent.moneyMult) + " / " + str(interval) + "s"
	s += "\nUpgrade Cost: " + str(upgrade_cost * parent.costMult)
	return s
