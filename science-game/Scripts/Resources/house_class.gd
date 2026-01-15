class_name House
extends Building

@export var income: float = 5
@export var interval: float = 3

func run():
	var t = Timer.new()
	t.wait_time = interval
	t.autostart = true
	t.one_shot = false
	t.timeout.connect(timer_elapsed)
	parent.add_child(t)

func timer_elapsed():
	Global.money += income * parent.moneyMult
